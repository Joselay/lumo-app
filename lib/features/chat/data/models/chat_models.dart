import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_models.freezed.dart';
part 'chat_models.g.dart';

@freezed
abstract class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String role,
    required String content,
    String? id,
    @JsonKey(name: 'tool_calls') List<ToolCall>? toolCalls,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}

@freezed
abstract class ToolCall with _$ToolCall {
  const factory ToolCall({
    required String name,
    required Map<String, dynamic> arguments,
    required String result,
  }) = _ToolCall;

  factory ToolCall.fromJson(Map<String, dynamic> json) =>
      _$ToolCallFromJson(json);
}

@freezed
abstract class ChatRequest with _$ChatRequest {
  const factory ChatRequest({
    required String message,
    @JsonKey(name: 'session_id') String? sessionId,
    @Default([]) @JsonKey(name: 'conversation_history') List<ChatMessage> conversationHistory,
  }) = _ChatRequest;

  factory ChatRequest.fromJson(Map<String, dynamic> json) =>
      _$ChatRequestFromJson(json);
}

@freezed
abstract class ChatResponse with _$ChatResponse {
  const factory ChatResponse({
    required bool success,
    required String response,
    @Default('') String error,
    @Default([]) @JsonKey(name: 'tool_calls') List<ToolCall> toolCalls,
    @JsonKey(name: 'session_id') String? sessionId,
  }) = _ChatResponse;

  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);
}

@freezed
abstract class ChatSession with _$ChatSession {
  const factory ChatSession({
    required String id,
    required String title,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'messages_count') required int messagesCount,
    @JsonKey(name: 'last_message') ChatMessage? lastMessage,
  }) = _ChatSession;

  factory ChatSession.fromJson(Map<String, dynamic> json) =>
      _$ChatSessionFromJson(json);
}

@freezed
abstract class ChatSessionDetail with _$ChatSessionDetail {
  const factory ChatSessionDetail({
    required String id,
    required String title,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'is_active') required bool isActive,
    required List<ChatMessage> messages,
  }) = _ChatSessionDetail;

  factory ChatSessionDetail.fromJson(Map<String, dynamic> json) =>
      _$ChatSessionDetailFromJson(json);
}
