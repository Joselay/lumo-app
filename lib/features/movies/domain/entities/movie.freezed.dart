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

// dart format on
