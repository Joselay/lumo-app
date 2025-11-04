// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seat_selection_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SeatSelectionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeatSelectionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SeatSelectionEvent()';
}


}

/// @nodoc
class $SeatSelectionEventCopyWith<$Res>  {
$SeatSelectionEventCopyWith(SeatSelectionEvent _, $Res Function(SeatSelectionEvent) __);
}


/// Adds pattern-matching-related methods to [SeatSelectionEvent].
extension SeatSelectionEventPatterns on SeatSelectionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SeatSelectionStarted value)?  started,TResult Function( SeatSelectionSeatToggled value)?  seatToggled,TResult Function( SeatSelectionReserveSeats value)?  reserveSeats,TResult Function( SeatSelectionRefreshSeatMap value)?  refreshSeatMap,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SeatSelectionStarted() when started != null:
return started(_that);case SeatSelectionSeatToggled() when seatToggled != null:
return seatToggled(_that);case SeatSelectionReserveSeats() when reserveSeats != null:
return reserveSeats(_that);case SeatSelectionRefreshSeatMap() when refreshSeatMap != null:
return refreshSeatMap(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SeatSelectionStarted value)  started,required TResult Function( SeatSelectionSeatToggled value)  seatToggled,required TResult Function( SeatSelectionReserveSeats value)  reserveSeats,required TResult Function( SeatSelectionRefreshSeatMap value)  refreshSeatMap,}){
final _that = this;
switch (_that) {
case SeatSelectionStarted():
return started(_that);case SeatSelectionSeatToggled():
return seatToggled(_that);case SeatSelectionReserveSeats():
return reserveSeats(_that);case SeatSelectionRefreshSeatMap():
return refreshSeatMap(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SeatSelectionStarted value)?  started,TResult? Function( SeatSelectionSeatToggled value)?  seatToggled,TResult? Function( SeatSelectionReserveSeats value)?  reserveSeats,TResult? Function( SeatSelectionRefreshSeatMap value)?  refreshSeatMap,}){
final _that = this;
switch (_that) {
case SeatSelectionStarted() when started != null:
return started(_that);case SeatSelectionSeatToggled() when seatToggled != null:
return seatToggled(_that);case SeatSelectionReserveSeats() when reserveSeats != null:
return reserveSeats(_that);case SeatSelectionRefreshSeatMap() when refreshSeatMap != null:
return refreshSeatMap(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String showtimeId)?  started,TResult Function( String seatId)?  seatToggled,TResult Function()?  reserveSeats,TResult Function()?  refreshSeatMap,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SeatSelectionStarted() when started != null:
return started(_that.showtimeId);case SeatSelectionSeatToggled() when seatToggled != null:
return seatToggled(_that.seatId);case SeatSelectionReserveSeats() when reserveSeats != null:
return reserveSeats();case SeatSelectionRefreshSeatMap() when refreshSeatMap != null:
return refreshSeatMap();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String showtimeId)  started,required TResult Function( String seatId)  seatToggled,required TResult Function()  reserveSeats,required TResult Function()  refreshSeatMap,}) {final _that = this;
switch (_that) {
case SeatSelectionStarted():
return started(_that.showtimeId);case SeatSelectionSeatToggled():
return seatToggled(_that.seatId);case SeatSelectionReserveSeats():
return reserveSeats();case SeatSelectionRefreshSeatMap():
return refreshSeatMap();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String showtimeId)?  started,TResult? Function( String seatId)?  seatToggled,TResult? Function()?  reserveSeats,TResult? Function()?  refreshSeatMap,}) {final _that = this;
switch (_that) {
case SeatSelectionStarted() when started != null:
return started(_that.showtimeId);case SeatSelectionSeatToggled() when seatToggled != null:
return seatToggled(_that.seatId);case SeatSelectionReserveSeats() when reserveSeats != null:
return reserveSeats();case SeatSelectionRefreshSeatMap() when refreshSeatMap != null:
return refreshSeatMap();case _:
  return null;

}
}

}

/// @nodoc


class SeatSelectionStarted implements SeatSelectionEvent {
  const SeatSelectionStarted(this.showtimeId);
  

 final  String showtimeId;

/// Create a copy of SeatSelectionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeatSelectionStartedCopyWith<SeatSelectionStarted> get copyWith => _$SeatSelectionStartedCopyWithImpl<SeatSelectionStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeatSelectionStarted&&(identical(other.showtimeId, showtimeId) || other.showtimeId == showtimeId));
}


@override
int get hashCode => Object.hash(runtimeType,showtimeId);

@override
String toString() {
  return 'SeatSelectionEvent.started(showtimeId: $showtimeId)';
}


}

/// @nodoc
abstract mixin class $SeatSelectionStartedCopyWith<$Res> implements $SeatSelectionEventCopyWith<$Res> {
  factory $SeatSelectionStartedCopyWith(SeatSelectionStarted value, $Res Function(SeatSelectionStarted) _then) = _$SeatSelectionStartedCopyWithImpl;
@useResult
$Res call({
 String showtimeId
});




}
/// @nodoc
class _$SeatSelectionStartedCopyWithImpl<$Res>
    implements $SeatSelectionStartedCopyWith<$Res> {
  _$SeatSelectionStartedCopyWithImpl(this._self, this._then);

  final SeatSelectionStarted _self;
  final $Res Function(SeatSelectionStarted) _then;

/// Create a copy of SeatSelectionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? showtimeId = null,}) {
  return _then(SeatSelectionStarted(
null == showtimeId ? _self.showtimeId : showtimeId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SeatSelectionSeatToggled implements SeatSelectionEvent {
  const SeatSelectionSeatToggled(this.seatId);
  

 final  String seatId;

/// Create a copy of SeatSelectionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeatSelectionSeatToggledCopyWith<SeatSelectionSeatToggled> get copyWith => _$SeatSelectionSeatToggledCopyWithImpl<SeatSelectionSeatToggled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeatSelectionSeatToggled&&(identical(other.seatId, seatId) || other.seatId == seatId));
}


@override
int get hashCode => Object.hash(runtimeType,seatId);

@override
String toString() {
  return 'SeatSelectionEvent.seatToggled(seatId: $seatId)';
}


}

/// @nodoc
abstract mixin class $SeatSelectionSeatToggledCopyWith<$Res> implements $SeatSelectionEventCopyWith<$Res> {
  factory $SeatSelectionSeatToggledCopyWith(SeatSelectionSeatToggled value, $Res Function(SeatSelectionSeatToggled) _then) = _$SeatSelectionSeatToggledCopyWithImpl;
@useResult
$Res call({
 String seatId
});




}
/// @nodoc
class _$SeatSelectionSeatToggledCopyWithImpl<$Res>
    implements $SeatSelectionSeatToggledCopyWith<$Res> {
  _$SeatSelectionSeatToggledCopyWithImpl(this._self, this._then);

  final SeatSelectionSeatToggled _self;
  final $Res Function(SeatSelectionSeatToggled) _then;

/// Create a copy of SeatSelectionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? seatId = null,}) {
  return _then(SeatSelectionSeatToggled(
null == seatId ? _self.seatId : seatId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SeatSelectionReserveSeats implements SeatSelectionEvent {
  const SeatSelectionReserveSeats();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeatSelectionReserveSeats);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SeatSelectionEvent.reserveSeats()';
}


}




/// @nodoc


class SeatSelectionRefreshSeatMap implements SeatSelectionEvent {
  const SeatSelectionRefreshSeatMap();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeatSelectionRefreshSeatMap);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SeatSelectionEvent.refreshSeatMap()';
}


}




// dart format on
