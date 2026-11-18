import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  final List<Map<String, dynamic>> _badges = const [
    {'title': '7-Day Streak', 'desc': 'Practiced 7 days in a row', 'unlocked': true, 'icon': Icons.local_fire_department_rounded},
    {'title': 'Vault Builder', 'desc': 'Saved 50 words to Vault', 'unlocked': true, 'icon': Icons.bookmark_rounded},
    {'title': 'Native Mimic', 'desc': 'Scored >= 90% on 10 phrases', 'unlocked': true, 'icon': Icons.mic_rounded},
    {'title': 'Roleplay Pro', 'desc': 'Completed 5 AI persona chats', 'unlocked': false, 'icon': Icons.smart_toy_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(title: const Text('Achievements & Badges')),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.9,
        ),
        itemCount: _badges.length,
        itemBuilder: (context, i) {
          final b = _badges[i];
          final unlocked = b['unlocked'] as bool;
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.darkSurface,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: unlocked ? AppColors.secondary : AppColors.darkBorder),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(b['icon'] as IconData, size: 40, color: unlocked ? AppColors.secondary : Colors.white24),
                const SizedBox(height: 12),
                Text(b['title'] as String, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 4),
                Text(b['desc'] as String, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, color: AppColors.darkTextSecondary)),
              ],
            ),
          );
        },
      ),
    );
  }
}
