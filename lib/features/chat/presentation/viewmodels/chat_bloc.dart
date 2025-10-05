import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumo_app/core/utils/app_logger.dart';
import '../../data/repositories/chat_repository.dart';
import '../../domain/entities/message.dart';
import '../../domain/usecases/send_message.dart' as use_case;
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository repository;
  final use_case.SendMessage sendMessageUseCase;

  ChatBloc({required this.repository})
    : sendMessageUseCase = use_case.SendMessage(repository),
      super(const ChatState()) {
    on<SendMessage>(_onSendMessage);
    on<ClearMessages>(_onClearMessages);
    on<ClearError>(_onClearError);
    on<LoadSessions>(_onLoadSessions);
    on<LoadSession>(_onLoadSession);
    on<DeleteSession>(_onDeleteSession);
    on<DeleteAllSessions>(_onDeleteAllSessions);
    on<RenameSession>(_onRenameSession);
    on<ArchiveSession>(_onArchiveSession);
    on<UnarchiveSession>(_onUnarchiveSession);
    on<LoadArchivedSessions>(_onLoadArchivedSessions);
    on<CreateNewSession>(_onCreateNewSession);
  }

  Future<void> _onSendMessage(
    SendMessage event,
    Emitter<ChatState> emit,
  ) async {
    if (event.content.trim().isEmpty) return;

    final userMessage = Message(
      role: 'user',
      content: event.content.trim(),
      timestamp: DateTime.now(),
    );

    final updatedMessages = [...state.messages, userMessage];

    emit(
      state.copyWith(
        status: ChatStatus.sending,
        messages: updatedMessages,
        streamingContent: '',
      ),
    );

    try {
      final placeholderMessage = Message(
        role: 'assistant',
        content: '',
        timestamp: DateTime.now(),
      );

      emit(state.copyWith(messages: [...updatedMessages, placeholderMessage]));

      String? currentSessionId = state.sessionId;
      String accumulatedContent = '';

      await for (final streamEvent in repository.sendMessageStream(
        event.content.trim(),
        sessionId: state.sessionId,
      )) {
        if (streamEvent is ChatStreamSessionId) {
          currentSessionId = streamEvent.sessionId;
        } else if (streamEvent is ChatStreamToolStart) {
          emit(
            state.copyWith(
              status: ChatStatus.executingTools,
              sessionId: currentSessionId ?? state.sessionId,
            ),
          );
        } else if (streamEvent is ChatStreamContent) {
          accumulatedContent = streamEvent.accumulated;

          final messagesWithStreaming = [...updatedMessages];
          messagesWithStreaming.add(
            Message(
              role: 'assistant',
              content: accumulatedContent,
              timestamp: DateTime.now(),
            ),
          );

          emit(
            state.copyWith(
              status: ChatStatus.streaming,
              messages: messagesWithStreaming,
              streamingContent: accumulatedContent,
              sessionId: currentSessionId ?? state.sessionId,
            ),
          );
        } else if (streamEvent is ChatStreamDone) {
          emit(
            state.copyWith(
              status: ChatStatus.success,
              messages: [...updatedMessages, streamEvent.message],
              streamingContent: '',
              errorMessage: '',
              sessionId:
                  streamEvent.sessionId ?? currentSessionId ?? state.sessionId,
            ),
          );
        } else if (streamEvent is ChatStreamError) {
          emit(
            state.copyWith(
              status: ChatStatus.error,
              errorMessage: streamEvent.error,
              streamingContent: '',
            ),
          );
        }
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to send message',
        error: e,
        stackTrace: stackTrace,
      );
      emit(
        state.copyWith(
          status: ChatStatus.error,
          errorMessage: 'Failed to send message. Please try again.',
          streamingContent: '',
        ),
      );
    }
  }

  Future<void> _onClearMessages(
    ClearMessages event,
    Emitter<ChatState> emit,
  ) async {
    emit(const ChatState());
  }

  Future<void> _onClearError(ClearError event, Emitter<ChatState> emit) async {
    emit(state.copyWith(status: ChatStatus.initial, errorMessage: ''));
  }

  Future<void> _onLoadSessions(
    LoadSessions event,
    Emitter<ChatState> emit,
  ) async {
    emit(state.copyWith(isLoadingSessions: true));
    try {
      final sessions = await repository.getChatSessions();
      emit(state.copyWith(sessions: sessions, isLoadingSessions: false));
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to load sessions',
        error: e,
        stackTrace: stackTrace,
      );
      emit(state.copyWith(isLoadingSessions: false));
    }
  }

  Future<void> _onLoadSession(
    LoadSession event,
    Emitter<ChatState> emit,
  ) async {
    try {
      final sessionDetail = await repository.getChatSession(event.sessionId);
      if (sessionDetail != null) {
        final messages = sessionDetail.messages
            .map(
              (chatMsg) => Message(
                role: chatMsg.role,
                content: chatMsg.content,
                timestamp: chatMsg.createdAt ?? DateTime.now(),
                toolCalls:
                    chatMsg.toolCalls
                        ?.map(
                          (tc) => MessageToolCall(
                            name: tc.name,
                            arguments: tc.arguments,
                            result: tc.result,
                          ),
                        )
                        .toList() ??
                    [],
              ),
            )
            .toList();

        emit(
          state.copyWith(
            messages: messages,
            sessionId: event.sessionId,
            status: ChatStatus.initial,
            errorMessage: '',
            streamingContent: '',
          ),
        );
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to load session',
        error: e,
        stackTrace: stackTrace,
      );
      emit(
        state.copyWith(
          status: ChatStatus.error,
          errorMessage: 'Failed to load session. Please try again.',
        ),
      );
    }
  }

  Future<void> _onDeleteSession(
    DeleteSession event,
    Emitter<ChatState> emit,
  ) async {
    try {
      final success = await repository.deleteChatSession(event.sessionId);
      if (success) {
        final updatedSessions = state.sessions
            .where((s) => s.id != event.sessionId)
            .toList();

        if (state.sessionId == event.sessionId) {
          emit(
            state.copyWith(
              sessions: updatedSessions,
              messages: [],
              sessionId: null,
              status: ChatStatus.initial,
              errorMessage: '',
              streamingContent: '',
            ),
          );
        } else {
          emit(state.copyWith(sessions: updatedSessions));
        }
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete session',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _onDeleteAllSessions(
    DeleteAllSessions event,
    Emitter<ChatState> emit,
  ) async {
    try {
      final success = await repository.deleteAllSessions();
      if (success) {
        emit(
          state.copyWith(
            sessions: [],
            archivedSessions: [],
            messages: [],
            sessionId: null,
            status: ChatStatus.initial,
            errorMessage: '',
            streamingContent: '',
          ),
        );
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to delete all sessions',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _onRenameSession(
    RenameSession event,
    Emitter<ChatState> emit,
  ) async {
    try {
      final renamedSession = await repository.renameChatSession(
        event.sessionId,
        event.newTitle,
      );

      if (renamedSession != null) {
        final updatedSessions = state.sessions.map((session) {
          return session.id == event.sessionId ? renamedSession : session;
        }).toList();

        emit(state.copyWith(sessions: updatedSessions));
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to rename session',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _onArchiveSession(
    ArchiveSession event,
    Emitter<ChatState> emit,
  ) async {
    try {
      final archivedSession = await repository.archiveChatSession(
        event.sessionId,
      );

      if (archivedSession != null) {
        final updatedSessions = state.sessions
            .where((s) => s.id != event.sessionId)
            .toList();

        if (state.sessionId == event.sessionId) {
          emit(
            state.copyWith(
              sessions: updatedSessions,
              messages: [],
              sessionId: null,
              status: ChatStatus.initial,
              errorMessage: '',
              streamingContent: '',
            ),
          );
        } else {
          emit(state.copyWith(sessions: updatedSessions));
        }
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to archive session',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _onUnarchiveSession(
    UnarchiveSession event,
    Emitter<ChatState> emit,
  ) async {
    try {
      final unarchivedSession = await repository.unarchiveChatSession(
        event.sessionId,
      );

      if (unarchivedSession != null) {
        final updatedArchivedSessions = state.archivedSessions
            .where((s) => s.id != event.sessionId)
            .toList();

        final updatedSessions = [...state.sessions, unarchivedSession];

        emit(
          state.copyWith(
            archivedSessions: updatedArchivedSessions,
            sessions: updatedSessions,
          ),
        );
      }
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to unarchive session',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _onLoadArchivedSessions(
    LoadArchivedSessions event,
    Emitter<ChatState> emit,
  ) async {
    emit(state.copyWith(isLoadingArchivedSessions: true));
    try {
      final archivedSessions = await repository.getArchivedSessions();
      emit(
        state.copyWith(
          archivedSessions: archivedSessions,
          isLoadingArchivedSessions: false,
        ),
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'Failed to load archived sessions',
        error: e,
        stackTrace: stackTrace,
      );
      emit(state.copyWith(isLoadingArchivedSessions: false));
    }
  }

  Future<void> _onCreateNewSession(
    CreateNewSession event,
    Emitter<ChatState> emit,
  ) async {
    emit(const ChatState());
  }
}
