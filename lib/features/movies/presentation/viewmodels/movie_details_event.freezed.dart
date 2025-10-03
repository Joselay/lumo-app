// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_details_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MovieDetailsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MovieDetailsEvent()';
}


}

/// @nodoc
class $MovieDetailsEventCopyWith<$Res>  {
$MovieDetailsEventCopyWith(MovieDetailsEvent _, $Res Function(MovieDetailsEvent) __);
}


/// Adds pattern-matching-related methods to [MovieDetailsEvent].
extension MovieDetailsEventPatterns on MovieDetailsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MovieDetailsStarted value)?  started,TResult Function( MovieDetailsRefreshShowtimes value)?  refreshShowtimes,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MovieDetailsStarted() when started != null:
return started(_that);case MovieDetailsRefreshShowtimes() when refreshShowtimes != null:
return refreshShowtimes(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MovieDetailsStarted value)  started,required TResult Function( MovieDetailsRefreshShowtimes value)  refreshShowtimes,}){
final _that = this;
switch (_that) {
case MovieDetailsStarted():
return started(_that);case MovieDetailsRefreshShowtimes():
return refreshShowtimes(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MovieDetailsStarted value)?  started,TResult? Function( MovieDetailsRefreshShowtimes value)?  refreshShowtimes,}){
final _that = this;
switch (_that) {
case MovieDetailsStarted() when started != null:
return started(_that);case MovieDetailsRefreshShowtimes() when refreshShowtimes != null:
return refreshShowtimes(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String movieId)?  started,TResult Function()?  refreshShowtimes,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MovieDetailsStarted() when started != null:
return started(_that.movieId);case MovieDetailsRefreshShowtimes() when refreshShowtimes != null:
return refreshShowtimes();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String movieId)  started,required TResult Function()  refreshShowtimes,}) {final _that = this;
switch (_that) {
case MovieDetailsStarted():
return started(_that.movieId);case MovieDetailsRefreshShowtimes():
return refreshShowtimes();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String movieId)?  started,TResult? Function()?  refreshShowtimes,}) {final _that = this;
switch (_that) {
case MovieDetailsStarted() when started != null:
return started(_that.movieId);case MovieDetailsRefreshShowtimes() when refreshShowtimes != null:
return refreshShowtimes();case _:
  return null;

}
}

}

/// @nodoc


class MovieDetailsStarted implements MovieDetailsEvent {
  const MovieDetailsStarted(this.movieId);
  

 final  String movieId;

/// Create a copy of MovieDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDetailsStartedCopyWith<MovieDetailsStarted> get copyWith => _$MovieDetailsStartedCopyWithImpl<MovieDetailsStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailsStarted&&(identical(other.movieId, movieId) || other.movieId == movieId));
}


@override
int get hashCode => Object.hash(runtimeType,movieId);

@override
String toString() {
  return 'MovieDetailsEvent.started(movieId: $movieId)';
}


}

/// @nodoc
abstract mixin class $MovieDetailsStartedCopyWith<$Res> implements $MovieDetailsEventCopyWith<$Res> {
  factory $MovieDetailsStartedCopyWith(MovieDetailsStarted value, $Res Function(MovieDetailsStarted) _then) = _$MovieDetailsStartedCopyWithImpl;
@useResult
$Res call({
 String movieId
});




}
/// @nodoc
class _$MovieDetailsStartedCopyWithImpl<$Res>
    implements $MovieDetailsStartedCopyWith<$Res> {
  _$MovieDetailsStartedCopyWithImpl(this._self, this._then);

  final MovieDetailsStarted _self;
  final $Res Function(MovieDetailsStarted) _then;

/// Create a copy of MovieDetailsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movieId = null,}) {
  return _then(MovieDetailsStarted(
null == movieId ? _self.movieId : movieId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MovieDetailsRefreshShowtimes implements MovieDetailsEvent {
  const MovieDetailsRefreshShowtimes();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailsRefreshShowtimes);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MovieDetailsEvent.refreshShowtimes()';
}


}




// dart format on
