import 'package:flutter/cupertino.dart';
import 'package:lucide_icons/lucide_icons.dart' as lucide;
import '../../../movies/domain/entities/movie.dart';
import '../../domain/entities/booking.dart';
import '../../domain/entities/concession.dart';
import '../../data/datasources/bookings_api.dart';
import '../../../../core/data/api_client.dart';
import 'payment_page.dart';

class ConcessionsPage extends StatefulWidget {
  final Showtime showtime;
  final ReservationResult reservationResult;
  final double seatsTotal;

  const ConcessionsPage({
    super.key,
    required this.showtime,
    required this.reservationResult,
    required this.seatsTotal,
  });

  @override
  State<ConcessionsPage> createState() => _ConcessionsPageState();
}

class _ConcessionsPageState extends State<ConcessionsPage> {
  final Map<String, int> _selectedConcessions = {};
  List<Concession>? _concessions;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadConcessions();
  }

  Future<void> _loadConcessions() async {
    try {
      final api = BookingsApi(ApiClient.instance);
      final concessionsModels = await api.getConcessions();
      setState(() {
        _concessions = concessionsModels.map((m) => m.toEntity()).toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load concessions: $e';
        _isLoading = false;
      });
    }
  }

  void _updateQuantity(String concessionId, int delta) {
    setState(() {
      final currentQty = _selectedConcessions[concessionId] ?? 0;
      final newQty = currentQty + delta;
      if (newQty <= 0) {
        _selectedConcessions.remove(concessionId);
      } else {
        _selectedConcessions[concessionId] = newQty;
      }
    });
  }

  double get _concessionsTotal {
    if (_concessions == null) return 0.0;
    return _selectedConcessions.entries.fold(0.0, (sum, entry) {
      final concession = _concessions!.firstWhere((c) => c.id == entry.key);
      return sum + (concession.price * entry.value);
    });
  }

  double get _grandTotal => widget.seatsTotal + _concessionsTotal;

  Future<void> _proceedToPayment() async {
    // Validate reservation data exists
    if (widget.reservationResult.reservations.isEmpty) {
      if (mounted) {
        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: const Text('Error'),
            content: const Text('No seat reservations found. Please select seats again.'),
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      }
      return;
    }

    // Show loading dialog
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CupertinoActivityIndicator(radius: 20),
      ),
    );

    try {
      // Create booking with selected seats and concessions
      final api = BookingsApi(ApiClient.instance);

      // Prepare concessions data
      final concessionsData = _selectedConcessions.entries
          .map((entry) => {
                'concession_id': entry.key,
                'quantity': entry.value,
              })
          .toList();

      // Get reservation IDs and seat numbers
      final reservationIds = widget.reservationResult.reservations
          .map((r) => r.id)
          .toList();
      final seatNumbers = widget.reservationResult.reservations
          .map((r) => r.seatIdentifier)
          .toList();

      // Debug: Log booking data
      print('Creating booking with data:');
      print('  Showtime: ${widget.showtime.id}');
      print('  Number of seats: ${widget.reservationResult.reservations.length}');
      print('  Seat numbers: $seatNumbers');
      print('  Reservation IDs: $reservationIds');
      print('  Concessions: ${concessionsData.length}');

      // Create booking with correct field names
      final bookingData = {
        'showtime': widget.showtime.id,
        'number_of_seats': widget.reservationResult.reservations.length,
        'seat_numbers': seatNumbers,
        'seat_reservation_ids': reservationIds,
        'concessions': concessionsData,
      };

      print('Booking data JSON: $bookingData');

      final booking = await api.createBooking(bookingData);

      // Close loading dialog using root navigator
      if (mounted) {
        Navigator.of(context, rootNavigator: true).pop();

        if (!mounted) return;

        // Navigate to payment page
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) => PaymentPage(
              bookingId: booking.id,
              bookingReference: booking.bookingReference,
              amount: booking.totalAmount,
            ),
          ),
        );
      }
    } catch (e) {
      // Close loading dialog using root navigator
      if (mounted) {
        Navigator.of(context, rootNavigator: true).pop();

        // Show error dialog
        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: const Text('Booking Error'),
            content: Text('Failed to create booking: $e'),
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
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground.resolveFrom(context),
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBackground.resolveFrom(context),
        border: null,
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.of(context).pop(),
          child: const Icon(lucide.LucideIcons.chevronLeft, size: 28),
        ),
        middle: const Text(
          'Add Snacks & Drinks',
          style: TextStyle(
            color: CupertinoColors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Booking info header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey6
                    .resolveFrom(context)
                    .withOpacity(0.3),
                border: Border(
                  bottom: BorderSide(
                    color: CupertinoColors.systemGrey5.resolveFrom(context),
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.showtime.movieTitle ?? 'Movie',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.label.resolveFrom(context),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${widget.reservationResult.reservations.length} seats selected • \$${widget.seatsTotal.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 14,
                      color: CupertinoColors.secondaryLabel.resolveFrom(context),
                    ),
                  ),
                ],
              ),
            ),

            // Concessions list
            Expanded(
              child: _isLoading
                  ? const Center(child: CupertinoActivityIndicator(radius: 15))
                  : _errorMessage != null
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                lucide.LucideIcons.alertCircle,
                                size: 48,
                                color: CupertinoColors.systemRed,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                _errorMessage!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: CupertinoColors.secondaryLabel
                                      .resolveFrom(context),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 24),
                              CupertinoButton.filled(
                                onPressed: _loadConcessions,
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        )
                      : _concessions == null || _concessions!.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    lucide.LucideIcons.popcorn,
                                    size: 64,
                                    color: CupertinoColors.systemGrey
                                        .resolveFrom(context),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'No concessions available',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: CupertinoColors.secondaryLabel
                                          .resolveFrom(context),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : ListView.builder(
                              padding: const EdgeInsets.all(16),
                              itemCount: _concessions!.length,
                              itemBuilder: (context, index) {
                                final concession = _concessions![index];
                                final quantity =
                                    _selectedConcessions[concession.id] ?? 0;
                                return _ConcessionItem(
                                  concession: concession,
                                  quantity: quantity,
                                  onQuantityChanged: (delta) =>
                                      _updateQuantity(concession.id, delta),
                                );
                              },
                            ),
            ),

            // Bottom action bar
            _BottomActionBar(
              concessionsTotal: _concessionsTotal,
              grandTotal: _grandTotal,
              hasSelectedConcessions: _selectedConcessions.isNotEmpty,
              onProceed: _proceedToPayment,
              onSkip: _proceedToPayment,
            ),
          ],
        ),
      ),
    );
  }
}

