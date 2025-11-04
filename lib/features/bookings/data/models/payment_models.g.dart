// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StripeConfigResponse _$StripeConfigResponseFromJson(
  Map<String, dynamic> json,
) => StripeConfigResponse(publicKey: json['public_key'] as String?);

Map<String, dynamic> _$StripeConfigResponseToJson(
  StripeConfigResponse instance,
) => <String, dynamic>{'public_key': instance.publicKey};

PaymentCreateRequest _$PaymentCreateRequestFromJson(
  Map<String, dynamic> json,
) => PaymentCreateRequest(
  booking: json['booking'] as String,
  paymentMethod: json['payment_method'] as String,
);

Map<String, dynamic> _$PaymentCreateRequestToJson(
  PaymentCreateRequest instance,
) => <String, dynamic>{
  'booking': instance.booking,
  'payment_method': instance.paymentMethod,
};

PaymentResponse _$PaymentResponseFromJson(Map<String, dynamic> json) =>
    PaymentResponse(
      id: json['id'] as String,
      booking: json['booking'] as String,
      bookingReference: json['booking_reference'] as String,
      amount: _parseDecimalString(json['amount']),
      paymentMethod: json['payment_method'] as String,
      status: json['status'] as String,
      transactionId: json['transaction_id'] as String?,
      stripePaymentIntentId: json['stripe_payment_intent_id'] as String?,
      stripeClientSecret: json['stripe_client_secret'] as String?,
      createdAt: json['created_at'] as String,
      processedAt: json['processed_at'] as String?,
    );

Map<String, dynamic> _$PaymentResponseToJson(PaymentResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'booking': instance.booking,
      'booking_reference': instance.bookingReference,
      'amount': instance.amount,
      'payment_method': instance.paymentMethod,
      'status': instance.status,
      'transaction_id': instance.transactionId,
      'stripe_payment_intent_id': instance.stripePaymentIntentId,
      'stripe_client_secret': instance.stripeClientSecret,
      'created_at': instance.createdAt,
      'processed_at': instance.processedAt,
    };

PaymentIntentData _$PaymentIntentDataFromJson(Map<String, dynamic> json) =>
    PaymentIntentData(
      clientSecret: json['client_secret'] as String,
      paymentIntentId: json['payment_intent_id'] as String,
      amount: json['amount'] as String,
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$PaymentIntentDataToJson(PaymentIntentData instance) =>
    <String, dynamic>{
      'client_secret': instance.clientSecret,
      'payment_intent_id': instance.paymentIntentId,
      'amount': instance.amount,
      'currency': instance.currency,
    };
