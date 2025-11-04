import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_event.freezed.dart';

@freezed
abstract class PaymentEvent with _$PaymentEvent {
  /// Initialize payment by loading Stripe configuration
  const factory PaymentEvent.started({
    required String bookingId,
    required String bookingReference,
    required double amount,
  }) = PaymentStarted;

  /// Create payment intent
  const factory PaymentEvent.createPaymentIntent() = PaymentCreatePaymentIntent;

  /// Process payment with Stripe
  const factory PaymentEvent.processPayment() = PaymentProcessPayment;

  /// Payment completed successfully
  const factory PaymentEvent.paymentSucceeded() = PaymentPaymentSucceeded;

  /// Payment failed
  const factory PaymentEvent.paymentFailed(String error) = PaymentPaymentFailed;

  /// Payment cancelled by user
  const factory PaymentEvent.paymentCancelled() = PaymentPaymentCancelled;

  /// Reset payment state
  const factory PaymentEvent.reset() = PaymentReset;
}
