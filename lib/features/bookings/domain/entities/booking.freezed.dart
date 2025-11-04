// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Seat {

 String get seatId; SeatType get seatType; double get priceMultiplier; bool get isAvailable; bool get isBlocked; bool get isSelected;
/// Create a copy of Seat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeatCopyWith<Seat> get copyWith => _$SeatCopyWithImpl<Seat>(this as Seat, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Seat&&(identical(other.seatId, seatId) || other.seatId == seatId)&&(identical(other.seatType, seatType) || other.seatType == seatType)&&(identical(other.priceMultiplier, priceMultiplier) || other.priceMultiplier == priceMultiplier)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.isBlocked, isBlocked) || other.isBlocked == isBlocked)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected));
}


@override
int get hashCode => Object.hash(runtimeType,seatId,seatType,priceMultiplier,isAvailable,isBlocked,isSelected);

@override
String toString() {
  return 'Seat(seatId: $seatId, seatType: $seatType, priceMultiplier: $priceMultiplier, isAvailable: $isAvailable, isBlocked: $isBlocked, isSelected: $isSelected)';
}


}

/// @nodoc
abstract mixin class $SeatCopyWith<$Res>  {
  factory $SeatCopyWith(Seat value, $Res Function(Seat) _then) = _$SeatCopyWithImpl;
@useResult
$Res call({
 String seatId, SeatType seatType, double priceMultiplier, bool isAvailable, bool isBlocked, bool isSelected
});




}
/// @nodoc
class _$SeatCopyWithImpl<$Res>
    implements $SeatCopyWith<$Res> {
  _$SeatCopyWithImpl(this._self, this._then);

  final Seat _self;
  final $Res Function(Seat) _then;

/// Create a copy of Seat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? seatId = null,Object? seatType = null,Object? priceMultiplier = null,Object? isAvailable = null,Object? isBlocked = null,Object? isSelected = null,}) {
  return _then(_self.copyWith(
seatId: null == seatId ? _self.seatId : seatId // ignore: cast_nullable_to_non_nullable
as String,seatType: null == seatType ? _self.seatType : seatType // ignore: cast_nullable_to_non_nullable
as SeatType,priceMultiplier: null == priceMultiplier ? _self.priceMultiplier : priceMultiplier // ignore: cast_nullable_to_non_nullable
as double,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,isBlocked: null == isBlocked ? _self.isBlocked : isBlocked // ignore: cast_nullable_to_non_nullable
as bool,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Seat].
extension SeatPatterns on Seat {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Seat value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Seat() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Seat value)  $default,){
final _that = this;
switch (_that) {
case _Seat():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Seat value)?  $default,){
final _that = this;
switch (_that) {
case _Seat() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String seatId,  SeatType seatType,  double priceMultiplier,  bool isAvailable,  bool isBlocked,  bool isSelected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Seat() when $default != null:
return $default(_that.seatId,_that.seatType,_that.priceMultiplier,_that.isAvailable,_that.isBlocked,_that.isSelected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String seatId,  SeatType seatType,  double priceMultiplier,  bool isAvailable,  bool isBlocked,  bool isSelected)  $default,) {final _that = this;
switch (_that) {
case _Seat():
return $default(_that.seatId,_that.seatType,_that.priceMultiplier,_that.isAvailable,_that.isBlocked,_that.isSelected);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String seatId,  SeatType seatType,  double priceMultiplier,  bool isAvailable,  bool isBlocked,  bool isSelected)?  $default,) {final _that = this;
switch (_that) {
case _Seat() when $default != null:
return $default(_that.seatId,_that.seatType,_that.priceMultiplier,_that.isAvailable,_that.isBlocked,_that.isSelected);case _:
  return null;

}
}

}

/// @nodoc


class _Seat implements Seat {
  const _Seat({required this.seatId, required this.seatType, required this.priceMultiplier, required this.isAvailable, required this.isBlocked, this.isSelected = false});
  

@override final  String seatId;
@override final  SeatType seatType;
@override final  double priceMultiplier;
@override final  bool isAvailable;
@override final  bool isBlocked;
@override@JsonKey() final  bool isSelected;

/// Create a copy of Seat
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeatCopyWith<_Seat> get copyWith => __$SeatCopyWithImpl<_Seat>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Seat&&(identical(other.seatId, seatId) || other.seatId == seatId)&&(identical(other.seatType, seatType) || other.seatType == seatType)&&(identical(other.priceMultiplier, priceMultiplier) || other.priceMultiplier == priceMultiplier)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.isBlocked, isBlocked) || other.isBlocked == isBlocked)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected));
}


@override
int get hashCode => Object.hash(runtimeType,seatId,seatType,priceMultiplier,isAvailable,isBlocked,isSelected);

