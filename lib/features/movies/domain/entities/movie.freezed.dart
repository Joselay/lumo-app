// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Genre {

 String get id; String get name;
/// Create a copy of Genre
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenreCopyWith<Genre> get copyWith => _$GenreCopyWithImpl<Genre>(this as Genre, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Genre&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'Genre(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $GenreCopyWith<$Res>  {
  factory $GenreCopyWith(Genre value, $Res Function(Genre) _then) = _$GenreCopyWithImpl;
@useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class _$GenreCopyWithImpl<$Res>
    implements $GenreCopyWith<$Res> {
  _$GenreCopyWithImpl(this._self, this._then);

  final Genre _self;
  final $Res Function(Genre) _then;

/// Create a copy of Genre
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Genre].
extension GenrePatterns on Genre {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Genre value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Genre() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Genre value)  $default,){
final _that = this;
switch (_that) {
case _Genre():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Genre value)?  $default,){
final _that = this;
switch (_that) {
case _Genre() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Genre() when $default != null:
return $default(_that.id,_that.name);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name)  $default,) {final _that = this;
switch (_that) {
case _Genre():
return $default(_that.id,_that.name);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _Genre() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _Genre implements Genre {
  const _Genre({required this.id, required this.name});
  

@override final  String id;
@override final  String name;

/// Create a copy of Genre
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenreCopyWith<_Genre> get copyWith => __$GenreCopyWithImpl<_Genre>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Genre&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'Genre(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$GenreCopyWith<$Res> implements $GenreCopyWith<$Res> {
  factory _$GenreCopyWith(_Genre value, $Res Function(_Genre) _then) = __$GenreCopyWithImpl;
@override @useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class __$GenreCopyWithImpl<$Res>
    implements _$GenreCopyWith<$Res> {
  __$GenreCopyWithImpl(this._self, this._then);

  final _Genre _self;
  final $Res Function(_Genre) _then;

/// Create a copy of Genre
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_Genre(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$Movie {

 String get id; String get title; String get description; int get duration; String get releaseDate; double? get rating; String? get posterImage; String? get trailerUrl; List<Genre> get genres; bool get isActive; String? get durationFormatted;
/// Create a copy of Movie
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieCopyWith<Movie> get copyWith => _$MovieCopyWithImpl<Movie>(this as Movie, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Movie&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.posterImage, posterImage) || other.posterImage == posterImage)&&(identical(other.trailerUrl, trailerUrl) || other.trailerUrl == trailerUrl)&&const DeepCollectionEquality().equals(other.genres, genres)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.durationFormatted, durationFormatted) || other.durationFormatted == durationFormatted));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,duration,releaseDate,rating,posterImage,trailerUrl,const DeepCollectionEquality().hash(genres),isActive,durationFormatted);

@override
String toString() {
  return 'Movie(id: $id, title: $title, description: $description, duration: $duration, releaseDate: $releaseDate, rating: $rating, posterImage: $posterImage, trailerUrl: $trailerUrl, genres: $genres, isActive: $isActive, durationFormatted: $durationFormatted)';
}


}

/// @nodoc
abstract mixin class $MovieCopyWith<$Res>  {
  factory $MovieCopyWith(Movie value, $Res Function(Movie) _then) = _$MovieCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, int duration, String releaseDate, double? rating, String? posterImage, String? trailerUrl, List<Genre> genres, bool isActive, String? durationFormatted
});




}
/// @nodoc
class _$MovieCopyWithImpl<$Res>
    implements $MovieCopyWith<$Res> {
  _$MovieCopyWithImpl(this._self, this._then);

  final Movie _self;
  final $Res Function(Movie) _then;

/// Create a copy of Movie
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? duration = null,Object? releaseDate = null,Object? rating = freezed,Object? posterImage = freezed,Object? trailerUrl = freezed,Object? genres = null,Object? isActive = null,Object? durationFormatted = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,posterImage: freezed == posterImage ? _self.posterImage : posterImage // ignore: cast_nullable_to_non_nullable
as String?,trailerUrl: freezed == trailerUrl ? _self.trailerUrl : trailerUrl // ignore: cast_nullable_to_non_nullable
as String?,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genre>,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,durationFormatted: freezed == durationFormatted ? _self.durationFormatted : durationFormatted // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Movie].
extension MoviePatterns on Movie {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Movie value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Movie() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Movie value)  $default,){
final _that = this;
switch (_that) {
case _Movie():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Movie value)?  $default,){
final _that = this;
switch (_that) {
case _Movie() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  int duration,  String releaseDate,  double? rating,  String? posterImage,  String? trailerUrl,  List<Genre> genres,  bool isActive,  String? durationFormatted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Movie() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.duration,_that.releaseDate,_that.rating,_that.posterImage,_that.trailerUrl,_that.genres,_that.isActive,_that.durationFormatted);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  int duration,  String releaseDate,  double? rating,  String? posterImage,  String? trailerUrl,  List<Genre> genres,  bool isActive,  String? durationFormatted)  $default,) {final _that = this;
switch (_that) {
case _Movie():
return $default(_that.id,_that.title,_that.description,_that.duration,_that.releaseDate,_that.rating,_that.posterImage,_that.trailerUrl,_that.genres,_that.isActive,_that.durationFormatted);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  int duration,  String releaseDate,  double? rating,  String? posterImage,  String? trailerUrl,  List<Genre> genres,  bool isActive,  String? durationFormatted)?  $default,) {final _that = this;
switch (_that) {
case _Movie() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.duration,_that.releaseDate,_that.rating,_that.posterImage,_that.trailerUrl,_that.genres,_that.isActive,_that.durationFormatted);case _:
  return null;

}
}

}

