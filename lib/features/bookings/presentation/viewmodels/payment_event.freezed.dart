// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaymentEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaymentEvent()';
}


}

/// @nodoc
class $PaymentEventCopyWith<$Res>  {
$PaymentEventCopyWith(PaymentEvent _, $Res Function(PaymentEvent) __);
}


/// Adds pattern-matching-related methods to [PaymentEvent].
extension PaymentEventPatterns on PaymentEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PaymentStarted value)?  started,TResult Function( PaymentCreatePaymentIntent value)?  createPaymentIntent,TResult Function( PaymentProcessPayment value)?  processPayment,TResult Function( PaymentPaymentSucceeded value)?  paymentSucceeded,TResult Function( PaymentPaymentFailed value)?  paymentFailed,TResult Function( PaymentPaymentCancelled value)?  paymentCancelled,TResult Function( PaymentReset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PaymentStarted() when started != null:
return started(_that);case PaymentCreatePaymentIntent() when createPaymentIntent != null:
return createPaymentIntent(_that);case PaymentProcessPayment() when processPayment != null:
return processPayment(_that);case PaymentPaymentSucceeded() when paymentSucceeded != null:
return paymentSucceeded(_that);case PaymentPaymentFailed() when paymentFailed != null:
return paymentFailed(_that);case PaymentPaymentCancelled() when paymentCancelled != null:
return paymentCancelled(_that);case PaymentReset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PaymentStarted value)  started,required TResult Function( PaymentCreatePaymentIntent value)  createPaymentIntent,required TResult Function( PaymentProcessPayment value)  processPayment,required TResult Function( PaymentPaymentSucceeded value)  paymentSucceeded,required TResult Function( PaymentPaymentFailed value)  paymentFailed,required TResult Function( PaymentPaymentCancelled value)  paymentCancelled,required TResult Function( PaymentReset value)  reset,}){
final _that = this;
switch (_that) {
case PaymentStarted():
return started(_that);case PaymentCreatePaymentIntent():
return createPaymentIntent(_that);case PaymentProcessPayment():
return processPayment(_that);case PaymentPaymentSucceeded():
return paymentSucceeded(_that);case PaymentPaymentFailed():
return paymentFailed(_that);case PaymentPaymentCancelled():
return paymentCancelled(_that);case PaymentReset():
return reset(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PaymentStarted value)?  started,TResult? Function( PaymentCreatePaymentIntent value)?  createPaymentIntent,TResult? Function( PaymentProcessPayment value)?  processPayment,TResult? Function( PaymentPaymentSucceeded value)?  paymentSucceeded,TResult? Function( PaymentPaymentFailed value)?  paymentFailed,TResult? Function( PaymentPaymentCancelled value)?  paymentCancelled,TResult? Function( PaymentReset value)?  reset,}){
final _that = this;
switch (_that) {
case PaymentStarted() when started != null:
return started(_that);case PaymentCreatePaymentIntent() when createPaymentIntent != null:
return createPaymentIntent(_that);case PaymentProcessPayment() when processPayment != null:
return processPayment(_that);case PaymentPaymentSucceeded() when paymentSucceeded != null:
return paymentSucceeded(_that);case PaymentPaymentFailed() when paymentFailed != null:
return paymentFailed(_that);case PaymentPaymentCancelled() when paymentCancelled != null:
return paymentCancelled(_that);case PaymentReset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String bookingId,  String bookingReference,  double amount)?  started,TResult Function()?  createPaymentIntent,TResult Function()?  processPayment,TResult Function()?  paymentSucceeded,TResult Function( String error)?  paymentFailed,TResult Function()?  paymentCancelled,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PaymentStarted() when started != null:
return started(_that.bookingId,_that.bookingReference,_that.amount);case PaymentCreatePaymentIntent() when createPaymentIntent != null:
return createPaymentIntent();case PaymentProcessPayment() when processPayment != null:
return processPayment();case PaymentPaymentSucceeded() when paymentSucceeded != null:
return paymentSucceeded();case PaymentPaymentFailed() when paymentFailed != null:
return paymentFailed(_that.error);case PaymentPaymentCancelled() when paymentCancelled != null:
return paymentCancelled();case PaymentReset() when reset != null:
return reset();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String bookingId,  String bookingReference,  double amount)  started,required TResult Function()  createPaymentIntent,required TResult Function()  processPayment,required TResult Function()  paymentSucceeded,required TResult Function( String error)  paymentFailed,required TResult Function()  paymentCancelled,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case PaymentStarted():
return started(_that.bookingId,_that.bookingReference,_that.amount);case PaymentCreatePaymentIntent():
return createPaymentIntent();case PaymentProcessPayment():
return processPayment();case PaymentPaymentSucceeded():
return paymentSucceeded();case PaymentPaymentFailed():
return paymentFailed(_that.error);case PaymentPaymentCancelled():
return paymentCancelled();case PaymentReset():
return reset();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String bookingId,  String bookingReference,  double amount)?  started,TResult? Function()?  createPaymentIntent,TResult? Function()?  processPayment,TResult? Function()?  paymentSucceeded,TResult? Function( String error)?  paymentFailed,TResult? Function()?  paymentCancelled,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case PaymentStarted() when started != null:
return started(_that.bookingId,_that.bookingReference,_that.amount);case PaymentCreatePaymentIntent() when createPaymentIntent != null:
return createPaymentIntent();case PaymentProcessPayment() when processPayment != null:
return processPayment();case PaymentPaymentSucceeded() when paymentSucceeded != null:
return paymentSucceeded();case PaymentPaymentFailed() when paymentFailed != null:
return paymentFailed(_that.error);case PaymentPaymentCancelled() when paymentCancelled != null:
return paymentCancelled();case PaymentReset() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class PaymentStarted implements PaymentEvent {
  const PaymentStarted({required this.bookingId, required this.bookingReference, required this.amount});
  

 final  String bookingId;
 final  String bookingReference;
 final  double amount;

/// Create a copy of PaymentEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentStartedCopyWith<PaymentStarted> get copyWith => _$PaymentStartedCopyWithImpl<PaymentStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentStarted&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&(identical(other.bookingReference, bookingReference) || other.bookingReference == bookingReference)&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,bookingId,bookingReference,amount);

@override
String toString() {
  return 'PaymentEvent.started(bookingId: $bookingId, bookingReference: $bookingReference, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $PaymentStartedCopyWith<$Res> implements $PaymentEventCopyWith<$Res> {
  factory $PaymentStartedCopyWith(PaymentStarted value, $Res Function(PaymentStarted) _then) = _$PaymentStartedCopyWithImpl;
@useResult
$Res call({
 String bookingId, String bookingReference, double amount
});




}
/// @nodoc
class _$PaymentStartedCopyWithImpl<$Res>
    implements $PaymentStartedCopyWith<$Res> {
  _$PaymentStartedCopyWithImpl(this._self, this._then);

  final PaymentStarted _self;
  final $Res Function(PaymentStarted) _then;

/// Create a copy of PaymentEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bookingId = null,Object? bookingReference = null,Object? amount = null,}) {
  return _then(PaymentStarted(
bookingId: null == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as String,bookingReference: null == bookingReference ? _self.bookingReference : bookingReference // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class PaymentCreatePaymentIntent implements PaymentEvent {
  const PaymentCreatePaymentIntent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentCreatePaymentIntent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaymentEvent.createPaymentIntent()';
}


}




/// @nodoc


class PaymentProcessPayment implements PaymentEvent {
  const PaymentProcessPayment();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentProcessPayment);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaymentEvent.processPayment()';
}


}




