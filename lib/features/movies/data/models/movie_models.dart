import 'package:json_annotation/json_annotation.dart';

part 'movie_models.g.dart';

@JsonSerializable()
class Genre {
  final String id;
  final String name;

  const Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable()
class Movie {
  final String id;
  final String title;
  final String description;
  @JsonKey(fromJson: _intFromJson)
  final int duration;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @JsonKey(fromJson: _doubleFromJson)
  final double? rating;
  @JsonKey(name: 'poster_image')
  final String? posterImage;
  @JsonKey(name: 'trailer_url')
  final String? trailerUrl;
  final List<Genre> genres;
  @JsonKey(name: 'is_active')
  final bool isActive;
  @JsonKey(name: 'duration_formatted')
  final String? durationFormatted;
  @JsonKey(name: 'is_favorited')
  final bool? isFavorited;

  static int _intFromJson(dynamic value) {
    if (value is int) return value;
    if (value is String) return int.parse(value);
    throw FormatException('Cannot parse int from $value');
  }

  static double? _doubleFromJson(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.parse(value);
    throw FormatException('Cannot parse double from $value');
  }

  const Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.releaseDate,
    this.rating,
    this.posterImage,
    this.trailerUrl,
    required this.genres,
    required this.isActive,
    this.durationFormatted,
    this.isFavorited,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

@JsonSerializable()
class MoviesResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<Movie> results;

  const MoviesResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory MoviesResponse.fromJson(Map<String, dynamic> json) => _$MoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);
}

@JsonSerializable()
class GenresResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<Genre> results;

  const GenresResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory GenresResponse.fromJson(Map<String, dynamic> json) => _$GenresResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenresResponseToJson(this);
}

@JsonSerializable()
class Theater {
  final String id;
  final String name;
  final String address;
  final String city;
  final String state;
  @JsonKey(name: 'zip_code')
  final String zipCode;
  @JsonKey(name: 'full_address')
  final String? fullAddress;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  final String? email;
  @JsonKey(name: 'total_screens')
  final int totalScreens;
  @JsonKey(name: 'parking_available')
  final bool parkingAvailable;
  @JsonKey(name: 'accessibility_features')
  final String? accessibilityFeatures;
  final String? amenities;
  @JsonKey(name: 'is_active')
  final bool isActive;

  const Theater({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
    this.fullAddress,
    required this.phoneNumber,
    this.email,
    required this.totalScreens,
    required this.parkingAvailable,
    this.accessibilityFeatures,
    this.amenities,
    required this.isActive,
  });

  factory Theater.fromJson(Map<String, dynamic> json) => _$TheaterFromJson(json);

  Map<String, dynamic> toJson() => _$TheaterToJson(this);
}

@JsonSerializable()
class Showtime {
  final String id;
  final String movie;
  @JsonKey(name: 'movie_title')
  final String? movieTitle;
  @JsonKey(name: 'movie_duration')
  final int? movieDuration;
  @JsonKey(name: 'movie_poster')
  final String? moviePoster;
  final String theater;
  @JsonKey(name: 'theater_name')
  final String? theaterName;
  @JsonKey(name: 'theater_city')
  final String? theaterCity;
  final String datetime;
  @JsonKey(name: 'screen_number')
  final int screenNumber;
  @JsonKey(name: 'total_seats')
  final int totalSeats;
  @JsonKey(name: 'available_seats')
  final int availableSeats;
  @JsonKey(name: 'seats_sold')
  final int? seatsSold;
  @JsonKey(name: 'ticket_price', fromJson: _priceFromJson)
  final double ticketPrice;
  @JsonKey(name: 'is_available')
  final bool? isAvailable;
  final String? date;
  final String? time;
  @JsonKey(name: 'datetime_formatted')
  final String? datetimeFormatted;

  static double _priceFromJson(dynamic value) {
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.parse(value);
    throw FormatException('Cannot parse price from $value');
  }

  const Showtime({
    required this.id,
    required this.movie,
    this.movieTitle,
    this.movieDuration,
    this.moviePoster,
    required this.theater,
    this.theaterName,
    this.theaterCity,
    required this.datetime,
    required this.screenNumber,
    required this.totalSeats,
    required this.availableSeats,
    this.seatsSold,
    required this.ticketPrice,
    this.isAvailable,
    this.date,
    this.time,
    this.datetimeFormatted,
  });

  factory Showtime.fromJson(Map<String, dynamic> json) => _$ShowtimeFromJson(json);

  Map<String, dynamic> toJson() => _$ShowtimeToJson(this);
}

@JsonSerializable()
class ShowtimesResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<Showtime> results;

  const ShowtimesResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory ShowtimesResponse.fromJson(Map<String, dynamic> json) => _$ShowtimesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShowtimesResponseToJson(this);
}

@JsonSerializable()
class MovieFavorite {
  final String id;
  final Movie movie;
  @JsonKey(name: 'created_at')
  final String createdAt;

  const MovieFavorite({
    required this.id,
    required this.movie,
    required this.createdAt,
  });

  factory MovieFavorite.fromJson(Map<String, dynamic> json) => _$MovieFavoriteFromJson(json);

  Map<String, dynamic> toJson() => _$MovieFavoriteToJson(this);
}

@JsonSerializable()
class MovieFavoritesResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<MovieFavorite> results;

  const MovieFavoritesResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory MovieFavoritesResponse.fromJson(Map<String, dynamic> json) => _$MovieFavoritesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieFavoritesResponseToJson(this);
}

@JsonSerializable()
class AddFavoriteRequest {
  @JsonKey(name: 'movie_id')
  final String movieId;

  const AddFavoriteRequest({
    required this.movieId,
  });

  factory AddFavoriteRequest.fromJson(Map<String, dynamic> json) => _$AddFavoriteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddFavoriteRequestToJson(this);
}

@JsonSerializable()
class FavoriteCheckResponse {
  @JsonKey(name: 'is_favorited')
  final bool isFavorited;
  @JsonKey(name: 'favorite_id')
  final String? favoriteId;

  const FavoriteCheckResponse({
    required this.isFavorited,
    this.favoriteId,
  });

  factory FavoriteCheckResponse.fromJson(Map<String, dynamic> json) => _$FavoriteCheckResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteCheckResponseToJson(this);
}