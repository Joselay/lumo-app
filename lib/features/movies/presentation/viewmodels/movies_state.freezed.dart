// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MoviesState {

 MoviesStatus get status; List<Movie> get movies; List<Genre> get genres; List<Movie> get favoriteMovies; String? get errorMessage; DateTime? get errorTimestamp; String? get searchQuery; String? get selectedGenreId; MoviesFilter? get currentFilter; bool get isRefreshing; bool get isFavoritesLoading;
/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoviesStateCopyWith<MoviesState> get copyWith => _$MoviesStateCopyWithImpl<MoviesState>(this as MoviesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoviesState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.movies, movies)&&const DeepCollectionEquality().equals(other.genres, genres)&&const DeepCollectionEquality().equals(other.favoriteMovies, favoriteMovies)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.errorTimestamp, errorTimestamp) || other.errorTimestamp == errorTimestamp)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.selectedGenreId, selectedGenreId) || other.selectedGenreId == selectedGenreId)&&(identical(other.currentFilter, currentFilter) || other.currentFilter == currentFilter)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.isFavoritesLoading, isFavoritesLoading) || other.isFavoritesLoading == isFavoritesLoading));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(movies),const DeepCollectionEquality().hash(genres),const DeepCollectionEquality().hash(favoriteMovies),errorMessage,errorTimestamp,searchQuery,selectedGenreId,currentFilter,isRefreshing,isFavoritesLoading);

@override
String toString() {
  return 'MoviesState(status: $status, movies: $movies, genres: $genres, favoriteMovies: $favoriteMovies, errorMessage: $errorMessage, errorTimestamp: $errorTimestamp, searchQuery: $searchQuery, selectedGenreId: $selectedGenreId, currentFilter: $currentFilter, isRefreshing: $isRefreshing, isFavoritesLoading: $isFavoritesLoading)';
}


}

/// @nodoc
abstract mixin class $MoviesStateCopyWith<$Res>  {
  factory $MoviesStateCopyWith(MoviesState value, $Res Function(MoviesState) _then) = _$MoviesStateCopyWithImpl;
@useResult
$Res call({
 MoviesStatus status, List<Movie> movies, List<Genre> genres, List<Movie> favoriteMovies, String? errorMessage, DateTime? errorTimestamp, String? searchQuery, String? selectedGenreId, MoviesFilter? currentFilter, bool isRefreshing, bool isFavoritesLoading
});


$MoviesFilterCopyWith<$Res>? get currentFilter;

}
/// @nodoc
class _$MoviesStateCopyWithImpl<$Res>
    implements $MoviesStateCopyWith<$Res> {
  _$MoviesStateCopyWithImpl(this._self, this._then);

  final MoviesState _self;
  final $Res Function(MoviesState) _then;

/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? movies = null,Object? genres = null,Object? favoriteMovies = null,Object? errorMessage = freezed,Object? errorTimestamp = freezed,Object? searchQuery = freezed,Object? selectedGenreId = freezed,Object? currentFilter = freezed,Object? isRefreshing = null,Object? isFavoritesLoading = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MoviesStatus,movies: null == movies ? _self.movies : movies // ignore: cast_nullable_to_non_nullable
as List<Movie>,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genre>,favoriteMovies: null == favoriteMovies ? _self.favoriteMovies : favoriteMovies // ignore: cast_nullable_to_non_nullable
as List<Movie>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,errorTimestamp: freezed == errorTimestamp ? _self.errorTimestamp : errorTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,searchQuery: freezed == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String?,selectedGenreId: freezed == selectedGenreId ? _self.selectedGenreId : selectedGenreId // ignore: cast_nullable_to_non_nullable
as String?,currentFilter: freezed == currentFilter ? _self.currentFilter : currentFilter // ignore: cast_nullable_to_non_nullable
as MoviesFilter?,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,isFavoritesLoading: null == isFavoritesLoading ? _self.isFavoritesLoading : isFavoritesLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoviesFilterCopyWith<$Res>? get currentFilter {
    if (_self.currentFilter == null) {
    return null;
  }

  return $MoviesFilterCopyWith<$Res>(_self.currentFilter!, (value) {
    return _then(_self.copyWith(currentFilter: value));
  });
}
}


