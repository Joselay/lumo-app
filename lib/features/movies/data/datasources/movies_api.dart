import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../models/movie_models.dart';

part 'movies_api.g.dart';

@RestApi()
abstract class MoviesApi {
  factory MoviesApi(Dio dio) = _MoviesApi;

  @GET('/movies/')
  Future<MoviesResponse> getMovies(@Queries() Map<String, dynamic> queries);

  @GET('/movies/{id}/')
  Future<Movie> getMovieById(@Path('id') String id);

  @GET('/movies/genres/')
  Future<GenresResponse> getGenres();

  @GET('/movies/{id}/showtimes/')
  Future<ShowtimesResponse> getMovieShowtimes(@Path('id') String id);

  @GET('/movies/favorites/')
  Future<MovieFavoritesResponse> getFavoriteMovies();

  @POST('/movies/favorites/add/')
  Future<MovieFavorite> addFavorite(@Body() AddFavoriteRequest request);

  @DELETE('/movies/favorites/{movieId}/')
  Future<void> removeFavorite(@Path('movieId') String movieId);

  @GET('/movies/favorites/{movieId}/check/')
  Future<FavoriteCheckResponse> checkFavorite(@Path('movieId') String movieId);
}