import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  final List<Map<String, dynamic>> _ranks = const [
    {'rank': 1, 'name': 'Sarah K.', 'xp': 4820, 'badge': '🥇'},
    {'rank': 2, 'name': 'You (Ahmed)', 'xp': 2450, 'badge': '🥈'},
    {'rank': 3, 'name': 'David M.', 'xp': 2310, 'badge': '🥉'},
    {'rank': 4, 'name': 'Elena R.', 'xp': 1950, 'badge': '4'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(title: const Text('Weekly Leaderboard')),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: _ranks.length,
        itemBuilder: (context, i) {
          final r = _ranks[i];
          final isUser = (r['name'] as String).contains('You');
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isUser ? AppColors.primary.withOpacity(0.2) : AppColors.darkSurface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: isUser ? AppColors.primary : AppColors.darkBorder),
            ),
            child: Row(
              children: [
                Text(r['badge'] as String, style: const TextStyle(fontSize: 20)),
                const SizedBox(width: 16),
                Expanded(child: Text(r['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
                Text('${r['xp']} XP', style: const TextStyle(color: AppColors.xpGold, fontWeight: FontWeight.bold)),
              ],
            ),
          );
        },
      ),
    );
  }
}
