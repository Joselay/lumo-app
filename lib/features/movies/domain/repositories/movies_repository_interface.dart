import '../entities/movie.dart';

abstract class MoviesRepositoryInterface {
  Future<List<Movie>> getMovies({MoviesFilter? filter});
  Future<Movie> getMovieById(String id);
  Future<List<Genre>> getGenres();
  Future<List<Showtime>> getMovieShowtimes(String movieId);
}