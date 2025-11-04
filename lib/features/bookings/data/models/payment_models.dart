import 'package:json_annotation/json_annotation.dart';

part 'payment_models.g.dart';

/// Response from the Stripe config API
@JsonSerializable()
class StripeConfigResponse {
  @JsonKey(name: 'public_key')
  final String? publicKey;

  const StripeConfigResponse({
    this.publicKey,
  });

  factory StripeConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$StripeConfigResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StripeConfigResponseToJson(this);
}

/// Request to create a payment
@JsonSerializable()
class PaymentCreateRequest {
  // Backend expects 'booking' not 'booking_id'
  @JsonKey(name: 'booking')
  final String booking;
  @JsonKey(name: 'payment_method')
  final String paymentMethod;

  const PaymentCreateRequest({
    required this.booking,
    required this.paymentMethod,
  });

  factory PaymentCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentCreateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentCreateRequestToJson(this);
}

// Helper to parse decimal string from Django
String _parseDecimalString(dynamic value) {
  if (value == null) return '0.00';
  if (value is num) return value.toString();
  if (value is String) return value;
  return '0.00';
}

/// Response from creating a payment
@JsonSerializable()
class PaymentResponse {
  final String id;
  // Backend returns 'booking' as UUID string
  @JsonKey(name: 'booking')
  final String booking;
  @JsonKey(name: 'booking_reference')
  final String bookingReference;
  @JsonKey(fromJson: _parseDecimalString)
  final String amount;
  @JsonKey(name: 'payment_method')
  final String paymentMethod;
  final String status;
  @JsonKey(name: 'transaction_id')
  final String? transactionId;
  @JsonKey(name: 'stripe_payment_intent_id')
  final String? stripePaymentIntentId;
  @JsonKey(name: 'stripe_client_secret')
  final String? stripeClientSecret;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'processed_at')
  final String? processedAt;

  const PaymentResponse({
    required this.id,
    required this.booking,
    required this.bookingReference,
    required this.amount,
    required this.paymentMethod,
    required this.status,
    this.transactionId,
    this.stripePaymentIntentId,
    this.stripeClientSecret,
    required this.createdAt,
    this.processedAt,
  });

  factory PaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentResponseToJson(this);

  /// Get payment amount as double
  double get amountValue => double.tryParse(amount) ?? 0.0;

  /// Get booking ID (alias for 'booking' field)
  String get bookingId => booking;

  /// Check if payment is pending
  bool get isPending => status == 'pending';

  /// Check if payment is processing
  bool get isProcessing => status == 'processing';

  /// Check if payment is completed
  bool get isCompleted => status == 'completed';

  /// Check if payment failed
  bool get isFailed => status == 'failed';

  /// Check if payment is refunded
  bool get isRefunded => status == 'refunded';
}

/// Payment intent details for Stripe
@JsonSerializable()
class PaymentIntentData {
  @JsonKey(name: 'client_secret')
  final String clientSecret;
  @JsonKey(name: 'payment_intent_id')
  final String paymentIntentId;
  final String amount;
  final String currency;

  const PaymentIntentData({
    required this.clientSecret,
    required this.paymentIntentId,
    required this.amount,
    required this.currency,
  });

  factory PaymentIntentData.fromJson(Map<String, dynamic> json) =>
      _$PaymentIntentDataFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentIntentDataToJson(this);

  /// Get payment amount as double
  double get amountValue => double.tryParse(amount) ?? 0.0;
}
