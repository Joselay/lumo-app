// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MoviesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoviesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoviesEvent()';
}


}

/// @nodoc
class $MoviesEventCopyWith<$Res>  {
$MoviesEventCopyWith(MoviesEvent _, $Res Function(MoviesEvent) __);
}


/// Adds pattern-matching-related methods to [MoviesEvent].
extension MoviesEventPatterns on MoviesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MoviesStarted value)?  started,TResult Function( LoadMovies value)?  loadMovies,TResult Function( LoadGenres value)?  loadGenres,TResult Function( SearchMovies value)?  searchMovies,TResult Function( FilterByGenre value)?  filterByGenre,TResult Function( ClearFilter value)?  clearFilter,TResult Function( RefreshMovies value)?  refreshMovies,TResult Function( ToggleFavorite value)?  toggleFavorite,TResult Function( LoadFavorites value)?  loadFavorites,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MoviesStarted() when started != null:
return started(_that);case LoadMovies() when loadMovies != null:
return loadMovies(_that);case LoadGenres() when loadGenres != null:
return loadGenres(_that);case SearchMovies() when searchMovies != null:
return searchMovies(_that);case FilterByGenre() when filterByGenre != null:
return filterByGenre(_that);case ClearFilter() when clearFilter != null:
return clearFilter(_that);case RefreshMovies() when refreshMovies != null:
return refreshMovies(_that);case ToggleFavorite() when toggleFavorite != null:
return toggleFavorite(_that);case LoadFavorites() when loadFavorites != null:
return loadFavorites(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MoviesStarted value)  started,required TResult Function( LoadMovies value)  loadMovies,required TResult Function( LoadGenres value)  loadGenres,required TResult Function( SearchMovies value)  searchMovies,required TResult Function( FilterByGenre value)  filterByGenre,required TResult Function( ClearFilter value)  clearFilter,required TResult Function( RefreshMovies value)  refreshMovies,required TResult Function( ToggleFavorite value)  toggleFavorite,required TResult Function( LoadFavorites value)  loadFavorites,}){
final _that = this;
switch (_that) {
case MoviesStarted():
return started(_that);case LoadMovies():
return loadMovies(_that);case LoadGenres():
return loadGenres(_that);case SearchMovies():
return searchMovies(_that);case FilterByGenre():
return filterByGenre(_that);case ClearFilter():
return clearFilter(_that);case RefreshMovies():
return refreshMovies(_that);case ToggleFavorite():
return toggleFavorite(_that);case LoadFavorites():
return loadFavorites(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MoviesStarted value)?  started,TResult? Function( LoadMovies value)?  loadMovies,TResult? Function( LoadGenres value)?  loadGenres,TResult? Function( SearchMovies value)?  searchMovies,TResult? Function( FilterByGenre value)?  filterByGenre,TResult? Function( ClearFilter value)?  clearFilter,TResult? Function( RefreshMovies value)?  refreshMovies,TResult? Function( ToggleFavorite value)?  toggleFavorite,TResult? Function( LoadFavorites value)?  loadFavorites,}){
final _that = this;
switch (_that) {
case MoviesStarted() when started != null:
return started(_that);case LoadMovies() when loadMovies != null:
return loadMovies(_that);case LoadGenres() when loadGenres != null:
return loadGenres(_that);case SearchMovies() when searchMovies != null:
return searchMovies(_that);case FilterByGenre() when filterByGenre != null:
return filterByGenre(_that);case ClearFilter() when clearFilter != null:
return clearFilter(_that);case RefreshMovies() when refreshMovies != null:
return refreshMovies(_that);case ToggleFavorite() when toggleFavorite != null:
return toggleFavorite(_that);case LoadFavorites() when loadFavorites != null:
return loadFavorites(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( MoviesFilter? filter)?  loadMovies,TResult Function()?  loadGenres,TResult Function( String query)?  searchMovies,TResult Function( String genreId)?  filterByGenre,TResult Function()?  clearFilter,TResult Function()?  refreshMovies,TResult Function( String movieId,  bool currentlyFavorited)?  toggleFavorite,TResult Function()?  loadFavorites,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MoviesStarted() when started != null:
return started();case LoadMovies() when loadMovies != null:
return loadMovies(_that.filter);case LoadGenres() when loadGenres != null:
return loadGenres();case SearchMovies() when searchMovies != null:
return searchMovies(_that.query);case FilterByGenre() when filterByGenre != null:
return filterByGenre(_that.genreId);case ClearFilter() when clearFilter != null:
return clearFilter();case RefreshMovies() when refreshMovies != null:
return refreshMovies();case ToggleFavorite() when toggleFavorite != null:
return toggleFavorite(_that.movieId,_that.currentlyFavorited);case LoadFavorites() when loadFavorites != null:
return loadFavorites();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( MoviesFilter? filter)  loadMovies,required TResult Function()  loadGenres,required TResult Function( String query)  searchMovies,required TResult Function( String genreId)  filterByGenre,required TResult Function()  clearFilter,required TResult Function()  refreshMovies,required TResult Function( String movieId,  bool currentlyFavorited)  toggleFavorite,required TResult Function()  loadFavorites,}) {final _that = this;
switch (_that) {
case MoviesStarted():
return started();case LoadMovies():
return loadMovies(_that.filter);case LoadGenres():
return loadGenres();case SearchMovies():
return searchMovies(_that.query);case FilterByGenre():
return filterByGenre(_that.genreId);case ClearFilter():
return clearFilter();case RefreshMovies():
return refreshMovies();case ToggleFavorite():
return toggleFavorite(_that.movieId,_that.currentlyFavorited);case LoadFavorites():
return loadFavorites();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( MoviesFilter? filter)?  loadMovies,TResult? Function()?  loadGenres,TResult? Function( String query)?  searchMovies,TResult? Function( String genreId)?  filterByGenre,TResult? Function()?  clearFilter,TResult? Function()?  refreshMovies,TResult? Function( String movieId,  bool currentlyFavorited)?  toggleFavorite,TResult? Function()?  loadFavorites,}) {final _that = this;
switch (_that) {
case MoviesStarted() when started != null:
return started();case LoadMovies() when loadMovies != null:
return loadMovies(_that.filter);case LoadGenres() when loadGenres != null:
return loadGenres();case SearchMovies() when searchMovies != null:
return searchMovies(_that.query);case FilterByGenre() when filterByGenre != null:
return filterByGenre(_that.genreId);case ClearFilter() when clearFilter != null:
return clearFilter();case RefreshMovies() when refreshMovies != null:
return refreshMovies();case ToggleFavorite() when toggleFavorite != null:
return toggleFavorite(_that.movieId,_that.currentlyFavorited);case LoadFavorites() when loadFavorites != null:
return loadFavorites();case _:
  return null;

}
}

}

