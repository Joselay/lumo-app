import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumo_app/core/utils/app_logger.dart';
import '../../data/repositories/chat_repository.dart';
import '../../domain/entities/message.dart';
import '../../domain/usecases/send_message.dart' as use_case;
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final use_case.SendMessage sendMessageUseCase;

  ChatBloc({required ChatRepository repository})
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

    emit(state.copyWith(status: ChatStatus.sending, messages: updatedMessages));

    try {
      final result = await sendMessageUseCase(
        event.content.trim(),
        state.messages,
      );

      if (result.isSuccess && result.message != null) {
        emit(
          state.copyWith(
            status: ChatStatus.success,
            messages: [...updatedMessages, result.message!],
            errorMessage: '',
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: ChatStatus.error,
            errorMessage: result.error ?? 'Failed to get response',
          ),
        );
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
