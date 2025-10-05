import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/chat_models.dart';
import '../../domain/entities/message.dart';

part 'chat_state.freezed.dart';

enum ChatStatus { initial, sending, executingTools, streaming, success, error }

@freezed
abstract class ChatState with _$ChatState {
  const factory ChatState({
    @Default(ChatStatus.initial) ChatStatus status,
    @Default([]) List<Message> messages,
    @Default('') String errorMessage,
    @Default('') String streamingContent,
    String? sessionId,
    @Default([]) List<ChatSession> sessions,
    @Default(false) bool isLoadingSessions,
    @Default([]) List<ChatSession> archivedSessions,
    @Default(false) bool isLoadingArchivedSessions,
  }) = _ChatState;
}
