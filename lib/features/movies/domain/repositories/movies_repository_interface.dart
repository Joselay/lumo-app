import '../entities/movie.dart';

abstract class MoviesRepositoryInterface {
  Future<List<Movie>> getMovies({MoviesFilter? filter});
  Future<Movie> getMovieById(String id);
  Future<List<Genre>> getGenres();
  Future<List<Showtime>> getMovieShowtimes(String movieId);
  Future<List<Movie>> getFavoriteMovies();
  Future<void> addFavorite(String movieId);
  Future<void> removeFavorite(String movieId);
  Future<bool> checkFavorite(String movieId);
}