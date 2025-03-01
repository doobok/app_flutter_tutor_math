import 'package:flutter/cupertino.dart';

class TransactionItem extends StatelessWidget {
  final String description;
  final double amount;
  final DateTime date;

  const TransactionItem({
    super.key,
    required this.description,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            amount > 0 ? CupertinoIcons.arrow_down_circle_fill : CupertinoIcons.arrow_up_circle_fill,
            size: 24,
            color: amount > 0 ? CupertinoColors.systemGreen : CupertinoColors.systemRed,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${amount > 0 ? '+' : ''}\$${amount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 14,
                    color: amount > 0 ? CupertinoColors.systemGreen : CupertinoColors.systemRed,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${date.day}.${date.month}.${date.year}',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}