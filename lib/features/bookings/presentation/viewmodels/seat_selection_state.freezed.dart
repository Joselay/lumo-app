// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seat_selection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SeatSelectionState {

 SeatSelectionStatus get status; SeatMap? get seatMap; List<Seat> get selectedSeats; double get baseTicketPrice; double get totalPrice; ReservationResult? get reservationResult; String? get errorMessage; DateTime? get errorTimestamp; String? get showtimeId;
/// Create a copy of SeatSelectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeatSelectionStateCopyWith<SeatSelectionState> get copyWith => _$SeatSelectionStateCopyWithImpl<SeatSelectionState>(this as SeatSelectionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeatSelectionState&&(identical(other.status, status) || other.status == status)&&(identical(other.seatMap, seatMap) || other.seatMap == seatMap)&&const DeepCollectionEquality().equals(other.selectedSeats, selectedSeats)&&(identical(other.baseTicketPrice, baseTicketPrice) || other.baseTicketPrice == baseTicketPrice)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.reservationResult, reservationResult) || other.reservationResult == reservationResult)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.errorTimestamp, errorTimestamp) || other.errorTimestamp == errorTimestamp)&&(identical(other.showtimeId, showtimeId) || other.showtimeId == showtimeId));
}


@override
int get hashCode => Object.hash(runtimeType,status,seatMap,const DeepCollectionEquality().hash(selectedSeats),baseTicketPrice,totalPrice,reservationResult,errorMessage,errorTimestamp,showtimeId);

@override
String toString() {
  return 'SeatSelectionState(status: $status, seatMap: $seatMap, selectedSeats: $selectedSeats, baseTicketPrice: $baseTicketPrice, totalPrice: $totalPrice, reservationResult: $reservationResult, errorMessage: $errorMessage, errorTimestamp: $errorTimestamp, showtimeId: $showtimeId)';
}


}

/// @nodoc
abstract mixin class $SeatSelectionStateCopyWith<$Res>  {
  factory $SeatSelectionStateCopyWith(SeatSelectionState value, $Res Function(SeatSelectionState) _then) = _$SeatSelectionStateCopyWithImpl;
@useResult
$Res call({
 SeatSelectionStatus status, SeatMap? seatMap, List<Seat> selectedSeats, double baseTicketPrice, double totalPrice, ReservationResult? reservationResult, String? errorMessage, DateTime? errorTimestamp, String? showtimeId
});


$SeatMapCopyWith<$Res>? get seatMap;$ReservationResultCopyWith<$Res>? get reservationResult;

}
/// @nodoc
class _$SeatSelectionStateCopyWithImpl<$Res>
    implements $SeatSelectionStateCopyWith<$Res> {
  _$SeatSelectionStateCopyWithImpl(this._self, this._then);

  final SeatSelectionState _self;
  final $Res Function(SeatSelectionState) _then;

/// Create a copy of SeatSelectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? seatMap = freezed,Object? selectedSeats = null,Object? baseTicketPrice = null,Object? totalPrice = null,Object? reservationResult = freezed,Object? errorMessage = freezed,Object? errorTimestamp = freezed,Object? showtimeId = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SeatSelectionStatus,seatMap: freezed == seatMap ? _self.seatMap : seatMap // ignore: cast_nullable_to_non_nullable
as SeatMap?,selectedSeats: null == selectedSeats ? _self.selectedSeats : selectedSeats // ignore: cast_nullable_to_non_nullable
as List<Seat>,baseTicketPrice: null == baseTicketPrice ? _self.baseTicketPrice : baseTicketPrice // ignore: cast_nullable_to_non_nullable
as double,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,reservationResult: freezed == reservationResult ? _self.reservationResult : reservationResult // ignore: cast_nullable_to_non_nullable
as ReservationResult?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,errorTimestamp: freezed == errorTimestamp ? _self.errorTimestamp : errorTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,showtimeId: freezed == showtimeId ? _self.showtimeId : showtimeId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SeatSelectionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeatMapCopyWith<$Res>? get seatMap {
    if (_self.seatMap == null) {
    return null;
  }

  return $SeatMapCopyWith<$Res>(_self.seatMap!, (value) {
    return _then(_self.copyWith(seatMap: value));
  });
}/// Create a copy of SeatSelectionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReservationResultCopyWith<$Res>? get reservationResult {
    if (_self.reservationResult == null) {
    return null;
  }

  return $ReservationResultCopyWith<$Res>(_self.reservationResult!, (value) {
    return _then(_self.copyWith(reservationResult: value));
  });
}
}