/// Adds pattern-matching-related methods to [MoviesState].
extension MoviesStatePatterns on MoviesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MoviesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MoviesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MoviesState value)  $default,){
final _that = this;
switch (_that) {
case _MoviesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MoviesState value)?  $default,){
final _that = this;
switch (_that) {
case _MoviesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MoviesStatus status,  List<Movie> movies,  List<Genre> genres,  List<Movie> favoriteMovies,  String? errorMessage,  DateTime? errorTimestamp,  String? searchQuery,  String? selectedGenreId,  MoviesFilter? currentFilter,  bool isRefreshing,  bool isFavoritesLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MoviesState() when $default != null:
return $default(_that.status,_that.movies,_that.genres,_that.favoriteMovies,_that.errorMessage,_that.errorTimestamp,_that.searchQuery,_that.selectedGenreId,_that.currentFilter,_that.isRefreshing,_that.isFavoritesLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MoviesStatus status,  List<Movie> movies,  List<Genre> genres,  List<Movie> favoriteMovies,  String? errorMessage,  DateTime? errorTimestamp,  String? searchQuery,  String? selectedGenreId,  MoviesFilter? currentFilter,  bool isRefreshing,  bool isFavoritesLoading)  $default,) {final _that = this;
switch (_that) {
case _MoviesState():
return $default(_that.status,_that.movies,_that.genres,_that.favoriteMovies,_that.errorMessage,_that.errorTimestamp,_that.searchQuery,_that.selectedGenreId,_that.currentFilter,_that.isRefreshing,_that.isFavoritesLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MoviesStatus status,  List<Movie> movies,  List<Genre> genres,  List<Movie> favoriteMovies,  String? errorMessage,  DateTime? errorTimestamp,  String? searchQuery,  String? selectedGenreId,  MoviesFilter? currentFilter,  bool isRefreshing,  bool isFavoritesLoading)?  $default,) {final _that = this;
switch (_that) {
case _MoviesState() when $default != null:
return $default(_that.status,_that.movies,_that.genres,_that.favoriteMovies,_that.errorMessage,_that.errorTimestamp,_that.searchQuery,_that.selectedGenreId,_that.currentFilter,_that.isRefreshing,_that.isFavoritesLoading);case _:
  return null;

}
}

}

/// @nodoc


class _MoviesState implements MoviesState {
  const _MoviesState({this.status = MoviesStatus.initial, final  List<Movie> movies = const [], final  List<Genre> genres = const [], final  List<Movie> favoriteMovies = const [], this.errorMessage, this.errorTimestamp, this.searchQuery, this.selectedGenreId, this.currentFilter, this.isRefreshing = false, this.isFavoritesLoading = false}): _movies = movies,_genres = genres,_favoriteMovies = favoriteMovies;
  

@override@JsonKey() final  MoviesStatus status;
 final  List<Movie> _movies;
@override@JsonKey() List<Movie> get movies {
  if (_movies is EqualUnmodifiableListView) return _movies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_movies);
}

 final  List<Genre> _genres;
@override@JsonKey() List<Genre> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}

 final  List<Movie> _favoriteMovies;
@override@JsonKey() List<Movie> get favoriteMovies {
  if (_favoriteMovies is EqualUnmodifiableListView) return _favoriteMovies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favoriteMovies);
}

@override final  String? errorMessage;
@override final  DateTime? errorTimestamp;
@override final  String? searchQuery;
@override final  String? selectedGenreId;
@override final  MoviesFilter? currentFilter;
@override@JsonKey() final  bool isRefreshing;
@override@JsonKey() final  bool isFavoritesLoading;