class _ConcessionItem extends StatelessWidget {
  final Concession concession;
  final int quantity;
  final Function(int delta) onQuantityChanged;

  const _ConcessionItem({
    required this.concession,
    required this.quantity,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6.resolveFrom(context).withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: quantity > 0
            ? Border.all(color: CupertinoColors.systemRed, width: 2)
            : null,
      ),
      child: Row(
        children: [
          // Icon or image placeholder
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey5.resolveFrom(context),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              concession.isCombo
                  ? lucide.LucideIcons.package
                  : concession.concessionType == ConcessionType.beverage
                      ? lucide.LucideIcons.cupSoda
                      : lucide.LucideIcons.popcorn,
              size: 32,
              color: CupertinoColors.systemRed,
            ),
          ),
          const SizedBox(width: 12),
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  concession.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.label.resolveFrom(context),
                  ),
                ),
                if (concession.isCombo && concession.comboItems != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    concession.comboItems!,
                    style: TextStyle(
                      fontSize: 12,
                      color: CupertinoColors.secondaryLabel.resolveFrom(context),
                    ),
                  ),
                ],
                const SizedBox(height: 4),
                Text(
                  '\$${concession.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.systemRed,
                  ),
                ),
              ],
            ),
          ),
          // Quantity controls
          Row(
            children: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                minimumSize: const Size(32, 32),
                onPressed: quantity > 0 ? () => onQuantityChanged(-1) : null,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: quantity > 0
                        ? CupertinoColors.systemRed
                        : CupertinoColors.systemGrey,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    lucide.LucideIcons.minus,
                    size: 16,
                    color: CupertinoColors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 32,
                child: Text(
                  '$quantity',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.label.resolveFrom(context),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                minimumSize: const Size(32, 32),
                onPressed: () => onQuantityChanged(1),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: CupertinoColors.systemRed,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    lucide.LucideIcons.plus,
                    size: 16,
                    color: CupertinoColors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BottomActionBar extends StatelessWidget {
  final double concessionsTotal;
  final double grandTotal;
  final bool hasSelectedConcessions;
  final VoidCallback onProceed;
  final VoidCallback onSkip;

  const _BottomActionBar({
    required this.concessionsTotal,
    required this.grandTotal,
    required this.hasSelectedConcessions,
    required this.onProceed,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground.resolveFrom(context),
        border: Border(
          top: BorderSide(
            color: CupertinoColors.systemGrey5.resolveFrom(context),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Totals breakdown
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Concessions Total',
                  style: TextStyle(
                    fontSize: 14,
                    color: CupertinoColors.secondaryLabel.resolveFrom(context),
                  ),
                ),
                Text(
                  '\$${concessionsTotal.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.label.resolveFrom(context),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Grand Total',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.label.resolveFrom(context),
                  ),
                ),
                Text(
                  '\$${grandTotal.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.systemRed,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Action buttons
            Row(
              children: [
                if (!hasSelectedConcessions)
                  Expanded(
                    child: CupertinoButton(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      color: CupertinoColors.systemGrey5.resolveFrom(context),
                      onPressed: onSkip,
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: CupertinoColors.label.resolveFrom(context),
                        ),
                      ),
                    ),
                  ),
                if (!hasSelectedConcessions) const SizedBox(width: 12),
                Expanded(
                  child: CupertinoButton(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    color: CupertinoColors.systemRed,
                    onPressed: onProceed,
                    child: Text(
                      hasSelectedConcessions ? 'Proceed to Payment' : 'Continue',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
