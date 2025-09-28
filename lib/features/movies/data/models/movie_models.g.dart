// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Genre _$GenreFromJson(Map<String, dynamic> json) =>
    Genre(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  duration: Movie._intFromJson(json['duration']),
  releaseDate: json['release_date'] as String,
  rating: Movie._doubleFromJson(json['rating']),
  posterImage: json['poster_image'] as String?,
  trailerUrl: json['trailer_url'] as String?,
  genres: (json['genres'] as List<dynamic>)
      .map((e) => Genre.fromJson(e as Map<String, dynamic>))
      .toList(),
  isActive: json['is_active'] as bool,
  durationFormatted: json['duration_formatted'] as String?,
);

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'duration': instance.duration,
  'release_date': instance.releaseDate,
  'rating': instance.rating,
  'poster_image': instance.posterImage,
  'trailer_url': instance.trailerUrl,
  'genres': instance.genres,
  'is_active': instance.isActive,
  'duration_formatted': instance.durationFormatted,
};

MoviesResponse _$MoviesResponseFromJson(Map<String, dynamic> json) =>
    MoviesResponse(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoviesResponseToJson(MoviesResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

GenresResponse _$GenresResponseFromJson(Map<String, dynamic> json) =>
    GenresResponse(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GenresResponseToJson(GenresResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
