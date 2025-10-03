import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/message.dart';

part 'chat_state.freezed.dart';

enum ChatStatus { initial, sending, success, error }

@freezed
abstract class ChatState with _$ChatState {
  const factory ChatState({
    @Default(ChatStatus.initial) ChatStatus status,
    @Default([]) List<Message> messages,
    @Default('') String errorMessage,
  }) = _ChatState;
}
