import '../repositories/movies_repository_interface.dart';

class ToggleFavoriteUseCase {
  final MoviesRepositoryInterface repository;

  ToggleFavoriteUseCase(this.repository);

  Future<bool> call(String movieId, bool currentlyFavorited) async {
    if (currentlyFavorited) {
      await repository.removeFavorite(movieId);
      return false;
    } else {
      await repository.addFavorite(movieId);
      return true;
    }
  }
}
