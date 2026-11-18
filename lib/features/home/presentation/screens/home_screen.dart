import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/widgets/animated_progress_ring.dart';
import '../../../../core/widgets/streak_flame.dart';
import '../../../../core/widgets/xp_counter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        title: const Text('Seno English'),
        actions: const [
          StreakFlame(streakDays: 14),
          SizedBox(width: 8),
          XpCounter(xp: 2450),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Daily Progress Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary.withOpacity(0.3), AppColors.darkSurface],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.primary.withOpacity(0.4)),
              ),
              child: Row(
                children: [
                  const AnimatedProgressRing(
                    progress: 0.72,
                    size: 80,
                    strokeWidth: 8,
                    color: AppColors.secondary,
                    child: Text('72%', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Daily Goal: 15 mins', style: TextStyle(fontSize: 13, color: AppColors.darkTextSecondary)),
                        const SizedBox(height: 4),
                        const Text('Workplace Idioms', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white)),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () => context.go('/learn/lesson/101'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          ),
                          child: const Text('Continue Lesson →', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Daily Challenge
            const Text('Daily Challenge', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.darkTextPrimary)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.darkSurface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.darkBorder),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.accent.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.mic_rounded, color: AppColors.accent, size: 24),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Pronounce 5 B1 Phrases', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15)),
                        SizedBox(height: 4),
                        Text('3 of 5 completed · +50 XP Reward', style: TextStyle(color: AppColors.darkTextSecondary, fontSize: 13)),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios_rounded, color: AppColors.darkTextSecondary, size: 16),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Real-life Quick Scenarios
            const Text('Real-Life Scenarios', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.darkTextPrimary)),
            const SizedBox(height: 12),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _scenarioChip(context, 'Airport', Icons.flight_takeoff_rounded, AppColors.info, 'officer_rivera'),
                  _scenarioChip(context, 'Coffee Shop', Icons.coffee_rounded, AppColors.warning, 'maya_barista'),
                  _scenarioChip(context, 'Job Interview', Icons.work_rounded, AppColors.secondary, 'sarah_chen'),
                  _scenarioChip(context, 'Negotiation', Icons.handshake_rounded, AppColors.accent, 'james_mitchell'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _scenarioChip(BuildContext context, String title, IconData icon, Color color, String personaId) {
    return GestureDetector(
      onTap: () => context.go('/practice/roleplay/$personaId'),
      child: Container(
        width: 110,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.darkSurface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.4)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