@override
String toString() {
  return 'Seat(seatId: $seatId, seatType: $seatType, priceMultiplier: $priceMultiplier, isAvailable: $isAvailable, isBlocked: $isBlocked, isSelected: $isSelected)';
}


}

/// @nodoc
abstract mixin class _$SeatCopyWith<$Res> implements $SeatCopyWith<$Res> {
  factory _$SeatCopyWith(_Seat value, $Res Function(_Seat) _then) = __$SeatCopyWithImpl;
@override @useResult
$Res call({
 String seatId, SeatType seatType, double priceMultiplier, bool isAvailable, bool isBlocked, bool isSelected
});




}
/// @nodoc
class __$SeatCopyWithImpl<$Res>
    implements _$SeatCopyWith<$Res> {
  __$SeatCopyWithImpl(this._self, this._then);

  final _Seat _self;
  final $Res Function(_Seat) _then;

/// Create a copy of Seat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? seatId = null,Object? seatType = null,Object? priceMultiplier = null,Object? isAvailable = null,Object? isBlocked = null,Object? isSelected = null,}) {
  return _then(_Seat(
seatId: null == seatId ? _self.seatId : seatId // ignore: cast_nullable_to_non_nullable
as String,seatType: null == seatType ? _self.seatType : seatType // ignore: cast_nullable_to_non_nullable
as SeatType,priceMultiplier: null == priceMultiplier ? _self.priceMultiplier : priceMultiplier // ignore: cast_nullable_to_non_nullable
as double,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,isBlocked: null == isBlocked ? _self.isBlocked : isBlocked // ignore: cast_nullable_to_non_nullable
as bool,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$SeatRow {

 String get row; List<Seat> get seats;
/// Create a copy of SeatRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeatRowCopyWith<SeatRow> get copyWith => _$SeatRowCopyWithImpl<SeatRow>(this as SeatRow, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeatRow&&(identical(other.row, row) || other.row == row)&&const DeepCollectionEquality().equals(other.seats, seats));
}


@override
int get hashCode => Object.hash(runtimeType,row,const DeepCollectionEquality().hash(seats));

@override
String toString() {
  return 'SeatRow(row: $row, seats: $seats)';
}


}

/// @nodoc
abstract mixin class $SeatRowCopyWith<$Res>  {
  factory $SeatRowCopyWith(SeatRow value, $Res Function(SeatRow) _then) = _$SeatRowCopyWithImpl;
@useResult
$Res call({
 String row, List<Seat> seats
});




}
/// @nodoc
class _$SeatRowCopyWithImpl<$Res>
    implements $SeatRowCopyWith<$Res> {
  _$SeatRowCopyWithImpl(this._self, this._then);

  final SeatRow _self;
  final $Res Function(SeatRow) _then;

/// Create a copy of SeatRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? row = null,Object? seats = null,}) {
  return _then(_self.copyWith(
row: null == row ? _self.row : row // ignore: cast_nullable_to_non_nullable
as String,seats: null == seats ? _self.seats : seats // ignore: cast_nullable_to_non_nullable
as List<Seat>,
  ));
}

}


/// Adds pattern-matching-related methods to [SeatRow].
extension SeatRowPatterns on SeatRow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeatRow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeatRow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeatRow value)  $default,){
final _that = this;
switch (_that) {
case _SeatRow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeatRow value)?  $default,){
final _that = this;
switch (_that) {
case _SeatRow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String row,  List<Seat> seats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeatRow() when $default != null:
return $default(_that.row,_that.seats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String row,  List<Seat> seats)  $default,) {final _that = this;
switch (_that) {
case _SeatRow():
return $default(_that.row,_that.seats);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String row,  List<Seat> seats)?  $default,) {final _that = this;
switch (_that) {
case _SeatRow() when $default != null:
return $default(_that.row,_that.seats);case _:
  return null;

}
}

}

/// @nodoc


class _SeatRow implements SeatRow {
  const _SeatRow({required this.row, required final  List<Seat> seats}): _seats = seats;
  

@override final  String row;
 final  List<Seat> _seats;
@override List<Seat> get seats {
  if (_seats is EqualUnmodifiableListView) return _seats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_seats);
}


/// Create a copy of SeatRow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeatRowCopyWith<_SeatRow> get copyWith => __$SeatRowCopyWithImpl<_SeatRow>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeatRow&&(identical(other.row, row) || other.row == row)&&const DeepCollectionEquality().equals(other._seats, _seats));
}


@override
int get hashCode => Object.hash(runtimeType,row,const DeepCollectionEquality().hash(_seats));

@override
String toString() {
  return 'SeatRow(row: $row, seats: $seats)';
}


}

