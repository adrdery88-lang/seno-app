import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AccuracyMeter extends StatelessWidget {
  final double accuracy; // 0.0 to 1.0
  final double height;

  const AccuracyMeter({
    super.key,
    required this.accuracy,
    this.height = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(height / 2),
      child: Stack(
        children: [
          Container(
            height: height,
            width: double.infinity,
            color: AppColors.darkBorder,
          ),
          FractionallySizedBox(
            widthFactor: accuracy.clamp(0.0, 1.0),
            child: Container(
              height: height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.accent, AppColors.warning, AppColors.secondary],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
