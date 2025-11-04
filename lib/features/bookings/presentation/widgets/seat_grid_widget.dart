import 'package:flutter/cupertino.dart';
import '../../domain/entities/booking.dart';
import 'seat_item_widget.dart';

class SeatGridWidget extends StatelessWidget {
  final SeatMap seatMap;
  final List<String> selectedSeatIds;
  final Function(String) onSeatTap;

  const SeatGridWidget({
    super.key,
    required this.seatMap,
    required this.selectedSeatIds,
    required this.onSeatTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: seatMap.seatMap.map((seatRow) {
          if (seatRow.seats.isEmpty) return const SizedBox.shrink();

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Row label (left side)
                SizedBox(
                  width: 30,
                  child: Text(
                    seatRow.row,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.secondaryLabel.resolveFrom(context),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 8),
                // Seats in the row
                Flexible(
                  child: Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    alignment: WrapAlignment.center,
                    children: seatRow.seats.map((seat) {
                      final isSelected = selectedSeatIds.contains(seat.seatId);
                      final isReserved = !seat.isAvailable || seat.isBlocked;

                      return SeatItemWidget(
                        seat: seat,
                        isSelected: isSelected,
                        isReserved: isReserved,
                        onTap: () => onSeatTap(seat.seatId),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(width: 8),
                // Row label (right side)
                SizedBox(
                  width: 30,
                  child: Text(
                    seatRow.row,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.secondaryLabel.resolveFrom(context),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