/// @nodoc
abstract mixin class _$SeatRowCopyWith<$Res> implements $SeatRowCopyWith<$Res> {
  factory _$SeatRowCopyWith(_SeatRow value, $Res Function(_SeatRow) _then) = __$SeatRowCopyWithImpl;
@override @useResult
$Res call({
 String row, List<Seat> seats
});




}
/// @nodoc
class __$SeatRowCopyWithImpl<$Res>
    implements _$SeatRowCopyWith<$Res> {
  __$SeatRowCopyWithImpl(this._self, this._then);

  final _SeatRow _self;
  final $Res Function(_SeatRow) _then;

/// Create a copy of SeatRow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? row = null,Object? seats = null,}) {
  return _then(_SeatRow(
row: null == row ? _self.row : row // ignore: cast_nullable_to_non_nullable
as String,seats: null == seats ? _self._seats : seats // ignore: cast_nullable_to_non_nullable
as List<Seat>,
  ));
}


}

/// @nodoc
mixin _$SeatMap {

 String get id; String? get movieTitle; String? get theaterName; String get datetime; int get screenNumber; double get ticketPrice; int get totalSeats; int get availableSeats; bool get hasSeatSelection; List<SeatRow> get seatMap;
/// Create a copy of SeatMap
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeatMapCopyWith<SeatMap> get copyWith => _$SeatMapCopyWithImpl<SeatMap>(this as SeatMap, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeatMap&&(identical(other.id, id) || other.id == id)&&(identical(other.movieTitle, movieTitle) || other.movieTitle == movieTitle)&&(identical(other.theaterName, theaterName) || other.theaterName == theaterName)&&(identical(other.datetime, datetime) || other.datetime == datetime)&&(identical(other.screenNumber, screenNumber) || other.screenNumber == screenNumber)&&(identical(other.ticketPrice, ticketPrice) || other.ticketPrice == ticketPrice)&&(identical(other.totalSeats, totalSeats) || other.totalSeats == totalSeats)&&(identical(other.availableSeats, availableSeats) || other.availableSeats == availableSeats)&&(identical(other.hasSeatSelection, hasSeatSelection) || other.hasSeatSelection == hasSeatSelection)&&const DeepCollectionEquality().equals(other.seatMap, seatMap));
}


@override
int get hashCode => Object.hash(runtimeType,id,movieTitle,theaterName,datetime,screenNumber,ticketPrice,totalSeats,availableSeats,hasSeatSelection,const DeepCollectionEquality().hash(seatMap));

@override
String toString() {
  return 'SeatMap(id: $id, movieTitle: $movieTitle, theaterName: $theaterName, datetime: $datetime, screenNumber: $screenNumber, ticketPrice: $ticketPrice, totalSeats: $totalSeats, availableSeats: $availableSeats, hasSeatSelection: $hasSeatSelection, seatMap: $seatMap)';
}


}

/// @nodoc
abstract mixin class $SeatMapCopyWith<$Res>  {
  factory $SeatMapCopyWith(SeatMap value, $Res Function(SeatMap) _then) = _$SeatMapCopyWithImpl;
@useResult
$Res call({
 String id, String? movieTitle, String? theaterName, String datetime, int screenNumber, double ticketPrice, int totalSeats, int availableSeats, bool hasSeatSelection, List<SeatRow> seatMap
});




}
/// @nodoc
class _$SeatMapCopyWithImpl<$Res>
    implements $SeatMapCopyWith<$Res> {
  _$SeatMapCopyWithImpl(this._self, this._then);

  final SeatMap _self;
  final $Res Function(SeatMap) _then;

/// Create a copy of SeatMap
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? movieTitle = freezed,Object? theaterName = freezed,Object? datetime = null,Object? screenNumber = null,Object? ticketPrice = null,Object? totalSeats = null,Object? availableSeats = null,Object? hasSeatSelection = null,Object? seatMap = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,movieTitle: freezed == movieTitle ? _self.movieTitle : movieTitle // ignore: cast_nullable_to_non_nullable
as String?,theaterName: freezed == theaterName ? _self.theaterName : theaterName // ignore: cast_nullable_to_non_nullable
as String?,datetime: null == datetime ? _self.datetime : datetime // ignore: cast_nullable_to_non_nullable
as String,screenNumber: null == screenNumber ? _self.screenNumber : screenNumber // ignore: cast_nullable_to_non_nullable
as int,ticketPrice: null == ticketPrice ? _self.ticketPrice : ticketPrice // ignore: cast_nullable_to_non_nullable
as double,totalSeats: null == totalSeats ? _self.totalSeats : totalSeats // ignore: cast_nullable_to_non_nullable
as int,availableSeats: null == availableSeats ? _self.availableSeats : availableSeats // ignore: cast_nullable_to_non_nullable
as int,hasSeatSelection: null == hasSeatSelection ? _self.hasSeatSelection : hasSeatSelection // ignore: cast_nullable_to_non_nullable
as bool,seatMap: null == seatMap ? _self.seatMap : seatMap // ignore: cast_nullable_to_non_nullable
as List<SeatRow>,
  ));
}

}


