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