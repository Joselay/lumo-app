import '../entities/movie.dart';
import '../repositories/movies_repository_interface.dart';

class GetFavoriteMoviesUseCase {
  final MoviesRepositoryInterface repository;

  GetFavoriteMoviesUseCase(this.repository);

  Future<List<Movie>> call() async {
    return await repository.getFavoriteMovies();
  }
}