/// Adds pattern-matching-related methods to [SeatSelectionState].
extension SeatSelectionStatePatterns on SeatSelectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeatSelectionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeatSelectionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeatSelectionState value)  $default,){
final _that = this;
switch (_that) {
case _SeatSelectionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeatSelectionState value)?  $default,){
final _that = this;
switch (_that) {
case _SeatSelectionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SeatSelectionStatus status,  SeatMap? seatMap,  List<Seat> selectedSeats,  double baseTicketPrice,  double totalPrice,  ReservationResult? reservationResult,  String? errorMessage,  DateTime? errorTimestamp,  String? showtimeId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeatSelectionState() when $default != null:
return $default(_that.status,_that.seatMap,_that.selectedSeats,_that.baseTicketPrice,_that.totalPrice,_that.reservationResult,_that.errorMessage,_that.errorTimestamp,_that.showtimeId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SeatSelectionStatus status,  SeatMap? seatMap,  List<Seat> selectedSeats,  double baseTicketPrice,  double totalPrice,  ReservationResult? reservationResult,  String? errorMessage,  DateTime? errorTimestamp,  String? showtimeId)  $default,) {final _that = this;
switch (_that) {
case _SeatSelectionState():
return $default(_that.status,_that.seatMap,_that.selectedSeats,_that.baseTicketPrice,_that.totalPrice,_that.reservationResult,_that.errorMessage,_that.errorTimestamp,_that.showtimeId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SeatSelectionStatus status,  SeatMap? seatMap,  List<Seat> selectedSeats,  double baseTicketPrice,  double totalPrice,  ReservationResult? reservationResult,  String? errorMessage,  DateTime? errorTimestamp,  String? showtimeId)?  $default,) {final _that = this;
switch (_that) {
case _SeatSelectionState() when $default != null:
return $default(_that.status,_that.seatMap,_that.selectedSeats,_that.baseTicketPrice,_that.totalPrice,_that.reservationResult,_that.errorMessage,_that.errorTimestamp,_that.showtimeId);case _:
  return null;

}
}

}

/// @nodoc


class _SeatSelectionState extends SeatSelectionState {
  const _SeatSelectionState({this.status = SeatSelectionStatus.initial, this.seatMap, final  List<Seat> selectedSeats = const [], this.baseTicketPrice = 0.0, this.totalPrice = 0.0, this.reservationResult, this.errorMessage, this.errorTimestamp, this.showtimeId}): _selectedSeats = selectedSeats,super._();
  

@override@JsonKey() final  SeatSelectionStatus status;
@override final  SeatMap? seatMap;
 final  List<Seat> _selectedSeats;
@override@JsonKey() List<Seat> get selectedSeats {
  if (_selectedSeats is EqualUnmodifiableListView) return _selectedSeats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedSeats);
}

@override@JsonKey() final  double baseTicketPrice;
@override@JsonKey() final  double totalPrice;
@override final  ReservationResult? reservationResult;
@override final  String? errorMessage;
@override final  DateTime? errorTimestamp;
@override final  String? showtimeId;

/// Create a copy of SeatSelectionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeatSelectionStateCopyWith<_SeatSelectionState> get copyWith => __$SeatSelectionStateCopyWithImpl<_SeatSelectionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeatSelectionState&&(identical(other.status, status) || other.status == status)&&(identical(other.seatMap, seatMap) || other.seatMap == seatMap)&&const DeepCollectionEquality().equals(other._selectedSeats, _selectedSeats)&&(identical(other.baseTicketPrice, baseTicketPrice) || other.baseTicketPrice == baseTicketPrice)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.reservationResult, reservationResult) || other.reservationResult == reservationResult)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.errorTimestamp, errorTimestamp) || other.errorTimestamp == errorTimestamp)&&(identical(other.showtimeId, showtimeId) || other.showtimeId == showtimeId));
}


