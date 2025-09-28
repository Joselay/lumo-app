import '../entities/movie.dart';
import '../repositories/movies_repository_interface.dart';

class GetMoviesUseCase {
  final MoviesRepositoryInterface repository;

  GetMoviesUseCase(this.repository);

  Future<List<Movie>> call({MoviesFilter? filter}) async {
    return await repository.getMovies(filter: filter);
  }
}

class GetGenresUseCase {
  final MoviesRepositoryInterface repository;

  GetGenresUseCase(this.repository);

  Future<List<Genre>> call() async {
    return await repository.getGenres();
  }
}

class GetMovieByIdUseCase {
  final MoviesRepositoryInterface repository;

  GetMovieByIdUseCase(this.repository);

  Future<Movie> call(String id) async {
    return await repository.getMovieById(id);
  }
}