import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart' as lucide;
import 'package:intl/intl.dart';
import '../../../../core/data/api_client.dart';
import '../../data/datasources/bookings_api.dart';
import '../viewmodels/payment_bloc.dart';
import '../viewmodels/payment_event.dart';
import '../viewmodels/payment_state.dart';

class PaymentPage extends StatelessWidget {
  final String bookingId;
  final String bookingReference;
  final double amount;

  const PaymentPage({
    super.key,
    required this.bookingId,
    required this.bookingReference,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentBloc(
        bookingsApi: BookingsApi(ApiClient.instance),
      )..add(PaymentEvent.started(
          bookingId: bookingId,
          bookingReference: bookingReference,
          amount: amount,
        )),
      child: const PaymentView(),
    );
  }
}

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentBloc, PaymentState>(
      listener: (context, state) {
        if (state.isSucceeded) {
          // Navigate to success screen
          _showSuccessDialog(context, state.bookingReference ?? '');
        } else if (state.isFailed) {
          // Show error dialog
          _showErrorDialog(context, state.errorMessage ?? 'Payment failed');
        } else if (state.isCancelled) {
          // Show cancelled message
          _showCancelledDialog(context);
        }
      },
      builder: (context, state) {
        return CupertinoPageScaffold(
          backgroundColor: CupertinoColors.systemBackground.resolveFrom(context),
          navigationBar: CupertinoNavigationBar(
            backgroundColor:
                CupertinoColors.systemBackground.resolveFrom(context),
            border: null,
            middle: const Text('Payment'),
            leading: CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Icon(lucide.LucideIcons.chevronLeft),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          child: SafeArea(
            child: _buildContent(context, state),
          ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, PaymentState state) {
    print('💳 PaymentPage: Building content with status: ${state.status}');

    if (state.status == PaymentStatus.loadingConfig) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CupertinoActivityIndicator(radius: 20),
            const SizedBox(height: 16),
            const Text('Loading payment configuration...'),
          ],
        ),
      );
    }

    if (state.status == PaymentStatus.failed) {
      print('💳 PaymentPage: Showing error - ${state.errorMessage}');
      return _buildError(context, state.errorMessage ?? 'Failed to load payment');
    }

    print('💳 PaymentPage: Showing main payment UI');
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBookingInfo(context, state),
                const SizedBox(height: 24),
                _buildPriceBreakdown(context, state),
                const SizedBox(height: 32),
                _buildPaymentInfo(context),
              ],
            ),
          ),
        ),
        _buildBottomBar(context, state),
      ],
    );
  }

  Widget _buildBookingInfo(BuildContext context, PaymentState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6.resolveFrom(context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Booking Details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildInfoRow('Reference', state.bookingReference ?? 'N/A'),
          const SizedBox(height: 8),
          _buildInfoRow(
            'Amount',
            NumberFormat.currency(symbol: '\$').format(state.amount ?? 0),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: CupertinoColors.systemGrey,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceBreakdown(BuildContext context, PaymentState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6.resolveFrom(context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Price Breakdown',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildInfoRow(
            'Subtotal',
            NumberFormat.currency(symbol: '\$').format(state.amount ?? 0),
          ),
          Container(
            height: 1,
            margin: const EdgeInsets.symmetric(vertical: 12),
            color: CupertinoColors.separator.resolveFrom(context),
          ),
          _buildInfoRow(
            'Total',
            NumberFormat.currency(symbol: '\$').format(state.amount ?? 0),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6.resolveFrom(context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(lucide.LucideIcons.shieldCheck, size: 20),
              SizedBox(width: 8),
              Text(
                'Secure Payment',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Your payment is securely processed by Stripe. We never store your card details.',
            style: TextStyle(
              fontSize: 14,
              color: CupertinoColors.systemGrey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, PaymentState state) {
    final isProcessing = state.isProcessing;
    final canPay = state.canInitiatePayment ||
                    state.status == PaymentStatus.paymentCreated;

    print('💳 PaymentPage: Bottom bar state:');
    print('💳   - isProcessing: $isProcessing');
    print('💳   - canPay: $canPay');
    print('💳   - canInitiatePayment: ${state.canInitiatePayment}');
    print('💳   - bookingId: ${state.bookingId}');
    print('💳   - status: ${state.status}');

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground.resolveFrom(context),
        border: Border(
          top: BorderSide(
            color: CupertinoColors.separator.resolveFrom(context),
            width: 0.5,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: CupertinoButton(
          padding: const EdgeInsets.symmetric(vertical: 16),
          color: CupertinoColors.systemRed,
          disabledColor: CupertinoColors.systemGrey,
          borderRadius: BorderRadius.circular(12),
          onPressed: canPay && !isProcessing
              ? () => _handlePayment(context, state)
              : null,
          child: isProcessing
              ? const CupertinoActivityIndicator(color: CupertinoColors.white)
              : Text(
                  'Pay ${NumberFormat.currency(symbol: '\$').format(state.amount ?? 0)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              lucide.LucideIcons.alertCircle,
              size: 64,
              color: CupertinoColors.systemRed,
            ),
            const SizedBox(height: 16),
            Text(
              'Payment Error',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: CupertinoColors.systemGrey,
              ),
            ),
            const SizedBox(height: 24),
            CupertinoButton(
              color: CupertinoColors.systemRed,
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }

  void _handlePayment(BuildContext context, PaymentState state) {
    print('💳 PaymentPage: _handlePayment called with status: ${state.status}');
    final bloc = context.read<PaymentBloc>();

    if (state.status == PaymentStatus.configLoaded) {
      // First create payment intent
      print('💳 PaymentPage: Dispatching createPaymentIntent event');
      bloc.add(const PaymentEvent.createPaymentIntent());
    } else if (state.status == PaymentStatus.paymentCreated) {
      // Then process payment with Stripe
      print('💳 PaymentPage: Dispatching processPayment event');
      bloc.add(const PaymentEvent.processPayment());
    } else {
      print('💳 PaymentPage: Unexpected status, not handling: ${state.status}');
    }
  }

  void _showSuccessDialog(BuildContext context, String bookingReference) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CupertinoAlertDialog(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(lucide.LucideIcons.checkCircle2,
                color: CupertinoColors.systemGreen),
            SizedBox(width: 8),
            Text('Payment Successful'),
          ],
        ),
        content: Text(
          'Your booking has been confirmed!\n\nReference: $bookingReference',
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text('View Bookings'),
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              Navigator.of(context).pop(); // Close payment page
              Navigator.of(context).pop(); // Close concessions page
              Navigator.of(context).pop(); // Close seat selection page
              // Navigate to bookings/profile tab would go here if implemented
            },
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Payment Failed'),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            child: const Text('Try Again'),
            onPressed: () {
              Navigator.of(context).pop();
              context.read<PaymentBloc>().add(const PaymentEvent.reset());
            },
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              Navigator.of(context).pop(); // Close payment page
            },
          ),
        ],
      ),
    );
  }

  void _showCancelledDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Payment Cancelled'),
        content: const Text('You cancelled the payment.'),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
