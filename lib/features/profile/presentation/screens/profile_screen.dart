import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/widgets/streak_flame.dart';
import '../../../../core/widgets/xp_counter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_rounded),
            onPressed: () => context.go(RouteNames.settings),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 44,
              backgroundColor: AppColors.primary,
              child: Icon(Icons.person_rounded, size: 48, color: Colors.white),
            ),
            const SizedBox(height: 12),
            const Text('Ahmed Al-Mansoor', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 4),
            const Text('Intermediate (B1) Track', style: TextStyle(color: AppColors.primaryLight, fontSize: 14)),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreakFlame(streakDays: 14),
                SizedBox(width: 12),
                XpCounter(xp: 2450),
              ],
            ),
            const SizedBox(height: 28),

            // Navigation shortcuts
            ListTile(
              leading: const Icon(Icons.emoji_events_rounded, color: AppColors.xpGold),
              title: const Text('Leaderboard', style: TextStyle(color: Colors.white)),
              trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.white54),
              tileColor: AppColors.darkSurface,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              onTap: () => context.go(RouteNames.leaderboard),
            ),
            const SizedBox(height: 12),
            ListTile(
              leading: const Icon(Icons.military_tech_rounded, color: AppColors.secondary),
              title: const Text('Achievements & Badges', style: TextStyle(color: Colors.white)),
              trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.white54),
              tileColor: AppColors.darkSurface,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              onTap: () => context.go(RouteNames.achievements),
            ),
          ],
        ),
      ),
    );
  }
}
