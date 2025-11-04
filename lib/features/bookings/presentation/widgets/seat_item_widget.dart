import 'package:flutter/cupertino.dart';
import '../../domain/entities/booking.dart';

class SeatItemWidget extends StatelessWidget {
  final Seat seat;
  final bool isSelected;
  final bool isReserved;
  final VoidCallback onTap;

  const SeatItemWidget({
    super.key,
    required this.seat,
    required this.isSelected,
    required this.isReserved,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color seatColor;
    Color borderColor;

    if (isReserved) {
      seatColor = CupertinoColors.systemGrey.resolveFrom(context);
      borderColor = CupertinoColors.systemGrey3.resolveFrom(context);
    } else if (isSelected) {
      seatColor = CupertinoColors.systemRed;
      borderColor = CupertinoColors.systemRed.darkColor;
    } else {
      // Different colors for different seat types
      switch (seat.seatType) {
        case SeatType.premium:
          seatColor = CupertinoColors.systemPurple.resolveFrom(context);
          borderColor = CupertinoColors.systemPurple.darkColor;
          break;
        case SeatType.couple:
          seatColor = CupertinoColors.systemPink.resolveFrom(context);
          borderColor = CupertinoColors.systemPink.darkColor;
          break;
        case SeatType.accessible:
          seatColor = CupertinoColors.systemBlue.resolveFrom(context);
          borderColor = CupertinoColors.systemBlue.darkColor;
          break;
        case SeatType.blocked:
          seatColor = CupertinoColors.systemGrey.resolveFrom(context);
          borderColor = CupertinoColors.systemGrey3.resolveFrom(context);
          break;
        case SeatType.standard:
          seatColor = CupertinoColors.systemGreen.resolveFrom(context);
          borderColor = CupertinoColors.systemGreen.darkColor;
          break;
      }
    }

    return GestureDetector(
      onTap: (isReserved || seat.seatType == SeatType.blocked) ? null : onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: seatColor.withValues(alpha: isSelected ? 1.0 : 0.3),
          border: Border.all(
            color: borderColor,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            seat.seatId,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected || isReserved
                  ? CupertinoColors.white
                  : CupertinoColors.label.resolveFrom(context),
            ),
          ),
        ),
      ),
    );
  }
}
