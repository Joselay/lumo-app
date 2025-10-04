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
}
