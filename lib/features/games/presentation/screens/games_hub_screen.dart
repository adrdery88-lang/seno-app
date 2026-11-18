import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/router/route_names.dart';

class GamesHubScreen extends StatelessWidget {
  const GamesHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(title: const Text('Gamified Practice')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _gameCard(
            context,
            title: 'Word Rush',
            desc: 'Match English vocabulary with Arabic definitions against a 60-second timer.',
            xp: '+30 XP',
            icon: Icons.bolt_rounded,
            color: AppColors.xpGold,
            route: RouteNames.wordRush,
          ),
          const SizedBox(height: 16),
          _gameCard(
            context,
            title: 'Sentence Builder',
            desc: 'Drag and drop shuffled words into grammatically correct sentence sequences.',
            xp: '+45 XP',
            icon: Icons.extension_rounded,
            color: AppColors.secondary,
            route: RouteNames.sentenceBuilder,
          ),
          const SizedBox(height: 16),
          _gameCard(
            context,
            title: 'Voice Escape',
            desc: 'Pronounce phrases accurately (>= 75%) to unlock doors and escape the labyrinth.',
            xp: '+60 XP',
            icon: Icons.vpn_key_rounded,
            color: AppColors.accent,
            route: RouteNames.voiceEscape,
          ),
          const SizedBox(height: 16),
          _gameCard(
            context,
            title: 'AR Snap & Learn',
            desc: 'Scan real-world objects with your phone camera, learn vocabulary & instant quiz.',
            xp: '+40 XP',
            icon: Icons.camera_alt_rounded,
            color: AppColors.info,
            route: RouteNames.snapLearn,
          ),
          const SizedBox(height: 16),
          _gameCard(
            context,
            title: 'Context Shadowing',
            desc: 'Mimic native speaker intonation & rhythm with side-by-side waveform analysis.',
            xp: '+50 XP',
            icon: Icons.graphic_eq_rounded,
            color: AppColors.primaryLight,
            route: RouteNames.shadowing,
          ),
        ],
      ),
    );
  }

  Widget _gameCard(
    BuildContext context, {
    required String title,
    required String desc,
    required String xp,
    required IconData icon,
    required Color color,
    required String route,
  }) {
    return InkWell(
      onTap: () => context.go(route),
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.darkSurface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: color.withOpacity(0.3), width: 1.5),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: color, size: 30),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white)),
                      const Spacer(),
                      Text(xp, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 13)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(desc, style: const TextStyle(color: AppColors.darkTextSecondary, fontSize: 13, height: 1.3)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
