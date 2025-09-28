import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/movie.dart';

part 'movies_state.freezed.dart';

enum MoviesStatus { initial, loading, loaded, error }

@freezed
abstract class MoviesState with _$MoviesState {
  const factory MoviesState({
    @Default(MoviesStatus.initial) MoviesStatus status,
    @Default([]) List<Movie> movies,
    @Default([]) List<Genre> genres,
    String? errorMessage,
    String? searchQuery,
    String? selectedGenreId,
    MoviesFilter? currentFilter,
    @Default(false) bool isRefreshing,
  }) = _MoviesState;
}