/// Adds pattern-matching-related methods to [SeatMap].
extension SeatMapPatterns on SeatMap {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeatMap value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeatMap() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeatMap value)  $default,){
final _that = this;
switch (_that) {
case _SeatMap():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeatMap value)?  $default,){
final _that = this;
switch (_that) {
case _SeatMap() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? movieTitle,  String? theaterName,  String datetime,  int screenNumber,  double ticketPrice,  int totalSeats,  int availableSeats,  bool hasSeatSelection,  List<SeatRow> seatMap)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeatMap() when $default != null:
return $default(_that.id,_that.movieTitle,_that.theaterName,_that.datetime,_that.screenNumber,_that.ticketPrice,_that.totalSeats,_that.availableSeats,_that.hasSeatSelection,_that.seatMap);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? movieTitle,  String? theaterName,  String datetime,  int screenNumber,  double ticketPrice,  int totalSeats,  int availableSeats,  bool hasSeatSelection,  List<SeatRow> seatMap)  $default,) {final _that = this;
switch (_that) {
case _SeatMap():
return $default(_that.id,_that.movieTitle,_that.theaterName,_that.datetime,_that.screenNumber,_that.ticketPrice,_that.totalSeats,_that.availableSeats,_that.hasSeatSelection,_that.seatMap);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? movieTitle,  String? theaterName,  String datetime,  int screenNumber,  double ticketPrice,  int totalSeats,  int availableSeats,  bool hasSeatSelection,  List<SeatRow> seatMap)?  $default,) {final _that = this;
switch (_that) {
case _SeatMap() when $default != null:
return $default(_that.id,_that.movieTitle,_that.theaterName,_that.datetime,_that.screenNumber,_that.ticketPrice,_that.totalSeats,_that.availableSeats,_that.hasSeatSelection,_that.seatMap);case _:
  return null;

}
}

}

/// @nodoc


class _SeatMap implements SeatMap {
  const _SeatMap({required this.id, this.movieTitle, this.theaterName, required this.datetime, required this.screenNumber, required this.ticketPrice, required this.totalSeats, required this.availableSeats, required this.hasSeatSelection, required final  List<SeatRow> seatMap}): _seatMap = seatMap;
  

@override final  String id;
@override final  String? movieTitle;
@override final  String? theaterName;
@override final  String datetime;
@override final  int screenNumber;
@override final  double ticketPrice;
@override final  int totalSeats;
@override final  int availableSeats;
@override final  bool hasSeatSelection;
 final  List<SeatRow> _seatMap;
@override List<SeatRow> get seatMap {
  if (_seatMap is EqualUnmodifiableListView) return _seatMap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_seatMap);
}


/// Create a copy of SeatMap
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeatMapCopyWith<_SeatMap> get copyWith => __$SeatMapCopyWithImpl<_SeatMap>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeatMap&&(identical(other.id, id) || other.id == id)&&(identical(other.movieTitle, movieTitle) || other.movieTitle == movieTitle)&&(identical(other.theaterName, theaterName) || other.theaterName == theaterName)&&(identical(other.datetime, datetime) || other.datetime == datetime)&&(identical(other.screenNumber, screenNumber) || other.screenNumber == screenNumber)&&(identical(other.ticketPrice, ticketPrice) || other.ticketPrice == ticketPrice)&&(identical(other.totalSeats, totalSeats) || other.totalSeats == totalSeats)&&(identical(other.availableSeats, availableSeats) || other.availableSeats == availableSeats)&&(identical(other.hasSeatSelection, hasSeatSelection) || other.hasSeatSelection == hasSeatSelection)&&const DeepCollectionEquality().equals(other._seatMap, _seatMap));
}


@override
int get hashCode => Object.hash(runtimeType,id,movieTitle,theaterName,datetime,screenNumber,ticketPrice,totalSeats,availableSeats,hasSeatSelection,const DeepCollectionEquality().hash(_seatMap));

@override
String toString() {
  return 'SeatMap(id: $id, movieTitle: $movieTitle, theaterName: $theaterName, datetime: $datetime, screenNumber: $screenNumber, ticketPrice: $ticketPrice, totalSeats: $totalSeats, availableSeats: $availableSeats, hasSeatSelection: $hasSeatSelection, seatMap: $seatMap)';
}


}

