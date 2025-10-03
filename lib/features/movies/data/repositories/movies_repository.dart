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

    final baseQueryParams = Map<String, dynamic>.from(queryParams);
    final visitedPages = <String>{(filter?.page ?? 1).toString()};

    final initialResponse = await api.getMovies(
      Map<String, dynamic>.from(baseQueryParams),
    );
    final movies = initialResponse.results
        .map(_mapToDomainMovie)
        .toList(growable: true);

    if (filter?.page != null) {
      return movies;
    }

    var nextUrl = initialResponse.next;
    var currentPage = filter?.page ?? 1;

    while (nextUrl != null) {
      final nextUri = Uri.tryParse(nextUrl);
      final nextPageCandidate = nextUri?.queryParameters['page'];
      final pageToFetch = nextPageCandidate ?? (currentPage + 1).toString();

      if (!visitedPages.add(pageToFetch)) {
        break;
      }

      final nextQueryParams = Map<String, dynamic>.from(baseQueryParams);
      nextQueryParams['page'] = pageToFetch;

      final pageResponse = await api.getMovies(nextQueryParams);
      movies.addAll(pageResponse.results.map(_mapToDomainMovie));

      nextUrl = pageResponse.next;
      currentPage = int.tryParse(pageToFetch) ?? currentPage + 1;
    }

    return movies;
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
  Future<List<domain.Showtime>> getMovieShowtimes(String movieId) async {
    final response = await api.getMovieShowtimes(movieId);
    return response.results.map(_mapToDomainShowtime).toList();
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

  domain.Showtime _mapToDomainShowtime(Showtime showtime) {
    return domain.Showtime(
      id: showtime.id,
      movie: showtime.movie,
      movieTitle: showtime.movieTitle,
      movieDuration: showtime.movieDuration,
      moviePoster: showtime.moviePoster,
      theater: showtime.theater,
      theaterName: showtime.theaterName,
      theaterCity: showtime.theaterCity,
      datetime: showtime.datetime,
      screenNumber: showtime.screenNumber,
      totalSeats: showtime.totalSeats,
      availableSeats: showtime.availableSeats,
      seatsSold: showtime.seatsSold,
      ticketPrice: showtime.ticketPrice,
      isAvailable: showtime.isAvailable,
      date: showtime.date,
      time: showtime.time,
      datetimeFormatted: showtime.datetimeFormatted,
    );
  }
}
