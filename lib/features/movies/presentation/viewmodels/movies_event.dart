import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/movie.dart';

part 'movies_event.freezed.dart';

@freezed
abstract class MoviesEvent with _$MoviesEvent {
  const factory MoviesEvent.started() = MoviesStarted;
  const factory MoviesEvent.loadMovies({MoviesFilter? filter}) = LoadMovies;
  const factory MoviesEvent.loadGenres() = LoadGenres;
  const factory MoviesEvent.searchMovies(String query) = SearchMovies;
  const factory MoviesEvent.filterByGenre(String genreId) = FilterByGenre;
  const factory MoviesEvent.clearFilter() = ClearFilter;
  const factory MoviesEvent.refreshMovies() = RefreshMovies;
}