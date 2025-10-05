import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/chat_models.dart';

part 'chat_api.g.dart';

@RestApi()
abstract class ChatApi {
  factory ChatApi(Dio dio, {String baseUrl}) = _ChatApi;

  @POST('/chat/ai-chat/')
  Future<ChatResponse> sendMessage(@Body() ChatRequest request);

  @GET('/chat/sessions/')
  Future<List<ChatSession>> getChatSessions();

  @GET('/chat/sessions/{sessionId}/')
  Future<ChatSessionDetail> getChatSession(@Path('sessionId') String sessionId);

  @DELETE('/chat/sessions/{sessionId}/delete/')
  Future<void> deleteChatSession(@Path('sessionId') String sessionId);

  @PATCH('/chat/sessions/{sessionId}/rename/')
  Future<ChatSession> renameChatSession(
    @Path('sessionId') String sessionId,
    @Body() Map<String, String> body,
  );

  @PATCH('/chat/sessions/{sessionId}/archive/')
  Future<ChatSession> archiveChatSession(@Path('sessionId') String sessionId);

  @PATCH('/chat/sessions/{sessionId}/unarchive/')
  Future<ChatSession> unarchiveChatSession(@Path('sessionId') String sessionId);

  @GET('/chat/sessions/archived/')
  Future<List<ChatSession>> getArchivedSessions();
}