@override
int get hashCode => Object.hash(runtimeType,status,seatMap,const DeepCollectionEquality().hash(_selectedSeats),baseTicketPrice,totalPrice,reservationResult,errorMessage,errorTimestamp,showtimeId);

@override
String toString() {
  return 'SeatSelectionState(status: $status, seatMap: $seatMap, selectedSeats: $selectedSeats, baseTicketPrice: $baseTicketPrice, totalPrice: $totalPrice, reservationResult: $reservationResult, errorMessage: $errorMessage, errorTimestamp: $errorTimestamp, showtimeId: $showtimeId)';
}


}

/// @nodoc
abstract mixin class _$SeatSelectionStateCopyWith<$Res> implements $SeatSelectionStateCopyWith<$Res> {
  factory _$SeatSelectionStateCopyWith(_SeatSelectionState value, $Res Function(_SeatSelectionState) _then) = __$SeatSelectionStateCopyWithImpl;
@override @useResult
$Res call({
 SeatSelectionStatus status, SeatMap? seatMap, List<Seat> selectedSeats, double baseTicketPrice, double totalPrice, ReservationResult? reservationResult, String? errorMessage, DateTime? errorTimestamp, String? showtimeId
});


@override $SeatMapCopyWith<$Res>? get seatMap;@override $ReservationResultCopyWith<$Res>? get reservationResult;

}
/// @nodoc
class __$SeatSelectionStateCopyWithImpl<$Res>
    implements _$SeatSelectionStateCopyWith<$Res> {
  __$SeatSelectionStateCopyWithImpl(this._self, this._then);

  final _SeatSelectionState _self;
  final $Res Function(_SeatSelectionState) _then;

/// Create a copy of SeatSelectionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? seatMap = freezed,Object? selectedSeats = null,Object? baseTicketPrice = null,Object? totalPrice = null,Object? reservationResult = freezed,Object? errorMessage = freezed,Object? errorTimestamp = freezed,Object? showtimeId = freezed,}) {
  return _then(_SeatSelectionState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SeatSelectionStatus,seatMap: freezed == seatMap ? _self.seatMap : seatMap // ignore: cast_nullable_to_non_nullable
as SeatMap?,selectedSeats: null == selectedSeats ? _self._selectedSeats : selectedSeats // ignore: cast_nullable_to_non_nullable
as List<Seat>,baseTicketPrice: null == baseTicketPrice ? _self.baseTicketPrice : baseTicketPrice // ignore: cast_nullable_to_non_nullable
as double,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,reservationResult: freezed == reservationResult ? _self.reservationResult : reservationResult // ignore: cast_nullable_to_non_nullable
as ReservationResult?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,errorTimestamp: freezed == errorTimestamp ? _self.errorTimestamp : errorTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,showtimeId: freezed == showtimeId ? _self.showtimeId : showtimeId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SeatSelectionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SeatMapCopyWith<$Res>? get seatMap {
    if (_self.seatMap == null) {
    return null;
  }

  return $SeatMapCopyWith<$Res>(_self.seatMap!, (value) {
    return _then(_self.copyWith(seatMap: value));
  });
}/// Create a copy of SeatSelectionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReservationResultCopyWith<$Res>? get reservationResult {
    if (_self.reservationResult == null) {
    return null;
  }

  return $ReservationResultCopyWith<$Res>(_self.reservationResult!, (value) {
    return _then(_self.copyWith(reservationResult: value));
  });
}
}

// dart format on
