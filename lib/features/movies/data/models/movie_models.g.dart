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
  isFavorited: json['is_favorited'] as bool?,
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
  'is_favorited': instance.isFavorited,
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

Theater _$TheaterFromJson(Map<String, dynamic> json) => Theater(
  id: json['id'] as String,
  name: json['name'] as String,
  address: json['address'] as String,
  city: json['city'] as String,
  state: json['state'] as String,
  zipCode: json['zip_code'] as String,
  fullAddress: json['full_address'] as String?,
  phoneNumber: json['phone_number'] as String,
  email: json['email'] as String?,
  totalScreens: (json['total_screens'] as num).toInt(),
  parkingAvailable: json['parking_available'] as bool,
  accessibilityFeatures: json['accessibility_features'] as String?,
  amenities: json['amenities'] as String?,
  isActive: json['is_active'] as bool,
);

Map<String, dynamic> _$TheaterToJson(Theater instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'address': instance.address,
  'city': instance.city,
  'state': instance.state,
  'zip_code': instance.zipCode,
  'full_address': instance.fullAddress,
  'phone_number': instance.phoneNumber,
  'email': instance.email,
  'total_screens': instance.totalScreens,
  'parking_available': instance.parkingAvailable,
  'accessibility_features': instance.accessibilityFeatures,
  'amenities': instance.amenities,
  'is_active': instance.isActive,
};

Showtime _$ShowtimeFromJson(Map<String, dynamic> json) => Showtime(
  id: json['id'] as String,
  movie: json['movie'] as String,
  movieTitle: json['movie_title'] as String?,
  movieDuration: (json['movie_duration'] as num?)?.toInt(),
  moviePoster: json['movie_poster'] as String?,
  theater: json['theater'] as String,
  theaterName: json['theater_name'] as String?,
  theaterCity: json['theater_city'] as String?,
  datetime: json['datetime'] as String,
  screenNumber: (json['screen_number'] as num).toInt(),
  totalSeats: (json['total_seats'] as num).toInt(),
  availableSeats: (json['available_seats'] as num).toInt(),
  seatsSold: (json['seats_sold'] as num?)?.toInt(),
  ticketPrice: Showtime._priceFromJson(json['ticket_price']),
  isAvailable: json['is_available'] as bool?,
  date: json['date'] as String?,
  time: json['time'] as String?,
  datetimeFormatted: json['datetime_formatted'] as String?,
);

Map<String, dynamic> _$ShowtimeToJson(Showtime instance) => <String, dynamic>{
  'id': instance.id,
  'movie': instance.movie,
  'movie_title': instance.movieTitle,
  'movie_duration': instance.movieDuration,
  'movie_poster': instance.moviePoster,
  'theater': instance.theater,
  'theater_name': instance.theaterName,
  'theater_city': instance.theaterCity,
  'datetime': instance.datetime,
  'screen_number': instance.screenNumber,
  'total_seats': instance.totalSeats,
  'available_seats': instance.availableSeats,
  'seats_sold': instance.seatsSold,
  'ticket_price': instance.ticketPrice,
  'is_available': instance.isAvailable,
  'date': instance.date,
  'time': instance.time,
  'datetime_formatted': instance.datetimeFormatted,
};

ShowtimesResponse _$ShowtimesResponseFromJson(Map<String, dynamic> json) =>
    ShowtimesResponse(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => Showtime.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShowtimesResponseToJson(ShowtimesResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

MovieFavorite _$MovieFavoriteFromJson(Map<String, dynamic> json) =>
    MovieFavorite(
      id: json['id'] as String,
      movie: Movie.fromJson(json['movie'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$MovieFavoriteToJson(MovieFavorite instance) =>
    <String, dynamic>{
      'id': instance.id,
      'movie': instance.movie,
      'created_at': instance.createdAt,
    };

MovieFavoritesResponse _$MovieFavoritesResponseFromJson(
  Map<String, dynamic> json,
) => MovieFavoritesResponse(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => MovieFavorite.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MovieFavoritesResponseToJson(
  MovieFavoritesResponse instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};

AddFavoriteRequest _$AddFavoriteRequestFromJson(Map<String, dynamic> json) =>
    AddFavoriteRequest(movieId: json['movie_id'] as String);

Map<String, dynamic> _$AddFavoriteRequestToJson(AddFavoriteRequest instance) =>
    <String, dynamic>{'movie_id': instance.movieId};

FavoriteCheckResponse _$FavoriteCheckResponseFromJson(
  Map<String, dynamic> json,
) => FavoriteCheckResponse(
  isFavorited: json['is_favorited'] as bool,
  favoriteId: json['favorite_id'] as String?,
);

Map<String, dynamic> _$FavoriteCheckResponseToJson(
  FavoriteCheckResponse instance,
) => <String, dynamic>{
  'is_favorited': instance.isFavorited,
  'favorite_id': instance.favoriteId,
};