/// @nodoc


class PaymentPaymentSucceeded implements PaymentEvent {
  const PaymentPaymentSucceeded();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentPaymentSucceeded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaymentEvent.paymentSucceeded()';
}


}




/// @nodoc


class PaymentPaymentFailed implements PaymentEvent {
  const PaymentPaymentFailed(this.error);
  

 final  String error;

/// Create a copy of PaymentEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentPaymentFailedCopyWith<PaymentPaymentFailed> get copyWith => _$PaymentPaymentFailedCopyWithImpl<PaymentPaymentFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentPaymentFailed&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'PaymentEvent.paymentFailed(error: $error)';
}


}

/// @nodoc
abstract mixin class $PaymentPaymentFailedCopyWith<$Res> implements $PaymentEventCopyWith<$Res> {
  factory $PaymentPaymentFailedCopyWith(PaymentPaymentFailed value, $Res Function(PaymentPaymentFailed) _then) = _$PaymentPaymentFailedCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$PaymentPaymentFailedCopyWithImpl<$Res>
    implements $PaymentPaymentFailedCopyWith<$Res> {
  _$PaymentPaymentFailedCopyWithImpl(this._self, this._then);

  final PaymentPaymentFailed _self;
  final $Res Function(PaymentPaymentFailed) _then;

/// Create a copy of PaymentEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(PaymentPaymentFailed(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PaymentPaymentCancelled implements PaymentEvent {
  const PaymentPaymentCancelled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentPaymentCancelled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaymentEvent.paymentCancelled()';
}


}




/// @nodoc


class PaymentReset implements PaymentEvent {
  const PaymentReset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentReset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaymentEvent.reset()';
}


}




// dart format on