/// @nodoc


class _Movie implements Movie {
  const _Movie({required this.id, required this.title, required this.description, required this.duration, required this.releaseDate, this.rating, this.posterImage, this.trailerUrl, required final  List<Genre> genres, required this.isActive, this.durationFormatted}): _genres = genres;
  

@override final  String id;
@override final  String title;
@override final  String description;
@override final  int duration;
@override final  String releaseDate;
@override final  double? rating;
@override final  String? posterImage;
@override final  String? trailerUrl;
 final  List<Genre> _genres;
@override List<Genre> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}

@override final  bool isActive;
@override final  String? durationFormatted;

/// Create a copy of Movie
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieCopyWith<_Movie> get copyWith => __$MovieCopyWithImpl<_Movie>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Movie&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.posterImage, posterImage) || other.posterImage == posterImage)&&(identical(other.trailerUrl, trailerUrl) || other.trailerUrl == trailerUrl)&&const DeepCollectionEquality().equals(other._genres, _genres)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.durationFormatted, durationFormatted) || other.durationFormatted == durationFormatted));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,duration,releaseDate,rating,posterImage,trailerUrl,const DeepCollectionEquality().hash(_genres),isActive,durationFormatted);

@override
String toString() {
  return 'Movie(id: $id, title: $title, description: $description, duration: $duration, releaseDate: $releaseDate, rating: $rating, posterImage: $posterImage, trailerUrl: $trailerUrl, genres: $genres, isActive: $isActive, durationFormatted: $durationFormatted)';
}


}

