import '../../data/repositories/chat_repository.dart';
import '../entities/message.dart';

class SendMessage {
  final ChatRepository _repository;

  SendMessage(this._repository);

  Future<ChatResult> call(String message, List<Message> history) async {
    return await _repository.sendMessage(message, history);
  }
}