/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MoviesStateCopyWith<_MoviesState> get copyWith => __$MoviesStateCopyWithImpl<_MoviesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MoviesState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._movies, _movies)&&const DeepCollectionEquality().equals(other._genres, _genres)&&const DeepCollectionEquality().equals(other._favoriteMovies, _favoriteMovies)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.errorTimestamp, errorTimestamp) || other.errorTimestamp == errorTimestamp)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.selectedGenreId, selectedGenreId) || other.selectedGenreId == selectedGenreId)&&(identical(other.currentFilter, currentFilter) || other.currentFilter == currentFilter)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.isFavoritesLoading, isFavoritesLoading) || other.isFavoritesLoading == isFavoritesLoading));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_movies),const DeepCollectionEquality().hash(_genres),const DeepCollectionEquality().hash(_favoriteMovies),errorMessage,errorTimestamp,searchQuery,selectedGenreId,currentFilter,isRefreshing,isFavoritesLoading);

@override
String toString() {
  return 'MoviesState(status: $status, movies: $movies, genres: $genres, favoriteMovies: $favoriteMovies, errorMessage: $errorMessage, errorTimestamp: $errorTimestamp, searchQuery: $searchQuery, selectedGenreId: $selectedGenreId, currentFilter: $currentFilter, isRefreshing: $isRefreshing, isFavoritesLoading: $isFavoritesLoading)';
}


}

/// @nodoc
abstract mixin class _$MoviesStateCopyWith<$Res> implements $MoviesStateCopyWith<$Res> {
  factory _$MoviesStateCopyWith(_MoviesState value, $Res Function(_MoviesState) _then) = __$MoviesStateCopyWithImpl;
@override @useResult
$Res call({
 MoviesStatus status, List<Movie> movies, List<Genre> genres, List<Movie> favoriteMovies, String? errorMessage, DateTime? errorTimestamp, String? searchQuery, String? selectedGenreId, MoviesFilter? currentFilter, bool isRefreshing, bool isFavoritesLoading
});


@override $MoviesFilterCopyWith<$Res>? get currentFilter;

}
/// @nodoc
class __$MoviesStateCopyWithImpl<$Res>
    implements _$MoviesStateCopyWith<$Res> {
  __$MoviesStateCopyWithImpl(this._self, this._then);

  final _MoviesState _self;
  final $Res Function(_MoviesState) _then;

/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? movies = null,Object? genres = null,Object? favoriteMovies = null,Object? errorMessage = freezed,Object? errorTimestamp = freezed,Object? searchQuery = freezed,Object? selectedGenreId = freezed,Object? currentFilter = freezed,Object? isRefreshing = null,Object? isFavoritesLoading = null,}) {
  return _then(_MoviesState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MoviesStatus,movies: null == movies ? _self._movies : movies // ignore: cast_nullable_to_non_nullable
as List<Movie>,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<Genre>,favoriteMovies: null == favoriteMovies ? _self._favoriteMovies : favoriteMovies // ignore: cast_nullable_to_non_nullable
as List<Movie>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,errorTimestamp: freezed == errorTimestamp ? _self.errorTimestamp : errorTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,searchQuery: freezed == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String?,selectedGenreId: freezed == selectedGenreId ? _self.selectedGenreId : selectedGenreId // ignore: cast_nullable_to_non_nullable
as String?,currentFilter: freezed == currentFilter ? _self.currentFilter : currentFilter // ignore: cast_nullable_to_non_nullable
as MoviesFilter?,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,isFavoritesLoading: null == isFavoritesLoading ? _self.isFavoritesLoading : isFavoritesLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MoviesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoviesFilterCopyWith<$Res>? get currentFilter {
    if (_self.currentFilter == null) {
    return null;
  }

  return $MoviesFilterCopyWith<$Res>(_self.currentFilter!, (value) {
    return _then(_self.copyWith(currentFilter: value));
  });
}
}

// dart format on
