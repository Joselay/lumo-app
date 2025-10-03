import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/movie.dart';

part 'movie_details_state.freezed.dart';

enum MovieDetailsStatus {
  initial,
  loading,
  loaded,
  failure,
}

@freezed
abstract class MovieDetailsState with _$MovieDetailsState {
  const factory MovieDetailsState({
    @Default(MovieDetailsStatus.initial) MovieDetailsStatus status,
    @Default([]) List<Showtime> showtimes,
    String? errorMessage,
    String? movieId,
  }) = _MovieDetailsState;
}