/// @nodoc


class MoviesStarted implements MoviesEvent {
  const MoviesStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoviesStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoviesEvent.started()';
}


}




/// @nodoc


class LoadMovies implements MoviesEvent {
  const LoadMovies({this.filter});
  

 final  MoviesFilter? filter;

/// Create a copy of MoviesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadMoviesCopyWith<LoadMovies> get copyWith => _$LoadMoviesCopyWithImpl<LoadMovies>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadMovies&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'MoviesEvent.loadMovies(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $LoadMoviesCopyWith<$Res> implements $MoviesEventCopyWith<$Res> {
  factory $LoadMoviesCopyWith(LoadMovies value, $Res Function(LoadMovies) _then) = _$LoadMoviesCopyWithImpl;
@useResult
$Res call({
 MoviesFilter? filter
});


$MoviesFilterCopyWith<$Res>? get filter;

}
/// @nodoc
class _$LoadMoviesCopyWithImpl<$Res>
    implements $LoadMoviesCopyWith<$Res> {
  _$LoadMoviesCopyWithImpl(this._self, this._then);

  final LoadMovies _self;
  final $Res Function(LoadMovies) _then;

/// Create a copy of MoviesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filter = freezed,}) {
  return _then(LoadMovies(
filter: freezed == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as MoviesFilter?,
  ));
}

/// Create a copy of MoviesEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoviesFilterCopyWith<$Res>? get filter {
    if (_self.filter == null) {
    return null;
  }

  return $MoviesFilterCopyWith<$Res>(_self.filter!, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}

/// @nodoc


class LoadGenres implements MoviesEvent {
  const LoadGenres();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadGenres);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoviesEvent.loadGenres()';
}


}




/// @nodoc


class SearchMovies implements MoviesEvent {
  const SearchMovies(this.query);
  

