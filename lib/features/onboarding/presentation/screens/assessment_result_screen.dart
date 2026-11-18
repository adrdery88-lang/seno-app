import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/widgets/animated_progress_ring.dart';

class AssessmentResultScreen extends StatelessWidget {
  final int score;

  const AssessmentResultScreen({super.key, this.score = 3});

  String _getLevelName(int s) {
    if (s <= 1) return 'Absolute Beginner (Pre-A1)';
    if (s <= 2) return 'Elementary (A1-A2)';
    if (s <= 4) return 'Intermediate (B1-B2)';
    return 'Advanced & Mastery (C1-C2)';
  }

  @override
  Widget build(BuildContext context) {
    final levelName = _getLevelName(score);
    final percent = (score / 5.0).clamp(0.2, 1.0);

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              AnimatedProgressRing(
                progress: percent,
                size: 140,
                strokeWidth: 10,
                color: AppColors.secondary,
                child: Text(
                  '${(percent * 100).round()}%',
                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Assessment Complete!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.darkTextPrimary),
              ),
              const SizedBox(height: 8),
              Text(
                'We calibrated your learning track to:',
                style: TextStyle(fontSize: 15, color: AppColors.darkTextSecondary.withOpacity(0.9)),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primary, width: 1.5),
                ),
                child: Text(
                  levelName,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primaryLight),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () => context.go(RouteNames.profileSetup),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: const Text('Setup Your Profile', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
