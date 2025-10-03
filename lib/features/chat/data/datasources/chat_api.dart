import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/chat_models.dart';

part 'chat_api.g.dart';

@RestApi()
abstract class ChatApi {
  factory ChatApi(Dio dio, {String baseUrl}) = _ChatApi;

  @POST('/chat/ai-chat/')
  Future<ChatResponse> sendMessage(@Body() ChatRequest request);
}
