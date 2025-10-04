// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => _ChatMessage(
  role: json['role'] as String,
  content: json['content'] as String,
  id: json['id'] as String?,
  toolCalls: (json['tool_calls'] as List<dynamic>?)
      ?.map((e) => ToolCall.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ChatMessageToJson(_ChatMessage instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
      'id': instance.id,
      'tool_calls': instance.toolCalls,
      'created_at': instance.createdAt?.toIso8601String(),
    };

_ToolCall _$ToolCallFromJson(Map<String, dynamic> json) => _ToolCall(
  name: json['name'] as String,
  arguments: json['arguments'] as Map<String, dynamic>,
  result: json['result'] as String,
);

Map<String, dynamic> _$ToolCallToJson(_ToolCall instance) => <String, dynamic>{
  'name': instance.name,
  'arguments': instance.arguments,
  'result': instance.result,
};

_ChatRequest _$ChatRequestFromJson(Map<String, dynamic> json) => _ChatRequest(
  message: json['message'] as String,
  sessionId: json['session_id'] as String?,
  conversationHistory:
      (json['conversation_history'] as List<dynamic>?)
          ?.map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$ChatRequestToJson(_ChatRequest instance) =>
    <String, dynamic>{
      'message': instance.message,
      'session_id': instance.sessionId,
      'conversation_history': instance.conversationHistory,
    };

_ChatResponse _$ChatResponseFromJson(Map<String, dynamic> json) =>
    _ChatResponse(
      success: json['success'] as bool,
      response: json['response'] as String,
      error: json['error'] as String? ?? '',
      toolCalls:
          (json['tool_calls'] as List<dynamic>?)
              ?.map((e) => ToolCall.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      sessionId: json['session_id'] as String?,
    );

Map<String, dynamic> _$ChatResponseToJson(_ChatResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'response': instance.response,
      'error': instance.error,
      'tool_calls': instance.toolCalls,
      'session_id': instance.sessionId,
    };

_ChatSession _$ChatSessionFromJson(Map<String, dynamic> json) => _ChatSession(
  id: json['id'] as String,
  title: json['title'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  isActive: json['is_active'] as bool,
  messagesCount: (json['messages_count'] as num).toInt(),
  lastMessage: json['last_message'] == null
      ? null
      : ChatMessage.fromJson(json['last_message'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ChatSessionToJson(_ChatSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'is_active': instance.isActive,
      'messages_count': instance.messagesCount,
      'last_message': instance.lastMessage,
    };

_ChatSessionDetail _$ChatSessionDetailFromJson(Map<String, dynamic> json) =>
    _ChatSessionDetail(
      id: json['id'] as String,
      title: json['title'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      isActive: json['is_active'] as bool,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatSessionDetailToJson(_ChatSessionDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'is_active': instance.isActive,
      'messages': instance.messages,
    };
