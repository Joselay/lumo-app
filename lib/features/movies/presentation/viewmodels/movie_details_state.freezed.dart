// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MovieDetailsState {

 MovieDetailsStatus get status; List<Showtime> get showtimes; String? get errorMessage; DateTime? get errorTimestamp; String? get movieId;
/// Create a copy of MovieDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDetailsStateCopyWith<MovieDetailsState> get copyWith => _$MovieDetailsStateCopyWithImpl<MovieDetailsState>(this as MovieDetailsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieDetailsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.showtimes, showtimes)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.errorTimestamp, errorTimestamp) || other.errorTimestamp == errorTimestamp)&&(identical(other.movieId, movieId) || other.movieId == movieId));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(showtimes),errorMessage,errorTimestamp,movieId);

@override
String toString() {
  return 'MovieDetailsState(status: $status, showtimes: $showtimes, errorMessage: $errorMessage, errorTimestamp: $errorTimestamp, movieId: $movieId)';
}


}

/// @nodoc
abstract mixin class $MovieDetailsStateCopyWith<$Res>  {
  factory $MovieDetailsStateCopyWith(MovieDetailsState value, $Res Function(MovieDetailsState) _then) = _$MovieDetailsStateCopyWithImpl;
@useResult
$Res call({
 MovieDetailsStatus status, List<Showtime> showtimes, String? errorMessage, DateTime? errorTimestamp, String? movieId
});




}
/// @nodoc
class _$MovieDetailsStateCopyWithImpl<$Res>
    implements $MovieDetailsStateCopyWith<$Res> {
  _$MovieDetailsStateCopyWithImpl(this._self, this._then);

  final MovieDetailsState _self;
  final $Res Function(MovieDetailsState) _then;

/// Create a copy of MovieDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? showtimes = null,Object? errorMessage = freezed,Object? errorTimestamp = freezed,Object? movieId = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MovieDetailsStatus,showtimes: null == showtimes ? _self.showtimes : showtimes // ignore: cast_nullable_to_non_nullable
as List<Showtime>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,errorTimestamp: freezed == errorTimestamp ? _self.errorTimestamp : errorTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,movieId: freezed == movieId ? _self.movieId : movieId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieDetailsState].
extension MovieDetailsStatePatterns on MovieDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieDetailsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieDetailsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieDetailsState value)  $default,){
final _that = this;
switch (_that) {
case _MovieDetailsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieDetailsState value)?  $default,){
final _that = this;
switch (_that) {
case _MovieDetailsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MovieDetailsStatus status,  List<Showtime> showtimes,  String? errorMessage,  DateTime? errorTimestamp,  String? movieId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieDetailsState() when $default != null:
return $default(_that.status,_that.showtimes,_that.errorMessage,_that.errorTimestamp,_that.movieId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MovieDetailsStatus status,  List<Showtime> showtimes,  String? errorMessage,  DateTime? errorTimestamp,  String? movieId)  $default,) {final _that = this;
switch (_that) {
case _MovieDetailsState():
return $default(_that.status,_that.showtimes,_that.errorMessage,_that.errorTimestamp,_that.movieId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MovieDetailsStatus status,  List<Showtime> showtimes,  String? errorMessage,  DateTime? errorTimestamp,  String? movieId)?  $default,) {final _that = this;
switch (_that) {
case _MovieDetailsState() when $default != null:
return $default(_that.status,_that.showtimes,_that.errorMessage,_that.errorTimestamp,_that.movieId);case _:
  return null;

}
}

}

/// @nodoc


class _MovieDetailsState implements MovieDetailsState {
  const _MovieDetailsState({this.status = MovieDetailsStatus.initial, final  List<Showtime> showtimes = const [], this.errorMessage, this.errorTimestamp, this.movieId}): _showtimes = showtimes;
  

@override@JsonKey() final  MovieDetailsStatus status;
 final  List<Showtime> _showtimes;
@override@JsonKey() List<Showtime> get showtimes {
  if (_showtimes is EqualUnmodifiableListView) return _showtimes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_showtimes);
}

@override final  String? errorMessage;
@override final  DateTime? errorTimestamp;
@override final  String? movieId;

/// Create a copy of MovieDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieDetailsStateCopyWith<_MovieDetailsState> get copyWith => __$MovieDetailsStateCopyWithImpl<_MovieDetailsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieDetailsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._showtimes, _showtimes)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.errorTimestamp, errorTimestamp) || other.errorTimestamp == errorTimestamp)&&(identical(other.movieId, movieId) || other.movieId == movieId));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_showtimes),errorMessage,errorTimestamp,movieId);

@override
String toString() {
  return 'MovieDetailsState(status: $status, showtimes: $showtimes, errorMessage: $errorMessage, errorTimestamp: $errorTimestamp, movieId: $movieId)';
}


}

/// @nodoc
abstract mixin class _$MovieDetailsStateCopyWith<$Res> implements $MovieDetailsStateCopyWith<$Res> {
  factory _$MovieDetailsStateCopyWith(_MovieDetailsState value, $Res Function(_MovieDetailsState) _then) = __$MovieDetailsStateCopyWithImpl;
@override @useResult
$Res call({
 MovieDetailsStatus status, List<Showtime> showtimes, String? errorMessage, DateTime? errorTimestamp, String? movieId
});




}
/// @nodoc
class __$MovieDetailsStateCopyWithImpl<$Res>
    implements _$MovieDetailsStateCopyWith<$Res> {
  __$MovieDetailsStateCopyWithImpl(this._self, this._then);

  final _MovieDetailsState _self;
  final $Res Function(_MovieDetailsState) _then;

/// Create a copy of MovieDetailsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? showtimes = null,Object? errorMessage = freezed,Object? errorTimestamp = freezed,Object? movieId = freezed,}) {
  return _then(_MovieDetailsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MovieDetailsStatus,showtimes: null == showtimes ? _self._showtimes : showtimes // ignore: cast_nullable_to_non_nullable
as List<Showtime>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,errorTimestamp: freezed == errorTimestamp ? _self.errorTimestamp : errorTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,movieId: freezed == movieId ? _self.movieId : movieId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
