import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class XpCounter extends StatelessWidget {
  final int xp;
  final TextStyle? style;

  const XpCounter({super.key, required this.xp, this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.xpGold.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.xpGold.withOpacity(0.6)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.bolt_rounded, color: AppColors.xpGold, size: 18),
          const SizedBox(width: 4),
          Text(
            '$xp XP',
            style: style ?? const TextStyle(color: AppColors.xpGold, fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
