import '../../domain/entities/movie.dart' as domain;
import '../../domain/repositories/movies_repository_interface.dart';
import '../datasources/movies_api.dart';
import '../models/movie_models.dart';

class MoviesRepository implements MoviesRepositoryInterface {
  final MoviesApi api;

  MoviesRepository(this.api);

  @override
  Future<List<domain.Movie>> getMovies({domain.MoviesFilter? filter}) async {
    final queryParams = <String, dynamic>{};

    if (filter != null) {
      if (filter.page != null) queryParams['page'] = filter.page.toString();
      if (filter.search != null) queryParams['search'] = filter.search;
      if (filter.genre != null) queryParams['genres'] = filter.genre;
      if (filter.ordering != null) queryParams['ordering'] = filter.ordering;
      if (filter.isActive != null) {
        queryParams['is_active'] = filter.isActive.toString();
      }
    }

    queryParams.putIfAbsent('ordering', () => '-rating');

    final response = await api.getMovies(queryParams);
    return response.results.map(_mapToDomainMovie).toList();
  }

  @override
  Future<domain.Movie> getMovieById(String id) async {
    final movie = await api.getMovieById(id);
    return _mapToDomainMovie(movie);
  }

  @override
  Future<List<domain.Genre>> getGenres() async {
    final response = await api.getGenres();
    return response.results.map(_mapToDomainGenre).toList();
  }

  @override
  Future<dynamic> getMovieShowtimes(String movieId) async {
    return await api.getMovieShowtimes(movieId);
  }

  domain.Movie _mapToDomainMovie(Movie movie) {
    return domain.Movie(
      id: movie.id,
      title: movie.title,
      description: movie.description,
      duration: movie.duration,
      releaseDate: movie.releaseDate,
      rating: movie.rating,
      posterImage: movie.posterImage,
      trailerUrl: movie.trailerUrl,
      genres: movie.genres.map(_mapToDomainGenre).toList(),
      isActive: movie.isActive,
      durationFormatted: movie.durationFormatted,
    );
  }

  domain.Genre _mapToDomainGenre(Genre genre) {
    return domain.Genre(id: genre.id, name: genre.name);
  }
}
