import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:lumo_app/core/data/api_client.dart';
import 'package:lumo_app/core/utils/app_logger.dart';
import '../datasources/chat_api.dart';
import '../models/chat_models.dart';
import '../../domain/entities/message.dart';

sealed class ChatStreamEvent {}

class ChatStreamSessionId extends ChatStreamEvent {
  final String sessionId;
  ChatStreamSessionId(this.sessionId);
}

class ChatStreamToolStart extends ChatStreamEvent {
  final String message;
  ChatStreamToolStart(this.message);
}

class ChatStreamContent extends ChatStreamEvent {
  final String chunk;
  final String accumulated;
  ChatStreamContent(this.chunk, this.accumulated);
}

class ChatStreamDone extends ChatStreamEvent {
  final Message message;
  final String? sessionId;
  ChatStreamDone(this.message, this.sessionId);
}

class ChatStreamError extends ChatStreamEvent {
  final String error;
  ChatStreamError(this.error);
}

extension ChatStreamEventFactory on ChatStreamEvent {
  static ChatStreamEvent sessionId(String id) => ChatStreamSessionId(id);
  static ChatStreamEvent toolStart(String msg) => ChatStreamToolStart(msg);
  static ChatStreamEvent content(String chunk, String accumulated) =>
      ChatStreamContent(chunk, accumulated);
  static ChatStreamEvent done(Message msg, String? sessionId) =>
      ChatStreamDone(msg, sessionId);
  static ChatStreamEvent error(String err) => ChatStreamError(err);
}

class ChatRepository {
  late final ChatApi _chatApi;

  ChatRepository() {
    _chatApi = ChatApi(ApiClient.instance);
  }

  Stream<ChatStreamEvent> sendMessageStream(
    String message, {
    String? sessionId,
  }) async* {
    try {
      final request = ChatRequest(
        message: message,
        sessionId: sessionId,
        conversationHistory: [],
      );

      final dio = ApiClient.instance;
      final response = await dio.post<ResponseBody>(
        '/chat/ai-chat-stream/',
        data: request.toJson(),
        options: Options(
          responseType: ResponseType.stream,
          headers: {'Accept': 'text/event-stream'},
        ),
      );

      String? currentSessionId = sessionId;
      String accumulatedContent = '';
      List<MessageToolCall> toolCalls = [];

      final stream = response.data!.stream
          .transform(
            StreamTransformer<Uint8List, String>.fromHandlers(
              handleData: (data, sink) {
                sink.add(utf8.decode(data));
              },
            ),
          )
          .transform(const LineSplitter());

      await for (final chunk in stream) {
        if (chunk.isEmpty || !chunk.startsWith('data: ')) continue;

        try {
          final jsonData = chunk.substring(6);
          final data = json.decode(jsonData) as Map<String, dynamic>;

          final eventType = data['type'] as String?;

          switch (eventType) {
            case 'session_id':
              currentSessionId = data['session_id'] as String?;
              if (currentSessionId != null) {
                yield ChatStreamSessionId(currentSessionId);
              }
              break;

            case 'tool_start':
              yield ChatStreamToolStart(
                data['message'] as String? ?? 'Executing tools...',
              );
              break;

            case 'tool_calls':
              final toolCallsData = data['tool_calls'] as List<dynamic>? ?? [];
              toolCalls = toolCallsData
                  .map(
                    (tc) => MessageToolCall(
                      name: tc['name'] as String,
                      arguments: tc['arguments'] as Map<String, dynamic>,
                      result: tc['result'] as String,
                    ),
                  )
                  .toList();
              break;

            case 'content':
              final content = data['content'] as String? ?? '';
              accumulatedContent += content;
              yield ChatStreamContent(content, accumulatedContent);
              break;

            case 'done':
              final message = Message(
                role: 'assistant',
                content: accumulatedContent,
                timestamp: DateTime.now(),
                toolCalls: toolCalls,
              );
              yield ChatStreamDone(message, currentSessionId);
              break;

            case 'error':
              yield ChatStreamError(
                data['error'] as String? ?? 'Unknown error',
              );
              break;
          }
        } catch (e) {
          AppLogger.error('Failed to parse SSE chunk', error: e);
        }
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to send streaming message',
        error: e,
        stackTrace: stackTrace,
      );
      yield ChatStreamError('Failed to send message. Please try again.');
    }
  }

  Future<ChatResult> sendMessage(
    String message, {
    String? sessionId,
    List<Message> conversationHistory = const [],
  }) async {
    try {
      final request = ChatRequest(
        message: message,
        sessionId: sessionId,
        conversationHistory: [],
      );

      final response = await _chatApi.sendMessage(request);

      if (response.success) {
        final assistantMessage = Message(
          role: 'assistant',
          content: response.response,
          timestamp: DateTime.now(),
          toolCalls: response.toolCalls
              .map(
                (tc) => MessageToolCall(
                  name: tc.name,
                  arguments: tc.arguments,
                  result: tc.result,
                ),
              )
              .toList(),
        );

        return ChatResult.success(
          message: assistantMessage,
          sessionId: response.sessionId,
        );
      } else {
        return ChatResult.error(response.error);
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to send message',
        error: e,
        stackTrace: stackTrace,
      );
      return ChatResult.error('Failed to send message. Please try again.');
    }
  }

  Future<List<ChatSession>> getChatSessions() async {
    try {
      return await _chatApi.getChatSessions();
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to get chat sessions',
        error: e,
        stackTrace: stackTrace,
      );
      return [];
    }
  }

  Future<ChatSessionDetail?> getChatSession(String sessionId) async {
    try {
      return await _chatApi.getChatSession(sessionId);
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to get chat session',
        error: e,
        stackTrace: stackTrace,
      );
      return null;
    }
  }

  Future<bool> deleteChatSession(String sessionId) async {
    try {
      await _chatApi.deleteChatSession(sessionId);
      return true;
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete chat session',
        error: e,
        stackTrace: stackTrace,
      );
      return false;
    }
  }

  Future<ChatSession?> renameChatSession(String sessionId, String newTitle) async {
    try {
      return await _chatApi.renameChatSession(sessionId, {'title': newTitle});
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to rename chat session',
        error: e,
        stackTrace: stackTrace,
      );
      return null;
    }
  }

  Future<ChatSession?> archiveChatSession(String sessionId) async {
    try {
      return await _chatApi.archiveChatSession(sessionId);
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to archive chat session',
        error: e,
        stackTrace: stackTrace,
      );
      return null;
    }
  }

  Future<ChatSession?> unarchiveChatSession(String sessionId) async {
    try {
      return await _chatApi.unarchiveChatSession(sessionId);
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to unarchive chat session',
        error: e,
        stackTrace: stackTrace,
      );
      return null;
    }
  }

  Future<List<ChatSession>> getArchivedSessions() async {
    try {
      return await _chatApi.getArchivedSessions();
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to get archived sessions',
        error: e,
        stackTrace: stackTrace,
      );
      return [];
    }
  }

  Future<bool> deleteAllSessions() async {
    try {
      await _chatApi.deleteAllSessions();
      return true;
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete all sessions',
        error: e,
        stackTrace: stackTrace,
      );
      return false;
    }
  }
}

class ChatResult {
  final Message? message;
  final String? error;
  final bool isSuccess;
  final String? sessionId;

  ChatResult._({
    this.message,
    this.error,
    required this.isSuccess,
    this.sessionId,
  });

  factory ChatResult.success({required Message message, String? sessionId}) =>
      ChatResult._(message: message, sessionId: sessionId, isSuccess: true);

  factory ChatResult.error(String error) =>
      ChatResult._(error: error, isSuccess: false);
}
