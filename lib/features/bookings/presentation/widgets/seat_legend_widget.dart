import 'package:flutter/cupertino.dart';

class SeatLegendWidget extends StatelessWidget {
  const SeatLegendWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6.resolveFrom(context).withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: CupertinoColors.systemGrey5.resolveFrom(context),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Seat Legend',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.label.resolveFrom(context),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 16,
            runSpacing: 12,
            children: [
              _LegendItem(
                color: CupertinoColors.systemGreen.resolveFrom(context),
                label: 'Standard',
              ),
              _LegendItem(
                color: CupertinoColors.systemPurple.resolveFrom(context),
                label: 'Premium',
              ),
              _LegendItem(
                color: CupertinoColors.systemPink.resolveFrom(context),
                label: 'Couple',
              ),
              _LegendItem(
                color: CupertinoColors.systemBlue.resolveFrom(context),
                label: 'Accessible',
              ),
              _LegendItem(
                color: CupertinoColors.systemRed,
                label: 'Selected',
              ),
              _LegendItem(
                color: CupertinoColors.systemGrey.resolveFrom(context),
                label: 'Reserved',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.3),
            border: Border.all(
              color: color,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: CupertinoColors.secondaryLabel.resolveFrom(context),
          ),
        ),
      ],
    );
  }
}
