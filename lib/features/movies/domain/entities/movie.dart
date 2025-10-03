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
    @Default(false) bool isFavorited,
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

@freezed
abstract class Theater with _$Theater {
  const factory Theater({
    required String id,
    required String name,
    required String address,
    required String city,
    required String state,
    required String zipCode,
    String? fullAddress,
    required String phoneNumber,
    String? email,
    required int totalScreens,
    required bool parkingAvailable,
    String? accessibilityFeatures,
    String? amenities,
    required bool isActive,
  }) = _Theater;
}

@freezed
abstract class Showtime with _$Showtime {
  const factory Showtime({
    required String id,
    required String movie,
    String? movieTitle,
    int? movieDuration,
    String? moviePoster,
    required String theater,
    String? theaterName,
    String? theaterCity,
    required String datetime,
    required int screenNumber,
    required int totalSeats,
    required int availableSeats,
    int? seatsSold,
    required double ticketPrice,
    bool? isAvailable,
    String? date,
    String? time,
    String? datetimeFormatted,
  }) = _Showtime;
}