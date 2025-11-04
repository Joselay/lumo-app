// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaymentState {

 PaymentStatus get status; String? get stripePublishableKey; PaymentResponse? get payment; String? get bookingId; String? get bookingReference; double? get amount; String? get errorMessage; DateTime? get errorTimestamp;
/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentStateCopyWith<PaymentState> get copyWith => _$PaymentStateCopyWithImpl<PaymentState>(this as PaymentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentState&&(identical(other.status, status) || other.status == status)&&(identical(other.stripePublishableKey, stripePublishableKey) || other.stripePublishableKey == stripePublishableKey)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.bookingReference, bookingReference) || other.bookingReference == bookingReference)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.errorTimestamp, errorTimestamp) || other.errorTimestamp == errorTimestamp));
}


@override
int get hashCode => Object.hash(runtimeType,status,stripePublishableKey,payment,bookingId,bookingReference,amount,errorMessage,errorTimestamp);

@override
String toString() {
  return 'PaymentState(status: $status, stripePublishableKey: $stripePublishableKey, payment: $payment, bookingId: $bookingId, bookingReference: $bookingReference, amount: $amount, errorMessage: $errorMessage, errorTimestamp: $errorTimestamp)';
}


}

/// @nodoc
abstract mixin class $PaymentStateCopyWith<$Res>  {
  factory $PaymentStateCopyWith(PaymentState value, $Res Function(PaymentState) _then) = _$PaymentStateCopyWithImpl;
@useResult
$Res call({
 PaymentStatus status, String? stripePublishableKey, PaymentResponse? payment, String? bookingId, String? bookingReference, double? amount, String? errorMessage, DateTime? errorTimestamp
});




}
/// @nodoc
class _$PaymentStateCopyWithImpl<$Res>
    implements $PaymentStateCopyWith<$Res> {
  _$PaymentStateCopyWithImpl(this._self, this._then);

  final PaymentState _self;
  final $Res Function(PaymentState) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? stripePublishableKey = freezed,Object? payment = freezed,Object? bookingId = freezed,Object? bookingReference = freezed,Object? amount = freezed,Object? errorMessage = freezed,Object? errorTimestamp = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PaymentStatus,stripePublishableKey: freezed == stripePublishableKey ? _self.stripePublishableKey : stripePublishableKey // ignore: cast_nullable_to_non_nullable
as String?,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PaymentResponse?,bookingId: freezed == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as String?,bookingReference: freezed == bookingReference ? _self.bookingReference : bookingReference // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,errorTimestamp: freezed == errorTimestamp ? _self.errorTimestamp : errorTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentState].
extension PaymentStatePatterns on PaymentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentState value)  $default,){
final _that = this;
switch (_that) {
case _PaymentState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentState value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PaymentStatus status,  String? stripePublishableKey,  PaymentResponse? payment,  String? bookingId,  String? bookingReference,  double? amount,  String? errorMessage,  DateTime? errorTimestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentState() when $default != null:
return $default(_that.status,_that.stripePublishableKey,_that.payment,_that.bookingId,_that.bookingReference,_that.amount,_that.errorMessage,_that.errorTimestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PaymentStatus status,  String? stripePublishableKey,  PaymentResponse? payment,  String? bookingId,  String? bookingReference,  double? amount,  String? errorMessage,  DateTime? errorTimestamp)  $default,) {final _that = this;
switch (_that) {
case _PaymentState():
return $default(_that.status,_that.stripePublishableKey,_that.payment,_that.bookingId,_that.bookingReference,_that.amount,_that.errorMessage,_that.errorTimestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PaymentStatus status,  String? stripePublishableKey,  PaymentResponse? payment,  String? bookingId,  String? bookingReference,  double? amount,  String? errorMessage,  DateTime? errorTimestamp)?  $default,) {final _that = this;
switch (_that) {
case _PaymentState() when $default != null:
return $default(_that.status,_that.stripePublishableKey,_that.payment,_that.bookingId,_that.bookingReference,_that.amount,_that.errorMessage,_that.errorTimestamp);case _:
  return null;

}
}

}

/// @nodoc


class _PaymentState extends PaymentState {
  const _PaymentState({this.status = PaymentStatus.initial, this.stripePublishableKey, this.payment, this.bookingId, this.bookingReference, this.amount, this.errorMessage, this.errorTimestamp}): super._();
  

@override@JsonKey() final  PaymentStatus status;
@override final  String? stripePublishableKey;
@override final  PaymentResponse? payment;
@override final  String? bookingId;
@override final  String? bookingReference;
@override final  double? amount;
@override final  String? errorMessage;
@override final  DateTime? errorTimestamp;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentStateCopyWith<_PaymentState> get copyWith => __$PaymentStateCopyWithImpl<_PaymentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentState&&(identical(other.status, status) || other.status == status)&&(identical(other.stripePublishableKey, stripePublishableKey) || other.stripePublishableKey == stripePublishableKey)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.bookingReference, bookingReference) || other.bookingReference == bookingReference)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.errorTimestamp, errorTimestamp) || other.errorTimestamp == errorTimestamp));
}


@override
int get hashCode => Object.hash(runtimeType,status,stripePublishableKey,payment,bookingId,bookingReference,amount,errorMessage,errorTimestamp);

@override
String toString() {
  return 'PaymentState(status: $status, stripePublishableKey: $stripePublishableKey, payment: $payment, bookingId: $bookingId, bookingReference: $bookingReference, amount: $amount, errorMessage: $errorMessage, errorTimestamp: $errorTimestamp)';
}


}

/// @nodoc
abstract mixin class _$PaymentStateCopyWith<$Res> implements $PaymentStateCopyWith<$Res> {
  factory _$PaymentStateCopyWith(_PaymentState value, $Res Function(_PaymentState) _then) = __$PaymentStateCopyWithImpl;
@override @useResult
$Res call({
 PaymentStatus status, String? stripePublishableKey, PaymentResponse? payment, String? bookingId, String? bookingReference, double? amount, String? errorMessage, DateTime? errorTimestamp
});




}
/// @nodoc
class __$PaymentStateCopyWithImpl<$Res>
    implements _$PaymentStateCopyWith<$Res> {
  __$PaymentStateCopyWithImpl(this._self, this._then);

  final _PaymentState _self;
  final $Res Function(_PaymentState) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? stripePublishableKey = freezed,Object? payment = freezed,Object? bookingId = freezed,Object? bookingReference = freezed,Object? amount = freezed,Object? errorMessage = freezed,Object? errorTimestamp = freezed,}) {
  return _then(_PaymentState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PaymentStatus,stripePublishableKey: freezed == stripePublishableKey ? _self.stripePublishableKey : stripePublishableKey // ignore: cast_nullable_to_non_nullable
as String?,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as PaymentResponse?,bookingId: freezed == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as String?,bookingReference: freezed == bookingReference ? _self.bookingReference : bookingReference // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,errorTimestamp: freezed == errorTimestamp ? _self.errorTimestamp : errorTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