/// @nodoc
abstract mixin class _$SeatMapCopyWith<$Res> implements $SeatMapCopyWith<$Res> {
  factory _$SeatMapCopyWith(_SeatMap value, $Res Function(_SeatMap) _then) = __$SeatMapCopyWithImpl;
@override @useResult
$Res call({
 String id, String? movieTitle, String? theaterName, String datetime, int screenNumber, double ticketPrice, int totalSeats, int availableSeats, bool hasSeatSelection, List<SeatRow> seatMap
});




}
/// @nodoc
class __$SeatMapCopyWithImpl<$Res>
    implements _$SeatMapCopyWith<$Res> {
  __$SeatMapCopyWithImpl(this._self, this._then);

  final _SeatMap _self;
  final $Res Function(_SeatMap) _then;

/// Create a copy of SeatMap
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? movieTitle = freezed,Object? theaterName = freezed,Object? datetime = null,Object? screenNumber = null,Object? ticketPrice = null,Object? totalSeats = null,Object? availableSeats = null,Object? hasSeatSelection = null,Object? seatMap = null,}) {
  return _then(_SeatMap(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,movieTitle: freezed == movieTitle ? _self.movieTitle : movieTitle // ignore: cast_nullable_to_non_nullable
as String?,theaterName: freezed == theaterName ? _self.theaterName : theaterName // ignore: cast_nullable_to_non_nullable
as String?,datetime: null == datetime ? _self.datetime : datetime // ignore: cast_nullable_to_non_nullable
as String,screenNumber: null == screenNumber ? _self.screenNumber : screenNumber // ignore: cast_nullable_to_non_nullable
as int,ticketPrice: null == ticketPrice ? _self.ticketPrice : ticketPrice // ignore: cast_nullable_to_non_nullable
as double,totalSeats: null == totalSeats ? _self.totalSeats : totalSeats // ignore: cast_nullable_to_non_nullable
as int,availableSeats: null == availableSeats ? _self.availableSeats : availableSeats // ignore: cast_nullable_to_non_nullable
as int,hasSeatSelection: null == hasSeatSelection ? _self.hasSeatSelection : hasSeatSelection // ignore: cast_nullable_to_non_nullable
as bool,seatMap: null == seatMap ? _self._seatMap : seatMap // ignore: cast_nullable_to_non_nullable
as List<SeatRow>,
  ));
}


}

/// @nodoc
mixin _$SeatReservation {

 String get id; String get seatIdentifier; String get seatType; String get status; DateTime? get expiresAt; double get price;
/// Create a copy of SeatReservation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeatReservationCopyWith<SeatReservation> get copyWith => _$SeatReservationCopyWithImpl<SeatReservation>(this as SeatReservation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeatReservation&&(identical(other.id, id) || other.id == id)&&(identical(other.seatIdentifier, seatIdentifier) || other.seatIdentifier == seatIdentifier)&&(identical(other.seatType, seatType) || other.seatType == seatType)&&(identical(other.status, status) || other.status == status)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.price, price) || other.price == price));
}


@override
int get hashCode => Object.hash(runtimeType,id,seatIdentifier,seatType,status,expiresAt,price);

@override
String toString() {
  return 'SeatReservation(id: $id, seatIdentifier: $seatIdentifier, seatType: $seatType, status: $status, expiresAt: $expiresAt, price: $price)';
}


}

/// @nodoc
abstract mixin class $SeatReservationCopyWith<$Res>  {
  factory $SeatReservationCopyWith(SeatReservation value, $Res Function(SeatReservation) _then) = _$SeatReservationCopyWithImpl;
@useResult
$Res call({
 String id, String seatIdentifier, String seatType, String status, DateTime? expiresAt, double price
});




}
/// @nodoc
class _$SeatReservationCopyWithImpl<$Res>
    implements $SeatReservationCopyWith<$Res> {
  _$SeatReservationCopyWithImpl(this._self, this._then);

  final SeatReservation _self;
  final $Res Function(SeatReservation) _then;

/// Create a copy of SeatReservation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? seatIdentifier = null,Object? seatType = null,Object? status = null,Object? expiresAt = freezed,Object? price = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,seatIdentifier: null == seatIdentifier ? _self.seatIdentifier : seatIdentifier // ignore: cast_nullable_to_non_nullable
as String,seatType: null == seatType ? _self.seatType : seatType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SeatReservation].
extension SeatReservationPatterns on SeatReservation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeatReservation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeatReservation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeatReservation value)  $default,){
final _that = this;
switch (_that) {
case _SeatReservation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeatReservation value)?  $default,){
final _that = this;
switch (_that) {
case _SeatReservation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String seatIdentifier,  String seatType,  String status,  DateTime? expiresAt,  double price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeatReservation() when $default != null:
return $default(_that.id,_that.seatIdentifier,_that.seatType,_that.status,_that.expiresAt,_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String seatIdentifier,  String seatType,  String status,  DateTime? expiresAt,  double price)  $default,) {final _that = this;
switch (_that) {
case _SeatReservation():
return $default(_that.id,_that.seatIdentifier,_that.seatType,_that.status,_that.expiresAt,_that.price);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String seatIdentifier,  String seatType,  String status,  DateTime? expiresAt,  double price)?  $default,) {final _that = this;
switch (_that) {
case _SeatReservation() when $default != null:
return $default(_that.id,_that.seatIdentifier,_that.seatType,_that.status,_that.expiresAt,_that.price);case _:
  return null;

}
}

}

