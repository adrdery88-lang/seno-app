import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class StreakFlame extends StatelessWidget {
  final int streakDays;

  const StreakFlame({super.key, required this.streakDays});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.accent.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.accent.withOpacity(0.6)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.local_fire_department_rounded, color: AppColors.accent, size: 18),
          const SizedBox(width: 4),
          Text(
            '$streakDays Days',
            style: const TextStyle(color: AppColors.accent, fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