/// @nodoc
abstract mixin class _$MovieCopyWith<$Res> implements $MovieCopyWith<$Res> {
  factory _$MovieCopyWith(_Movie value, $Res Function(_Movie) _then) = __$MovieCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, int duration, String releaseDate, double? rating, String? posterImage, String? trailerUrl, List<Genre> genres, bool isActive, String? durationFormatted
});




}
/// @nodoc
class __$MovieCopyWithImpl<$Res>
    implements _$MovieCopyWith<$Res> {
  __$MovieCopyWithImpl(this._self, this._then);

  final _Movie _self;
  final $Res Function(_Movie) _then;

/// Create a copy of Movie
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? duration = null,Object? releaseDate = null,Object? rating = freezed,Object? posterImage = freezed,Object? trailerUrl = freezed,Object? genres = null,Object? isActive = null,Object? durationFormatted = freezed,}) {
  return _then(_Movie(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,posterImage: freezed == posterImage ? _self.posterImage : posterImage // ignore: cast_nullable_to_non_nullable
as String?,trailerUrl: freezed == trailerUrl ? _self.trailerUrl : trailerUrl // ignore: cast_nullable_to_non_nullable
as String?,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genre>,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,durationFormatted: freezed == durationFormatted ? _self.durationFormatted : durationFormatted // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$MoviesFilter {

 int? get page; String? get search; String? get genre; String? get ordering; bool? get isActive;
/// Create a copy of MoviesFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoviesFilterCopyWith<MoviesFilter> get copyWith => _$MoviesFilterCopyWithImpl<MoviesFilter>(this as MoviesFilter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoviesFilter&&(identical(other.page, page) || other.page == page)&&(identical(other.search, search) || other.search == search)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.ordering, ordering) || other.ordering == ordering)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,page,search,genre,ordering,isActive);

@override
String toString() {
  return 'MoviesFilter(page: $page, search: $search, genre: $genre, ordering: $ordering, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $MoviesFilterCopyWith<$Res>  {
  factory $MoviesFilterCopyWith(MoviesFilter value, $Res Function(MoviesFilter) _then) = _$MoviesFilterCopyWithImpl;
@useResult
$Res call({
 int? page, String? search, String? genre, String? ordering, bool? isActive
});




}
/// @nodoc
class _$MoviesFilterCopyWithImpl<$Res>
    implements $MoviesFilterCopyWith<$Res> {
  _$MoviesFilterCopyWithImpl(this._self, this._then);

  final MoviesFilter _self;
  final $Res Function(MoviesFilter) _then;

/// Create a copy of MoviesFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = freezed,Object? search = freezed,Object? genre = freezed,Object? ordering = freezed,Object? isActive = freezed,}) {
  return _then(_self.copyWith(
page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,genre: freezed == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String?,ordering: freezed == ordering ? _self.ordering : ordering // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [MoviesFilter].
extension MoviesFilterPatterns on MoviesFilter {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MoviesFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MoviesFilter() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MoviesFilter value)  $default,){
final _that = this;
switch (_that) {
case _MoviesFilter():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MoviesFilter value)?  $default,){
final _that = this;
switch (_that) {
case _MoviesFilter() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? page,  String? search,  String? genre,  String? ordering,  bool? isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MoviesFilter() when $default != null:
return $default(_that.page,_that.search,_that.genre,_that.ordering,_that.isActive);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? page,  String? search,  String? genre,  String? ordering,  bool? isActive)  $default,) {final _that = this;
switch (_that) {
case _MoviesFilter():
return $default(_that.page,_that.search,_that.genre,_that.ordering,_that.isActive);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? page,  String? search,  String? genre,  String? ordering,  bool? isActive)?  $default,) {final _that = this;
switch (_that) {
case _MoviesFilter() when $default != null:
return $default(_that.page,_that.search,_that.genre,_that.ordering,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc


class _MoviesFilter implements MoviesFilter {
  const _MoviesFilter({this.page, this.search, this.genre, this.ordering, this.isActive});
  

@override final  int? page;
@override final  String? search;
@override final  String? genre;
@override final  String? ordering;
@override final  bool? isActive;

/// Create a copy of MoviesFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MoviesFilterCopyWith<_MoviesFilter> get copyWith => __$MoviesFilterCopyWithImpl<_MoviesFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MoviesFilter&&(identical(other.page, page) || other.page == page)&&(identical(other.search, search) || other.search == search)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.ordering, ordering) || other.ordering == ordering)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,page,search,genre,ordering,isActive);

@override
String toString() {
  return 'MoviesFilter(page: $page, search: $search, genre: $genre, ordering: $ordering, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$MoviesFilterCopyWith<$Res> implements $MoviesFilterCopyWith<$Res> {
  factory _$MoviesFilterCopyWith(_MoviesFilter value, $Res Function(_MoviesFilter) _then) = __$MoviesFilterCopyWithImpl;
@override @useResult
$Res call({
 int? page, String? search, String? genre, String? ordering, bool? isActive
});




}
/// @nodoc
class __$MoviesFilterCopyWithImpl<$Res>
    implements _$MoviesFilterCopyWith<$Res> {
  __$MoviesFilterCopyWithImpl(this._self, this._then);

  final _MoviesFilter _self;
  final $Res Function(_MoviesFilter) _then;

/// Create a copy of MoviesFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = freezed,Object? search = freezed,Object? genre = freezed,Object? ordering = freezed,Object? isActive = freezed,}) {
  return _then(_MoviesFilter(
page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,genre: freezed == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String?,ordering: freezed == ordering ? _self.ordering : ordering // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

/// @nodoc
mixin _$Theater {

 String get id; String get name; String get address; String get city; String get state; String get zipCode; String? get fullAddress; String get phoneNumber; String? get email; int get totalScreens; bool get parkingAvailable; String? get accessibilityFeatures; String? get amenities; bool get isActive;
/// Create a copy of Theater
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TheaterCopyWith<Theater> get copyWith => _$TheaterCopyWithImpl<Theater>(this as Theater, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Theater&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.zipCode, zipCode) || other.zipCode == zipCode)&&(identical(other.fullAddress, fullAddress) || other.fullAddress == fullAddress)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.totalScreens, totalScreens) || other.totalScreens == totalScreens)&&(identical(other.parkingAvailable, parkingAvailable) || other.parkingAvailable == parkingAvailable)&&(identical(other.accessibilityFeatures, accessibilityFeatures) || other.accessibilityFeatures == accessibilityFeatures)&&(identical(other.amenities, amenities) || other.amenities == amenities)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,address,city,state,zipCode,fullAddress,phoneNumber,email,totalScreens,parkingAvailable,accessibilityFeatures,amenities,isActive);

@override
String toString() {
  return 'Theater(id: $id, name: $name, address: $address, city: $city, state: $state, zipCode: $zipCode, fullAddress: $fullAddress, phoneNumber: $phoneNumber, email: $email, totalScreens: $totalScreens, parkingAvailable: $parkingAvailable, accessibilityFeatures: $accessibilityFeatures, amenities: $amenities, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $TheaterCopyWith<$Res>  {
  factory $TheaterCopyWith(Theater value, $Res Function(Theater) _then) = _$TheaterCopyWithImpl;
@useResult
$Res call({
 String id, String name, String address, String city, String state, String zipCode, String? fullAddress, String phoneNumber, String? email, int totalScreens, bool parkingAvailable, String? accessibilityFeatures, String? amenities, bool isActive
});




}
/// @nodoc
class _$TheaterCopyWithImpl<$Res>
    implements $TheaterCopyWith<$Res> {
  _$TheaterCopyWithImpl(this._self, this._then);

  final Theater _self;
  final $Res Function(Theater) _then;

/// Create a copy of Theater
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? address = null,Object? city = null,Object? state = null,Object? zipCode = null,Object? fullAddress = freezed,Object? phoneNumber = null,Object? email = freezed,Object? totalScreens = null,Object? parkingAvailable = null,Object? accessibilityFeatures = freezed,Object? amenities = freezed,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,zipCode: null == zipCode ? _self.zipCode : zipCode // ignore: cast_nullable_to_non_nullable
as String,fullAddress: freezed == fullAddress ? _self.fullAddress : fullAddress // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,totalScreens: null == totalScreens ? _self.totalScreens : totalScreens // ignore: cast_nullable_to_non_nullable
as int,parkingAvailable: null == parkingAvailable ? _self.parkingAvailable : parkingAvailable // ignore: cast_nullable_to_non_nullable
as bool,accessibilityFeatures: freezed == accessibilityFeatures ? _self.accessibilityFeatures : accessibilityFeatures // ignore: cast_nullable_to_non_nullable
as String?,amenities: freezed == amenities ? _self.amenities : amenities // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Theater].
extension TheaterPatterns on Theater {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Theater value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Theater() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Theater value)  $default,){
final _that = this;
switch (_that) {
case _Theater():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Theater value)?  $default,){
final _that = this;
switch (_that) {
case _Theater() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String address,  String city,  String state,  String zipCode,  String? fullAddress,  String phoneNumber,  String? email,  int totalScreens,  bool parkingAvailable,  String? accessibilityFeatures,  String? amenities,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Theater() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.city,_that.state,_that.zipCode,_that.fullAddress,_that.phoneNumber,_that.email,_that.totalScreens,_that.parkingAvailable,_that.accessibilityFeatures,_that.amenities,_that.isActive);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String address,  String city,  String state,  String zipCode,  String? fullAddress,  String phoneNumber,  String? email,  int totalScreens,  bool parkingAvailable,  String? accessibilityFeatures,  String? amenities,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _Theater():
return $default(_that.id,_that.name,_that.address,_that.city,_that.state,_that.zipCode,_that.fullAddress,_that.phoneNumber,_that.email,_that.totalScreens,_that.parkingAvailable,_that.accessibilityFeatures,_that.amenities,_that.isActive);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String address,  String city,  String state,  String zipCode,  String? fullAddress,  String phoneNumber,  String? email,  int totalScreens,  bool parkingAvailable,  String? accessibilityFeatures,  String? amenities,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _Theater() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.city,_that.state,_that.zipCode,_that.fullAddress,_that.phoneNumber,_that.email,_that.totalScreens,_that.parkingAvailable,_that.accessibilityFeatures,_that.amenities,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc


class _Theater implements Theater {
  const _Theater({required this.id, required this.name, required this.address, required this.city, required this.state, required this.zipCode, this.fullAddress, required this.phoneNumber, this.email, required this.totalScreens, required this.parkingAvailable, this.accessibilityFeatures, this.amenities, required this.isActive});
  

@override final  String id;
@override final  String name;
@override final  String address;
@override final  String city;
@override final  String state;
@override final  String zipCode;
@override final  String? fullAddress;
@override final  String phoneNumber;
@override final  String? email;
@override final  int totalScreens;
@override final  bool parkingAvailable;
@override final  String? accessibilityFeatures;
@override final  String? amenities;
@override final  bool isActive;

/// Create a copy of Theater
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TheaterCopyWith<_Theater> get copyWith => __$TheaterCopyWithImpl<_Theater>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Theater&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.zipCode, zipCode) || other.zipCode == zipCode)&&(identical(other.fullAddress, fullAddress) || other.fullAddress == fullAddress)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.totalScreens, totalScreens) || other.totalScreens == totalScreens)&&(identical(other.parkingAvailable, parkingAvailable) || other.parkingAvailable == parkingAvailable)&&(identical(other.accessibilityFeatures, accessibilityFeatures) || other.accessibilityFeatures == accessibilityFeatures)&&(identical(other.amenities, amenities) || other.amenities == amenities)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,address,city,state,zipCode,fullAddress,phoneNumber,email,totalScreens,parkingAvailable,accessibilityFeatures,amenities,isActive);

@override
String toString() {
  return 'Theater(id: $id, name: $name, address: $address, city: $city, state: $state, zipCode: $zipCode, fullAddress: $fullAddress, phoneNumber: $phoneNumber, email: $email, totalScreens: $totalScreens, parkingAvailable: $parkingAvailable, accessibilityFeatures: $accessibilityFeatures, amenities: $amenities, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$TheaterCopyWith<$Res> implements $TheaterCopyWith<$Res> {
  factory _$TheaterCopyWith(_Theater value, $Res Function(_Theater) _then) = __$TheaterCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String address, String city, String state, String zipCode, String? fullAddress, String phoneNumber, String? email, int totalScreens, bool parkingAvailable, String? accessibilityFeatures, String? amenities, bool isActive
});




}
/// @nodoc
class __$TheaterCopyWithImpl<$Res>
    implements _$TheaterCopyWith<$Res> {
  __$TheaterCopyWithImpl(this._self, this._then);

  final _Theater _self;
  final $Res Function(_Theater) _then;

/// Create a copy of Theater
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? address = null,Object? city = null,Object? state = null,Object? zipCode = null,Object? fullAddress = freezed,Object? phoneNumber = null,Object? email = freezed,Object? totalScreens = null,Object? parkingAvailable = null,Object? accessibilityFeatures = freezed,Object? amenities = freezed,Object? isActive = null,}) {
  return _then(_Theater(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,zipCode: null == zipCode ? _self.zipCode : zipCode // ignore: cast_nullable_to_non_nullable
as String,fullAddress: freezed == fullAddress ? _self.fullAddress : fullAddress // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,totalScreens: null == totalScreens ? _self.totalScreens : totalScreens // ignore: cast_nullable_to_non_nullable
as int,parkingAvailable: null == parkingAvailable ? _self.parkingAvailable : parkingAvailable // ignore: cast_nullable_to_non_nullable
as bool,accessibilityFeatures: freezed == accessibilityFeatures ? _self.accessibilityFeatures : accessibilityFeatures // ignore: cast_nullable_to_non_nullable
as String?,amenities: freezed == amenities ? _self.amenities : amenities // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$Showtime {

 String get id; String get movie; String? get movieTitle; int? get movieDuration; String? get moviePoster; String get theater; String? get theaterName; String? get theaterCity; String get datetime; int get screenNumber; int get totalSeats; int get availableSeats; int? get seatsSold; double get ticketPrice; bool? get isAvailable; String? get date; String? get time; String? get datetimeFormatted;
/// Create a copy of Showtime
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowtimeCopyWith<Showtime> get copyWith => _$ShowtimeCopyWithImpl<Showtime>(this as Showtime, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Showtime&&(identical(other.id, id) || other.id == id)&&(identical(other.movie, movie) || other.movie == movie)&&(identical(other.movieTitle, movieTitle) || other.movieTitle == movieTitle)&&(identical(other.movieDuration, movieDuration) || other.movieDuration == movieDuration)&&(identical(other.moviePoster, moviePoster) || other.moviePoster == moviePoster)&&(identical(other.theater, theater) || other.theater == theater)&&(identical(other.theaterName, theaterName) || other.theaterName == theaterName)&&(identical(other.theaterCity, theaterCity) || other.theaterCity == theaterCity)&&(identical(other.datetime, datetime) || other.datetime == datetime)&&(identical(other.screenNumber, screenNumber) || other.screenNumber == screenNumber)&&(identical(other.totalSeats, totalSeats) || other.totalSeats == totalSeats)&&(identical(other.availableSeats, availableSeats) || other.availableSeats == availableSeats)&&(identical(other.seatsSold, seatsSold) || other.seatsSold == seatsSold)&&(identical(other.ticketPrice, ticketPrice) || other.ticketPrice == ticketPrice)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.datetimeFormatted, datetimeFormatted) || other.datetimeFormatted == datetimeFormatted));
}


@override
int get hashCode => Object.hash(runtimeType,id,movie,movieTitle,movieDuration,moviePoster,theater,theaterName,theaterCity,datetime,screenNumber,totalSeats,availableSeats,seatsSold,ticketPrice,isAvailable,date,time,datetimeFormatted);

@override
String toString() {
  return 'Showtime(id: $id, movie: $movie, movieTitle: $movieTitle, movieDuration: $movieDuration, moviePoster: $moviePoster, theater: $theater, theaterName: $theaterName, theaterCity: $theaterCity, datetime: $datetime, screenNumber: $screenNumber, totalSeats: $totalSeats, availableSeats: $availableSeats, seatsSold: $seatsSold, ticketPrice: $ticketPrice, isAvailable: $isAvailable, date: $date, time: $time, datetimeFormatted: $datetimeFormatted)';
}


}

/// @nodoc
abstract mixin class $ShowtimeCopyWith<$Res>  {
  factory $ShowtimeCopyWith(Showtime value, $Res Function(Showtime) _then) = _$ShowtimeCopyWithImpl;
@useResult
$Res call({
 String id, String movie, String? movieTitle, int? movieDuration, String? moviePoster, String theater, String? theaterName, String? theaterCity, String datetime, int screenNumber, int totalSeats, int availableSeats, int? seatsSold, double ticketPrice, bool? isAvailable, String? date, String? time, String? datetimeFormatted
});




}
/// @nodoc
class _$ShowtimeCopyWithImpl<$Res>
    implements $ShowtimeCopyWith<$Res> {
  _$ShowtimeCopyWithImpl(this._self, this._then);

  final Showtime _self;
  final $Res Function(Showtime) _then;

/// Create a copy of Showtime
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? movie = null,Object? movieTitle = freezed,Object? movieDuration = freezed,Object? moviePoster = freezed,Object? theater = null,Object? theaterName = freezed,Object? theaterCity = freezed,Object? datetime = null,Object? screenNumber = null,Object? totalSeats = null,Object? availableSeats = null,Object? seatsSold = freezed,Object? ticketPrice = null,Object? isAvailable = freezed,Object? date = freezed,Object? time = freezed,Object? datetimeFormatted = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,movie: null == movie ? _self.movie : movie // ignore: cast_nullable_to_non_nullable
as String,movieTitle: freezed == movieTitle ? _self.movieTitle : movieTitle // ignore: cast_nullable_to_non_nullable
as String?,movieDuration: freezed == movieDuration ? _self.movieDuration : movieDuration // ignore: cast_nullable_to_non_nullable
as int?,moviePoster: freezed == moviePoster ? _self.moviePoster : moviePoster // ignore: cast_nullable_to_non_nullable
as String?,theater: null == theater ? _self.theater : theater // ignore: cast_nullable_to_non_nullable
as String,theaterName: freezed == theaterName ? _self.theaterName : theaterName // ignore: cast_nullable_to_non_nullable
as String?,theaterCity: freezed == theaterCity ? _self.theaterCity : theaterCity // ignore: cast_nullable_to_non_nullable
as String?,datetime: null == datetime ? _self.datetime : datetime // ignore: cast_nullable_to_non_nullable
as String,screenNumber: null == screenNumber ? _self.screenNumber : screenNumber // ignore: cast_nullable_to_non_nullable
as int,totalSeats: null == totalSeats ? _self.totalSeats : totalSeats // ignore: cast_nullable_to_non_nullable
as int,availableSeats: null == availableSeats ? _self.availableSeats : availableSeats // ignore: cast_nullable_to_non_nullable
as int,seatsSold: freezed == seatsSold ? _self.seatsSold : seatsSold // ignore: cast_nullable_to_non_nullable
as int?,ticketPrice: null == ticketPrice ? _self.ticketPrice : ticketPrice // ignore: cast_nullable_to_non_nullable
as double,isAvailable: freezed == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,datetimeFormatted: freezed == datetimeFormatted ? _self.datetimeFormatted : datetimeFormatted // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Showtime].
extension ShowtimePatterns on Showtime {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Showtime value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Showtime() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Showtime value)  $default,){
final _that = this;
switch (_that) {
case _Showtime():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Showtime value)?  $default,){
final _that = this;
switch (_that) {
case _Showtime() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String movie,  String? movieTitle,  int? movieDuration,  String? moviePoster,  String theater,  String? theaterName,  String? theaterCity,  String datetime,  int screenNumber,  int totalSeats,  int availableSeats,  int? seatsSold,  double ticketPrice,  bool? isAvailable,  String? date,  String? time,  String? datetimeFormatted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Showtime() when $default != null:
return $default(_that.id,_that.movie,_that.movieTitle,_that.movieDuration,_that.moviePoster,_that.theater,_that.theaterName,_that.theaterCity,_that.datetime,_that.screenNumber,_that.totalSeats,_that.availableSeats,_that.seatsSold,_that.ticketPrice,_that.isAvailable,_that.date,_that.time,_that.datetimeFormatted);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String movie,  String? movieTitle,  int? movieDuration,  String? moviePoster,  String theater,  String? theaterName,  String? theaterCity,  String datetime,  int screenNumber,  int totalSeats,  int availableSeats,  int? seatsSold,  double ticketPrice,  bool? isAvailable,  String? date,  String? time,  String? datetimeFormatted)  $default,) {final _that = this;
switch (_that) {
case _Showtime():
return $default(_that.id,_that.movie,_that.movieTitle,_that.movieDuration,_that.moviePoster,_that.theater,_that.theaterName,_that.theaterCity,_that.datetime,_that.screenNumber,_that.totalSeats,_that.availableSeats,_that.seatsSold,_that.ticketPrice,_that.isAvailable,_that.date,_that.time,_that.datetimeFormatted);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String movie,  String? movieTitle,  int? movieDuration,  String? moviePoster,  String theater,  String? theaterName,  String? theaterCity,  String datetime,  int screenNumber,  int totalSeats,  int availableSeats,  int? seatsSold,  double ticketPrice,  bool? isAvailable,  String? date,  String? time,  String? datetimeFormatted)?  $default,) {final _that = this;
switch (_that) {
case _Showtime() when $default != null:
return $default(_that.id,_that.movie,_that.movieTitle,_that.movieDuration,_that.moviePoster,_that.theater,_that.theaterName,_that.theaterCity,_that.datetime,_that.screenNumber,_that.totalSeats,_that.availableSeats,_that.seatsSold,_that.ticketPrice,_that.isAvailable,_that.date,_that.time,_that.datetimeFormatted);case _:
  return null;

}
}

}

/// @nodoc


class _Showtime implements Showtime {
  const _Showtime({required this.id, required this.movie, this.movieTitle, this.movieDuration, this.moviePoster, required this.theater, this.theaterName, this.theaterCity, required this.datetime, required this.screenNumber, required this.totalSeats, required this.availableSeats, this.seatsSold, required this.ticketPrice, this.isAvailable, this.date, this.time, this.datetimeFormatted});
  

@override final  String id;
@override final  String movie;
@override final  String? movieTitle;
@override final  int? movieDuration;
@override final  String? moviePoster;
@override final  String theater;
@override final  String? theaterName;
@override final  String? theaterCity;
@override final  String datetime;
@override final  int screenNumber;
@override final  int totalSeats;
@override final  int availableSeats;
@override final  int? seatsSold;
@override final  double ticketPrice;
@override final  bool? isAvailable;
@override final  String? date;
@override final  String? time;
@override final  String? datetimeFormatted;

/// Create a copy of Showtime
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShowtimeCopyWith<_Showtime> get copyWith => __$ShowtimeCopyWithImpl<_Showtime>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Showtime&&(identical(other.id, id) || other.id == id)&&(identical(other.movie, movie) || other.movie == movie)&&(identical(other.movieTitle, movieTitle) || other.movieTitle == movieTitle)&&(identical(other.movieDuration, movieDuration) || other.movieDuration == movieDuration)&&(identical(other.moviePoster, moviePoster) || other.moviePoster == moviePoster)&&(identical(other.theater, theater) || other.theater == theater)&&(identical(other.theaterName, theaterName) || other.theaterName == theaterName)&&(identical(other.theaterCity, theaterCity) || other.theaterCity == theaterCity)&&(identical(other.datetime, datetime) || other.datetime == datetime)&&(identical(other.screenNumber, screenNumber) || other.screenNumber == screenNumber)&&(identical(other.totalSeats, totalSeats) || other.totalSeats == totalSeats)&&(identical(other.availableSeats, availableSeats) || other.availableSeats == availableSeats)&&(identical(other.seatsSold, seatsSold) || other.seatsSold == seatsSold)&&(identical(other.ticketPrice, ticketPrice) || other.ticketPrice == ticketPrice)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.datetimeFormatted, datetimeFormatted) || other.datetimeFormatted == datetimeFormatted));
}


