import 'package:flutter/material.dart';
import '../config/theme.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final bool compact;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = compact ? 28.0 : 36.0;
    final iconSize = compact ? 16.0 : 20.0;
    final fontSize = compact ? 14.0 : 16.0;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onDecrement,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: quantity <= 1
                    ? Colors.grey.shade100
                    : AppTheme.primaryColor.withOpacity(0.1),
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(7),
                ),
              ),
              child: Icon(
                Icons.remove,
                size: iconSize,
                color: quantity <= 1
                    ? Colors.grey.shade400
                    : AppTheme.primaryColor,
              ),
            ),
          ),
          Container(
            width: compact ? 36 : 48,
            height: size,
            alignment: Alignment.center,
            child: Text(
              quantity.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
            ),
          ),
          GestureDetector(
            onTap: onIncrement,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.1),
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(7),
                ),
              ),
              child: Icon(
                Icons.add,
                size: iconSize,
                color: AppTheme.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}