/// @nodoc


class _SeatReservation implements SeatReservation {
  const _SeatReservation({required this.id, required this.seatIdentifier, required this.seatType, required this.status, this.expiresAt, required this.price});
  

@override final  String id;
@override final  String seatIdentifier;
@override final  String seatType;
@override final  String status;
@override final  DateTime? expiresAt;
@override final  double price;

/// Create a copy of SeatReservation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeatReservationCopyWith<_SeatReservation> get copyWith => __$SeatReservationCopyWithImpl<_SeatReservation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeatReservation&&(identical(other.id, id) || other.id == id)&&(identical(other.seatIdentifier, seatIdentifier) || other.seatIdentifier == seatIdentifier)&&(identical(other.seatType, seatType) || other.seatType == seatType)&&(identical(other.status, status) || other.status == status)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.price, price) || other.price == price));
}


@override
int get hashCode => Object.hash(runtimeType,id,seatIdentifier,seatType,status,expiresAt,price);

@override
String toString() {
  return 'SeatReservation(id: $id, seatIdentifier: $seatIdentifier, seatType: $seatType, status: $status, expiresAt: $expiresAt, price: $price)';
}


}

/// @nodoc
abstract mixin class _$SeatReservationCopyWith<$Res> implements $SeatReservationCopyWith<$Res> {
  factory _$SeatReservationCopyWith(_SeatReservation value, $Res Function(_SeatReservation) _then) = __$SeatReservationCopyWithImpl;
@override @useResult
$Res call({
 String id, String seatIdentifier, String seatType, String status, DateTime? expiresAt, double price
});




}
/// @nodoc
class __$SeatReservationCopyWithImpl<$Res>
    implements _$SeatReservationCopyWith<$Res> {
  __$SeatReservationCopyWithImpl(this._self, this._then);

  final _SeatReservation _self;
  final $Res Function(_SeatReservation) _then;

/// Create a copy of SeatReservation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? seatIdentifier = null,Object? seatType = null,Object? status = null,Object? expiresAt = freezed,Object? price = null,}) {
  return _then(_SeatReservation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,seatIdentifier: null == seatIdentifier ? _self.seatIdentifier : seatIdentifier // ignore: cast_nullable_to_non_nullable
as String,seatType: null == seatType ? _self.seatType : seatType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$ReservationResult {

 String get message; List<SeatReservation> get reservations; double get totalAmount; DateTime? get expiresAt;
/// Create a copy of ReservationResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReservationResultCopyWith<ReservationResult> get copyWith => _$ReservationResultCopyWithImpl<ReservationResult>(this as ReservationResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReservationResult&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.reservations, reservations)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(reservations),totalAmount,expiresAt);

@override
String toString() {
  return 'ReservationResult(message: $message, reservations: $reservations, totalAmount: $totalAmount, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $ReservationResultCopyWith<$Res>  {
  factory $ReservationResultCopyWith(ReservationResult value, $Res Function(ReservationResult) _then) = _$ReservationResultCopyWithImpl;
@useResult
$Res call({
 String message, List<SeatReservation> reservations, double totalAmount, DateTime? expiresAt
});




}
/// @nodoc
class _$ReservationResultCopyWithImpl<$Res>
    implements $ReservationResultCopyWith<$Res> {
  _$ReservationResultCopyWithImpl(this._self, this._then);

  final ReservationResult _self;
  final $Res Function(ReservationResult) _then;

/// Create a copy of ReservationResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? reservations = null,Object? totalAmount = null,Object? expiresAt = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,reservations: null == reservations ? _self.reservations : reservations // ignore: cast_nullable_to_non_nullable
as List<SeatReservation>,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReservationResult].
extension ReservationResultPatterns on ReservationResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReservationResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReservationResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReservationResult value)  $default,){
final _that = this;
switch (_that) {
case _ReservationResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReservationResult value)?  $default,){
final _that = this;
switch (_that) {
case _ReservationResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message,  List<SeatReservation> reservations,  double totalAmount,  DateTime? expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReservationResult() when $default != null:
return $default(_that.message,_that.reservations,_that.totalAmount,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message,  List<SeatReservation> reservations,  double totalAmount,  DateTime? expiresAt)  $default,) {final _that = this;
switch (_that) {
case _ReservationResult():
return $default(_that.message,_that.reservations,_that.totalAmount,_that.expiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message,  List<SeatReservation> reservations,  double totalAmount,  DateTime? expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _ReservationResult() when $default != null:
return $default(_that.message,_that.reservations,_that.totalAmount,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc


class _ReservationResult implements ReservationResult {
  const _ReservationResult({required this.message, required final  List<SeatReservation> reservations, required this.totalAmount, this.expiresAt}): _reservations = reservations;
  

@override final  String message;
 final  List<SeatReservation> _reservations;
@override List<SeatReservation> get reservations {
  if (_reservations is EqualUnmodifiableListView) return _reservations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reservations);
}

@override final  double totalAmount;
@override final  DateTime? expiresAt;

/// Create a copy of ReservationResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReservationResultCopyWith<_ReservationResult> get copyWith => __$ReservationResultCopyWithImpl<_ReservationResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReservationResult&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._reservations, _reservations)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_reservations),totalAmount,expiresAt);

@override
String toString() {
  return 'ReservationResult(message: $message, reservations: $reservations, totalAmount: $totalAmount, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$ReservationResultCopyWith<$Res> implements $ReservationResultCopyWith<$Res> {
  factory _$ReservationResultCopyWith(_ReservationResult value, $Res Function(_ReservationResult) _then) = __$ReservationResultCopyWithImpl;
@override @useResult
$Res call({
 String message, List<SeatReservation> reservations, double totalAmount, DateTime? expiresAt
});




}
/// @nodoc
class __$ReservationResultCopyWithImpl<$Res>
    implements _$ReservationResultCopyWith<$Res> {
  __$ReservationResultCopyWithImpl(this._self, this._then);

  final _ReservationResult _self;
  final $Res Function(_ReservationResult) _then;

/// Create a copy of ReservationResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? reservations = null,Object? totalAmount = null,Object? expiresAt = freezed,}) {
  return _then(_ReservationResult(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,reservations: null == reservations ? _self._reservations : reservations // ignore: cast_nullable_to_non_nullable
as List<SeatReservation>,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$Booking {

 String get id; String get showtimeId; String get customerId; List<String> get seatNumbers; double get totalAmount; double? get discountAmount; int? get loyaltyPointsUsed; BookingStatus get status; String get bookingReference; DateTime get createdAt; DateTime? get updatedAt;
/// Create a copy of Booking
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingCopyWith<Booking> get copyWith => _$BookingCopyWithImpl<Booking>(this as Booking, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Booking&&(identical(other.id, id) || other.id == id)&&(identical(other.showtimeId, showtimeId) || other.showtimeId == showtimeId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&const DeepCollectionEquality().equals(other.seatNumbers, seatNumbers)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.loyaltyPointsUsed, loyaltyPointsUsed) || other.loyaltyPointsUsed == loyaltyPointsUsed)&&(identical(other.status, status) || other.status == status)&&(identical(other.bookingReference, bookingReference) || other.bookingReference == bookingReference)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,showtimeId,customerId,const DeepCollectionEquality().hash(seatNumbers),totalAmount,discountAmount,loyaltyPointsUsed,status,bookingReference,createdAt,updatedAt);

@override
String toString() {
  return 'Booking(id: $id, showtimeId: $showtimeId, customerId: $customerId, seatNumbers: $seatNumbers, totalAmount: $totalAmount, discountAmount: $discountAmount, loyaltyPointsUsed: $loyaltyPointsUsed, status: $status, bookingReference: $bookingReference, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $BookingCopyWith<$Res>  {
  factory $BookingCopyWith(Booking value, $Res Function(Booking) _then) = _$BookingCopyWithImpl;
@useResult
$Res call({
 String id, String showtimeId, String customerId, List<String> seatNumbers, double totalAmount, double? discountAmount, int? loyaltyPointsUsed, BookingStatus status, String bookingReference, DateTime createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$BookingCopyWithImpl<$Res>
    implements $BookingCopyWith<$Res> {
  _$BookingCopyWithImpl(this._self, this._then);

  final Booking _self;
  final $Res Function(Booking) _then;

/// Create a copy of Booking
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? showtimeId = null,Object? customerId = null,Object? seatNumbers = null,Object? totalAmount = null,Object? discountAmount = freezed,Object? loyaltyPointsUsed = freezed,Object? status = null,Object? bookingReference = null,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,showtimeId: null == showtimeId ? _self.showtimeId : showtimeId // ignore: cast_nullable_to_non_nullable
as String,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,seatNumbers: null == seatNumbers ? _self.seatNumbers : seatNumbers // ignore: cast_nullable_to_non_nullable
as List<String>,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double?,loyaltyPointsUsed: freezed == loyaltyPointsUsed ? _self.loyaltyPointsUsed : loyaltyPointsUsed // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BookingStatus,bookingReference: null == bookingReference ? _self.bookingReference : bookingReference // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Booking].
extension BookingPatterns on Booking {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Booking value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Booking() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Booking value)  $default,){
final _that = this;
switch (_that) {
case _Booking():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Booking value)?  $default,){
final _that = this;
switch (_that) {
case _Booking() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String showtimeId,  String customerId,  List<String> seatNumbers,  double totalAmount,  double? discountAmount,  int? loyaltyPointsUsed,  BookingStatus status,  String bookingReference,  DateTime createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Booking() when $default != null:
return $default(_that.id,_that.showtimeId,_that.customerId,_that.seatNumbers,_that.totalAmount,_that.discountAmount,_that.loyaltyPointsUsed,_that.status,_that.bookingReference,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String showtimeId,  String customerId,  List<String> seatNumbers,  double totalAmount,  double? discountAmount,  int? loyaltyPointsUsed,  BookingStatus status,  String bookingReference,  DateTime createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Booking():
return $default(_that.id,_that.showtimeId,_that.customerId,_that.seatNumbers,_that.totalAmount,_that.discountAmount,_that.loyaltyPointsUsed,_that.status,_that.bookingReference,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String showtimeId,  String customerId,  List<String> seatNumbers,  double totalAmount,  double? discountAmount,  int? loyaltyPointsUsed,  BookingStatus status,  String bookingReference,  DateTime createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Booking() when $default != null:
return $default(_that.id,_that.showtimeId,_that.customerId,_that.seatNumbers,_that.totalAmount,_that.discountAmount,_that.loyaltyPointsUsed,_that.status,_that.bookingReference,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _Booking implements Booking {
  const _Booking({required this.id, required this.showtimeId, required this.customerId, required final  List<String> seatNumbers, required this.totalAmount, this.discountAmount, this.loyaltyPointsUsed, required this.status, required this.bookingReference, required this.createdAt, this.updatedAt}): _seatNumbers = seatNumbers;
  

@override final  String id;
@override final  String showtimeId;
@override final  String customerId;
 final  List<String> _seatNumbers;
@override List<String> get seatNumbers {
  if (_seatNumbers is EqualUnmodifiableListView) return _seatNumbers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_seatNumbers);
}

@override final  double totalAmount;
@override final  double? discountAmount;
@override final  int? loyaltyPointsUsed;
@override final  BookingStatus status;
@override final  String bookingReference;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of Booking
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingCopyWith<_Booking> get copyWith => __$BookingCopyWithImpl<_Booking>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Booking&&(identical(other.id, id) || other.id == id)&&(identical(other.showtimeId, showtimeId) || other.showtimeId == showtimeId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&const DeepCollectionEquality().equals(other._seatNumbers, _seatNumbers)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.loyaltyPointsUsed, loyaltyPointsUsed) || other.loyaltyPointsUsed == loyaltyPointsUsed)&&(identical(other.status, status) || other.status == status)&&(identical(other.bookingReference, bookingReference) || other.bookingReference == bookingReference)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,showtimeId,customerId,const DeepCollectionEquality().hash(_seatNumbers),totalAmount,discountAmount,loyaltyPointsUsed,status,bookingReference,createdAt,updatedAt);

@override
String toString() {
  return 'Booking(id: $id, showtimeId: $showtimeId, customerId: $customerId, seatNumbers: $seatNumbers, totalAmount: $totalAmount, discountAmount: $discountAmount, loyaltyPointsUsed: $loyaltyPointsUsed, status: $status, bookingReference: $bookingReference, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$BookingCopyWith<$Res> implements $BookingCopyWith<$Res> {
  factory _$BookingCopyWith(_Booking value, $Res Function(_Booking) _then) = __$BookingCopyWithImpl;
@override @useResult
$Res call({
 String id, String showtimeId, String customerId, List<String> seatNumbers, double totalAmount, double? discountAmount, int? loyaltyPointsUsed, BookingStatus status, String bookingReference, DateTime createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$BookingCopyWithImpl<$Res>
    implements _$BookingCopyWith<$Res> {
  __$BookingCopyWithImpl(this._self, this._then);

  final _Booking _self;
  final $Res Function(_Booking) _then;

/// Create a copy of Booking
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? showtimeId = null,Object? customerId = null,Object? seatNumbers = null,Object? totalAmount = null,Object? discountAmount = freezed,Object? loyaltyPointsUsed = freezed,Object? status = null,Object? bookingReference = null,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_Booking(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,showtimeId: null == showtimeId ? _self.showtimeId : showtimeId // ignore: cast_nullable_to_non_nullable
as String,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,seatNumbers: null == seatNumbers ? _self._seatNumbers : seatNumbers // ignore: cast_nullable_to_non_nullable
as List<String>,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double?,loyaltyPointsUsed: freezed == loyaltyPointsUsed ? _self.loyaltyPointsUsed : loyaltyPointsUsed // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BookingStatus,bookingReference: null == bookingReference ? _self.bookingReference : bookingReference // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
