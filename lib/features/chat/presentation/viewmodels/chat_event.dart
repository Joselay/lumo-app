import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_event.freezed.dart';

@freezed
abstract class ChatEvent with _$ChatEvent {
  const factory ChatEvent.sendMessage(String content) = SendMessage;
  const factory ChatEvent.clearMessages() = ClearMessages;
  const factory ChatEvent.clearError() = ClearError;
}
