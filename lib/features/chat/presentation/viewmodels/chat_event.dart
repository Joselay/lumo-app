import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_event.freezed.dart';

@freezed
abstract class ChatEvent with _$ChatEvent {
  const factory ChatEvent.sendMessage(String content) = SendMessage;
  const factory ChatEvent.clearMessages() = ClearMessages;
  const factory ChatEvent.clearError() = ClearError;
  const factory ChatEvent.loadSessions() = LoadSessions;
  const factory ChatEvent.loadSession(String sessionId) = LoadSession;
  const factory ChatEvent.deleteSession(String sessionId) = DeleteSession;
  const factory ChatEvent.renameSession(String sessionId, String newTitle) = RenameSession;
  const factory ChatEvent.archiveSession(String sessionId) = ArchiveSession;
  const factory ChatEvent.unarchiveSession(String sessionId) = UnarchiveSession;
  const factory ChatEvent.loadArchivedSessions() = LoadArchivedSessions;
  const factory ChatEvent.createNewSession() = CreateNewSession;
}