@override
int get hashCode => Object.hash(runtimeType,id,movie,movieTitle,movieDuration,moviePoster,theater,theaterName,theaterCity,datetime,screenNumber,totalSeats,availableSeats,seatsSold,ticketPrice,isAvailable,date,time,datetimeFormatted);

@override
String toString() {
  return 'Showtime(id: $id, movie: $movie, movieTitle: $movieTitle, movieDuration: $movieDuration, moviePoster: $moviePoster, theater: $theater, theaterName: $theaterName, theaterCity: $theaterCity, datetime: $datetime, screenNumber: $screenNumber, totalSeats: $totalSeats, availableSeats: $availableSeats, seatsSold: $seatsSold, ticketPrice: $ticketPrice, isAvailable: $isAvailable, date: $date, time: $time, datetimeFormatted: $datetimeFormatted)';
}


}

/// @nodoc
abstract mixin class _$ShowtimeCopyWith<$Res> implements $ShowtimeCopyWith<$Res> {
  factory _$ShowtimeCopyWith(_Showtime value, $Res Function(_Showtime) _then) = __$ShowtimeCopyWithImpl;
@override @useResult
$Res call({
 String id, String movie, String? movieTitle, int? movieDuration, String? moviePoster, String theater, String? theaterName, String? theaterCity, String datetime, int screenNumber, int totalSeats, int availableSeats, int? seatsSold, double ticketPrice, bool? isAvailable, String? date, String? time, String? datetimeFormatted
});




}
/// @nodoc
class __$ShowtimeCopyWithImpl<$Res>
    implements _$ShowtimeCopyWith<$Res> {
  __$ShowtimeCopyWithImpl(this._self, this._then);

  final _Showtime _self;
  final $Res Function(_Showtime) _then;

/// Create a copy of Showtime
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? movie = null,Object? movieTitle = freezed,Object? movieDuration = freezed,Object? moviePoster = freezed,Object? theater = null,Object? theaterName = freezed,Object? theaterCity = freezed,Object? datetime = null,Object? screenNumber = null,Object? totalSeats = null,Object? availableSeats = null,Object? seatsSold = freezed,Object? ticketPrice = null,Object? isAvailable = freezed,Object? date = freezed,Object? time = freezed,Object? datetimeFormatted = freezed,}) {
  return _then(_Showtime(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,movie: null == movie ? _self.movie : movie // ignore: cast_nullable_to_non_nullable
as String,movieTitle: freezed == movieTitle ? _self.movieTitle : movieTitle // ignore: cast_nullable_to_non_nullable
as String?,movieDuration: freezed == movieDuration ? _self.movieDuration : movieDuration // ignore: cast_nullable_to_non_nullable
as int?,moviePoster: freezed == moviePoster ? _self.moviePoster : moviePoster // ignore: cast_nullable_to_non_nullable
as String?,theater: null == theater ? _self.theater : theater // ignore: cast_nullable_to_non_nullable
as String,theaterName: freezed == theaterName ? _self.theaterName : theaterName // ignore: cast_nullable_to_non_nullable
as String?,theaterCity: freezed == theaterCity ? _self.theaterCity : theaterCity // ignore: cast_nullable_to_non_nullable
as String?,datetime: null == datetime ? _self.datetime : datetime // ignore: cast_nullable_to_non_nullable
as String,screenNumber: null == screenNumber ? _self.screenNumber : screenNumber // ignore: cast_nullable_to_non_nullable
as int,totalSeats: null == totalSeats ? _self.totalSeats : totalSeats // ignore: cast_nullable_to_non_nullable
as int,availableSeats: null == availableSeats ? _self.availableSeats : availableSeats // ignore: cast_nullable_to_non_nullable
as int,seatsSold: freezed == seatsSold ? _self.seatsSold : seatsSold // ignore: cast_nullable_to_non_nullable
as int?,ticketPrice: null == ticketPrice ? _self.ticketPrice : ticketPrice // ignore: cast_nullable_to_non_nullable
as double,isAvailable: freezed == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,datetimeFormatted: freezed == datetimeFormatted ? _self.datetimeFormatted : datetimeFormatted // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
