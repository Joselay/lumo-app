import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/payment_models.dart';

part 'payment_state.freezed.dart';

enum PaymentStatus {
  initial,
  loadingConfig,
  configLoaded,
  creatingPayment,
  paymentCreated,
  processing,
  succeeded,
  failed,
  cancelled,
}

@freezed
abstract class PaymentState with _$PaymentState {
  const factory PaymentState({
    @Default(PaymentStatus.initial) PaymentStatus status,
    String? stripePublishableKey,
    PaymentResponse? payment,
    String? bookingId,
    String? bookingReference,
    double? amount,
    String? errorMessage,
    DateTime? errorTimestamp,
  }) = _PaymentState;

  const PaymentState._();

  /// Check if payment can be initiated
  bool get canInitiatePayment =>
      status == PaymentStatus.configLoaded && bookingId != null;

  /// Check if payment is being processed
  bool get isProcessing =>
      status == PaymentStatus.processing ||
      status == PaymentStatus.creatingPayment;

  /// Check if payment succeeded
  bool get isSucceeded => status == PaymentStatus.succeeded;

  /// Check if payment failed
  bool get isFailed => status == PaymentStatus.failed;

  /// Check if payment was cancelled
  bool get isCancelled => status == PaymentStatus.cancelled;
}
