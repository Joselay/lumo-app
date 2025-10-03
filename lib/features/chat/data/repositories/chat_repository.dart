import 'package:lumo_app/core/data/api_client.dart';
import 'package:lumo_app/core/utils/app_logger.dart';
import '../datasources/chat_api.dart';
import '../models/chat_models.dart';
import '../../domain/entities/message.dart';

class ChatRepository {
  late final ChatApi _chatApi;

  ChatRepository() {
    _chatApi = ChatApi(ApiClient.instance);
  }

  Future<ChatResult> sendMessage(
    String message,
    List<Message> conversationHistory,
  ) async {
    try {
      final request = ChatRequest(
        message: message,
        conversationHistory: conversationHistory
            .map((m) => ChatMessage(role: m.role, content: m.content))
            .toList(),
      );

      final response = await _chatApi.sendMessage(request);

      if (response.success) {
        final assistantMessage = Message(
          role: 'assistant',
          content: response.response,
          timestamp: DateTime.now(),
          toolCalls: response.toolCalls
              .map((tc) => MessageToolCall(
                    name: tc.name,
                    arguments: tc.arguments,
                    result: tc.result,
                  ))
              .toList(),
        );

        return ChatResult.success(assistantMessage);
      } else {
        return ChatResult.error(response.error);
      }
    } catch (e, stackTrace) {
      AppLogger.error('Failed to send message', error: e, stackTrace: stackTrace);
      return ChatResult.error('Failed to send message. Please try again.');
    }
  }
}

class ChatResult {
  final Message? message;
  final String? error;
  final bool isSuccess;

  ChatResult._({
    this.message,
    this.error,
    required this.isSuccess,
  });

  factory ChatResult.success(Message message) => ChatResult._(
        message: message,
        isSuccess: true,
      );

  factory ChatResult.error(String error) => ChatResult._(
        error: error,
        isSuccess: false,
      );
}
