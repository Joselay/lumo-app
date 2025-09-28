import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';

@freezed
abstract class Genre with _$Genre {
  const factory Genre({
    required String id,
    required String name,
  }) = _Genre;
}

@freezed
abstract class Movie with _$Movie {
  const factory Movie({
    required String id,
    required String title,
    required String description,
    required int duration,
    required String releaseDate,
    double? rating,
    String? posterImage,
    String? trailerUrl,
    required List<Genre> genres,
    required bool isActive,
    String? durationFormatted,
  }) = _Movie;
}

@freezed
abstract class MoviesFilter with _$MoviesFilter {
  const factory MoviesFilter({
    int? page,
    String? search,
    String? genre,
    String? ordering,
    bool? isActive,
  }) = _MoviesFilter;
}