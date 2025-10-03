import '../entities/movie.dart';
import '../repositories/movies_repository_interface.dart';

class GetMovieShowtimesUseCase {
  final MoviesRepositoryInterface repository;

  GetMovieShowtimesUseCase(this.repository);

  Future<List<Showtime>> execute(String movieId) {
    return repository.getMovieShowtimes(movieId);
  }
}
