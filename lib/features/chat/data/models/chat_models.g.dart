// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => _ChatMessage(
  role: json['role'] as String,
  content: json['content'] as String,
);

Map<String, dynamic> _$ChatMessageToJson(_ChatMessage instance) =>
    <String, dynamic>{'role': instance.role, 'content': instance.content};

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
  conversationHistory:
      (json['conversation_history'] as List<dynamic>?)
          ?.map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$ChatRequestToJson(_ChatRequest instance) =>
    <String, dynamic>{
      'message': instance.message,
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
    );

Map<String, dynamic> _$ChatResponseToJson(_ChatResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'response': instance.response,
      'error': instance.error,
      'tool_calls': instance.toolCalls,
    };