 final  String query;

/// Create a copy of MoviesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchMoviesCopyWith<SearchMovies> get copyWith => _$SearchMoviesCopyWithImpl<SearchMovies>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchMovies&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'MoviesEvent.searchMovies(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchMoviesCopyWith<$Res> implements $MoviesEventCopyWith<$Res> {
  factory $SearchMoviesCopyWith(SearchMovies value, $Res Function(SearchMovies) _then) = _$SearchMoviesCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$SearchMoviesCopyWithImpl<$Res>
    implements $SearchMoviesCopyWith<$Res> {
  _$SearchMoviesCopyWithImpl(this._self, this._then);

  final SearchMovies _self;
  final $Res Function(SearchMovies) _then;

/// Create a copy of MoviesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(SearchMovies(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class FilterByGenre implements MoviesEvent {
  const FilterByGenre(this.genreId);
  

 final  String genreId;

/// Create a copy of MoviesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterByGenreCopyWith<FilterByGenre> get copyWith => _$FilterByGenreCopyWithImpl<FilterByGenre>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterByGenre&&(identical(other.genreId, genreId) || other.genreId == genreId));
}


@override
int get hashCode => Object.hash(runtimeType,genreId);

@override
String toString() {
  return 'MoviesEvent.filterByGenre(genreId: $genreId)';
}


}

/// @nodoc
abstract mixin class $FilterByGenreCopyWith<$Res> implements $MoviesEventCopyWith<$Res> {
  factory $FilterByGenreCopyWith(FilterByGenre value, $Res Function(FilterByGenre) _then) = _$FilterByGenreCopyWithImpl;
@useResult
$Res call({
 String genreId
});




}
/// @nodoc
class _$FilterByGenreCopyWithImpl<$Res>
    implements $FilterByGenreCopyWith<$Res> {
  _$FilterByGenreCopyWithImpl(this._self, this._then);

  final FilterByGenre _self;
  final $Res Function(FilterByGenre) _then;

/// Create a copy of MoviesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? genreId = null,}) {
  return _then(FilterByGenre(
null == genreId ? _self.genreId : genreId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ClearFilter implements MoviesEvent {
  const ClearFilter();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearFilter);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoviesEvent.clearFilter()';
}


}




/// @nodoc


class RefreshMovies implements MoviesEvent {
  const RefreshMovies();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshMovies);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoviesEvent.refreshMovies()';
}


}




/// @nodoc


class ToggleFavorite implements MoviesEvent {
  const ToggleFavorite(this.movieId, this.currentlyFavorited);
  

 final  String movieId;
 final  bool currentlyFavorited;

/// Create a copy of MoviesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleFavoriteCopyWith<ToggleFavorite> get copyWith => _$ToggleFavoriteCopyWithImpl<ToggleFavorite>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleFavorite&&(identical(other.movieId, movieId) || other.movieId == movieId)&&(identical(other.currentlyFavorited, currentlyFavorited) || other.currentlyFavorited == currentlyFavorited));
}


@override
int get hashCode => Object.hash(runtimeType,movieId,currentlyFavorited);

@override
String toString() {
  return 'MoviesEvent.toggleFavorite(movieId: $movieId, currentlyFavorited: $currentlyFavorited)';
}


}

/// @nodoc
abstract mixin class $ToggleFavoriteCopyWith<$Res> implements $MoviesEventCopyWith<$Res> {
  factory $ToggleFavoriteCopyWith(ToggleFavorite value, $Res Function(ToggleFavorite) _then) = _$ToggleFavoriteCopyWithImpl;
@useResult
$Res call({
 String movieId, bool currentlyFavorited
});




}
/// @nodoc
class _$ToggleFavoriteCopyWithImpl<$Res>
    implements $ToggleFavoriteCopyWith<$Res> {
  _$ToggleFavoriteCopyWithImpl(this._self, this._then);

  final ToggleFavorite _self;
  final $Res Function(ToggleFavorite) _then;

/// Create a copy of MoviesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movieId = null,Object? currentlyFavorited = null,}) {
  return _then(ToggleFavorite(
null == movieId ? _self.movieId : movieId // ignore: cast_nullable_to_non_nullable
as String,null == currentlyFavorited ? _self.currentlyFavorited : currentlyFavorited // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class LoadFavorites implements MoviesEvent {
  const LoadFavorites();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadFavorites);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoviesEvent.loadFavorites()';
}


}




// dart format on
