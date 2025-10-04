import '../../data/repositories/chat_repository.dart';
import '../entities/message.dart';

class SendMessage {
  final ChatRepository _repository;

  SendMessage(this._repository);

  Future<ChatResult> call(
    String message,
    List<Message> history, {
    String? sessionId,
  }) async {
    return await _repository.sendMessage(
      message,
      sessionId: sessionId,
      conversationHistory: history,
    );
  }
}
