import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String role; // 'user' or 'assistant'
  final String content;
  final DateTime timestamp;
  final List<MessageToolCall> toolCalls;

  const Message({
    required this.role,
    required this.content,
    required this.timestamp,
    this.toolCalls = const [],
  });

  bool get isUser => role == 'user';
  bool get isAssistant => role == 'assistant';
  bool get hasToolCalls => toolCalls.isNotEmpty;

  @override
  List<Object?> get props => [role, content, timestamp, toolCalls];
}

class MessageToolCall extends Equatable {
  final String name;
  final Map<String, dynamic> arguments;
  final String result;

  const MessageToolCall({
    required this.name,
    required this.arguments,
    required this.result,
  });

  @override
  List<Object?> get props => [name, arguments, result];
}
