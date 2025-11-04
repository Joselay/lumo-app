import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../../data/datasources/bookings_api.dart';
import '../../data/models/payment_models.dart';
import 'payment_event.dart';
import 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final BookingsApi bookingsApi;

  PaymentBloc({
    required this.bookingsApi,
  }) : super(const PaymentState()) {
    on<PaymentStarted>(_onStarted);
    on<PaymentCreatePaymentIntent>(_onCreatePaymentIntent);
    on<PaymentProcessPayment>(_onProcessPayment);
    on<PaymentPaymentSucceeded>(_onPaymentSucceeded);
    on<PaymentPaymentFailed>(_onPaymentFailed);
    on<PaymentPaymentCancelled>(_onPaymentCancelled);
    on<PaymentReset>(_onReset);
  }

  Future<void> _onStarted(
    PaymentStarted event,
    Emitter<PaymentState> emit,
  ) async {
    print('💳 PaymentBloc: Started loading config');
    emit(state.copyWith(
      status: PaymentStatus.loadingConfig,
      bookingId: event.bookingId,
      bookingReference: event.bookingReference,
      amount: event.amount,
      errorMessage: null,
    ));

    try {
      // Get Stripe configuration from backend
      print('💳 PaymentBloc: Fetching Stripe config from API...');
      final config = await bookingsApi.getStripeConfig();
      print('💳 PaymentBloc: Got config - publicKey: ${config.publicKey}');

      if (config.publicKey == null || config.publicKey!.isEmpty) {
        print('💳 PaymentBloc: ERROR - Stripe public key is null or empty!');
        emit(state.copyWith(
          status: PaymentStatus.failed,
          errorMessage: 'Stripe configuration not available. Please contact support.',
          errorTimestamp: DateTime.now(),
        ));
        return;
      }

      print('💳 PaymentBloc: Config loaded successfully, transitioning to configLoaded');
      emit(state.copyWith(
        status: PaymentStatus.configLoaded,
        stripePublishableKey: config.publicKey!,
      ));
      print('💳 PaymentBloc: State is now: ${state.status}');
    } catch (e, stackTrace) {
      print('💳 PaymentBloc: ERROR loading config: $e');
      print('💳 PaymentBloc: Stack trace: $stackTrace');
      emit(state.copyWith(
        status: PaymentStatus.failed,
        errorMessage: 'Failed to load payment configuration: ${e.toString()}',
        errorTimestamp: DateTime.now(),
      ));
    }
  }

  Future<void> _onCreatePaymentIntent(
    PaymentCreatePaymentIntent event,
    Emitter<PaymentState> emit,
  ) async {
    print('💳 PaymentBloc: Creating payment intent...');
    if (state.bookingId == null) {
      print('💳 PaymentBloc: ERROR - No booking ID!');
      emit(state.copyWith(
        status: PaymentStatus.failed,
        errorMessage: 'No booking ID available',
        errorTimestamp: DateTime.now(),
      ));
      return;
    }

    print('💳 PaymentBloc: Booking ID: ${state.bookingId}');
    emit(state.copyWith(status: PaymentStatus.creatingPayment));

    try {
      // Create payment intent on backend
      final paymentRequest = PaymentCreateRequest(
        booking: state.bookingId!,
        paymentMethod: 'credit_card', // Default payment method
      );

      print('💳 PaymentBloc: Calling backend to create payment...');
      final payment = await bookingsApi.createPayment(paymentRequest);
      print('💳 PaymentBloc: Payment created successfully!');
      print('💳 PaymentBloc: Payment ID: ${payment.id}');
      print('💳 PaymentBloc: Stripe client secret: ${payment.stripeClientSecret}');

      emit(state.copyWith(
        status: PaymentStatus.paymentCreated,
        payment: payment,
      ));
      print('💳 PaymentBloc: State is now: ${state.status}');
    } catch (e, stackTrace) {
      print('💳 PaymentBloc: ERROR creating payment: $e');
      print('💳 PaymentBloc: Stack trace: $stackTrace');
      emit(state.copyWith(
        status: PaymentStatus.failed,
        errorMessage: 'Failed to create payment: ${e.toString()}',
        errorTimestamp: DateTime.now(),
      ));
    }
  }

  Future<void> _onProcessPayment(
    PaymentProcessPayment event,
    Emitter<PaymentState> emit,
  ) async {
    if (state.payment?.stripeClientSecret == null) {
      emit(state.copyWith(
        status: PaymentStatus.failed,
        errorMessage: 'No payment intent available',
        errorTimestamp: DateTime.now(),
      ));
      return;
    }

    emit(state.copyWith(status: PaymentStatus.processing));

    try {
      // Initialize the payment sheet with client secret
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: state.payment!.stripeClientSecret!,
          merchantDisplayName: 'Lumo Cinema',
          style: ThemeMode.dark,
        ),
      );

      // Present the payment sheet to the user
      await Stripe.instance.presentPaymentSheet();

      // If we reach here, payment was successful
      add(const PaymentEvent.paymentSucceeded());
    } catch (e) {
      if (e is StripeException) {
        // User cancelled the payment
        if (e.error.code == FailureCode.Canceled) {
          add(const PaymentEvent.paymentCancelled());
        } else {
          add(PaymentEvent.paymentFailed(
            e.error.message ?? 'Payment failed',
          ));
        }
      } else {
        add(PaymentEvent.paymentFailed(e.toString()));
      }
    }
  }

  void _onPaymentSucceeded(
    PaymentPaymentSucceeded event,
    Emitter<PaymentState> emit,
  ) {
    emit(state.copyWith(status: PaymentStatus.succeeded));
  }

  void _onPaymentFailed(
    PaymentPaymentFailed event,
    Emitter<PaymentState> emit,
  ) {
    emit(state.copyWith(
      status: PaymentStatus.failed,
      errorMessage: event.error,
      errorTimestamp: DateTime.now(),
    ));
  }

  void _onPaymentCancelled(
    PaymentPaymentCancelled event,
    Emitter<PaymentState> emit,
  ) {
    emit(state.copyWith(
      status: PaymentStatus.cancelled,
      errorMessage: 'Payment was cancelled',
      errorTimestamp: DateTime.now(),
    ));
  }

  void _onReset(
    PaymentReset event,
    Emitter<PaymentState> emit,
  ) {
    emit(const PaymentState());
  }
}
