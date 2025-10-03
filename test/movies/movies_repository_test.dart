import 'package:flutter_test/flutter_test.dart';
import 'package:lumo_app/features/movies/data/datasources/movies_api.dart';
import 'package:lumo_app/features/movies/data/models/movie_models.dart'
    as models;
import 'package:lumo_app/features/movies/data/repositories/movies_repository.dart';
import 'package:lumo_app/features/movies/domain/entities/movie.dart' as domain;

class _StubMoviesApi implements MoviesApi {
  _StubMoviesApi(this.responses);

  final Map<String, models.MoviesResponse> responses;
  int getMoviesCallCount = 0;

  @override
  Future<models.MoviesResponse> getMovies(Map<String, dynamic> queries) async {
    getMoviesCallCount += 1;
    final pageKey = queries['page']?.toString() ?? '1';
    final response = responses[pageKey];
    if (response == null) {
      throw StateError('No response configured for page $pageKey');
    }
    return response;
  }

  @override
  Future<models.Movie> getMovieById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<models.GenresResponse> getGenres() {
    throw UnimplementedError();
  }

  @override
  Future<models.ShowtimesResponse> getMovieShowtimes(String id) {
    throw UnimplementedError();
  }

  @override
  Future<models.MovieFavoritesResponse> getFavoriteMovies() {
    throw UnimplementedError();
  }

  @override
  Future<models.MovieFavorite> addFavorite(models.AddFavoriteRequest request) {
    throw UnimplementedError();
  }

  @override
  Future<void> removeFavorite(String movieId) {
    throw UnimplementedError();
  }

  @override
  Future<models.FavoriteCheckResponse> checkFavorite(String movieId) {
    throw UnimplementedError();
  }
}

models.Movie _buildApiMovie(String id) {
  return models.Movie(
    id: id,
    title: 'Movie $id',
    description: 'Description for $id',
    duration: 120,
    releaseDate: '2024-01-01',
    rating: 4.5,
    posterImage: null,
    trailerUrl: null,
    genres: const [models.Genre(id: 'genre-1', name: 'Action')],
    isActive: true,
    durationFormatted: '2h',
  );
}

void main() {
  group('MoviesRepository', () {
    test(
      'includes results from all pages when pagination is present',
      () async {
        final api = _StubMoviesApi({
          '1': models.MoviesResponse(
            count: 3,
            next: 'http://localhost:8000/api/v1/movies/?page=2',
            previous: null,
            results: [_buildApiMovie('movie-1'), _buildApiMovie('movie-2')],
          ),
          '2': models.MoviesResponse(
            count: 3,
            next: null,
            previous: 'http://localhost:8000/api/v1/movies/?page=1',
            results: [_buildApiMovie('movie-3')],
          ),
        });

        final repository = MoviesRepository(api);

        final movies = await repository.getMovies(
          filter: const domain.MoviesFilter(isActive: true),
        );

        expect(movies.map((movie) => movie.id), [
          'movie-1',
          'movie-2',
          'movie-3',
        ]);
        expect(api.getMoviesCallCount, 2);
      },
    );

    test(
      'returns only the requested page when filter.page is provided',
      () async {
        final api = _StubMoviesApi({
          '2': models.MoviesResponse(
            count: 2,
            next: null,
            previous: 'http://localhost:8000/api/v1/movies/?page=1',
            results: [_buildApiMovie('movie-4'), _buildApiMovie('movie-5')],
          ),
        });

        final repository = MoviesRepository(api);

        final movies = await repository.getMovies(
          filter: const domain.MoviesFilter(page: 2),
        );

        expect(movies.map((movie) => movie.id), ['movie-4', 'movie-5']);
        expect(api.getMoviesCallCount, 1);
      },
    );
  });
}
