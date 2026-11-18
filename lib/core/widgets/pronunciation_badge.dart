import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class PronunciationBadge extends StatelessWidget {
  final double accuracy; // 0 to 100
  final double size;

  const PronunciationBadge({
    super.key,
    required this.accuracy,
    this.size = 32.0,
  });

  Color _getColor() {
    if (accuracy >= 80) return AppColors.secondary;
    if (accuracy >= 60) return AppColors.warning;
    return AppColors.accent;
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color, width: 1.2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            accuracy >= 80 ? Icons.check_circle_rounded : (accuracy >= 60 ? Icons.warning_rounded : Icons.cancel_rounded),
            color: color,
            size: 16,
          ),
          const SizedBox(width: 4),
          Text(
            '${accuracy.round()}%',
            style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
