import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class SpeedControlButton extends StatelessWidget {
  final double currentSpeed; // 1.0 or 0.6
  final ValueChanged<double> onSpeedChanged;

  const SpeedControlButton({
    super.key,
    required this.currentSpeed,
    required this.onSpeedChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isSlow = currentSpeed <= 0.7;
    return GestureDetector(
      onTap: () => onSpeedChanged(isSlow ? 1.0 : 0.6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isSlow ? AppColors.warning.withOpacity(0.2) : AppColors.darkCard,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSlow ? AppColors.warning : AppColors.darkBorder),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSlow ? Icons.slow_motion_video_rounded : Icons.speed_rounded,
              size: 16,
              color: isSlow ? AppColors.warning : AppColors.darkTextSecondary,
            ),
            const SizedBox(width: 4),
            Text(
              isSlow ? '0.6x' : '1.0x',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isSlow ? AppColors.warning : AppColors.darkTextSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
