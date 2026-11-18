import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';

class CurriculumScreen extends StatelessWidget {
  const CurriculumScreen({super.key});

  final List<Map<String, dynamic>> _levels = const [
    {
      'id': 1,
      'name': 'Absolute Beginner',
      'cefr': 'Pre-A1',
      'color': AppColors.secondary,
      'desc': 'Alphabet, Phonics, Basic Greetings & Numbers',
      'progress': 1.0,
      'locked': false,
    },
    {
      'id': 2,
      'name': 'Elementary',
      'cefr': 'A1-A2',
      'color': AppColors.primary,
      'desc': 'Daily Conversations, Essential Grammar & Tenses',
      'progress': 0.65,
      'locked': false,
    },
    {
      'id': 3,
      'name': 'Intermediate',
      'cefr': 'B1-B2',
      'color': AppColors.warning,
      'desc': 'Workplace English, Idioms & Listening Comprehension',
      'progress': 0.20,
      'locked': false,
    },
    {
      'id': 4,
      'name': 'Advanced & Mastery',
      'cefr': 'C1-C2',
      'color': AppColors.accent,
      'desc': 'Business Negotiations, Nuances & Public Speaking',
      'progress': 0.0,
      'locked': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(title: const Text('Learning Paths')),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: _levels.length,
        itemBuilder: (context, i) {
          final level = _levels[i];
          final color = level['color'] as Color;
          final isLocked = level['locked'] as bool;

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.darkSurface,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: color.withOpacity(0.4)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        level['cefr'] as String,
                        style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ),
                    Icon(
                      isLocked ? Icons.lock_rounded : Icons.check_circle_rounded,
                      color: isLocked ? AppColors.darkTextSecondary : color,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  level['name'] as String,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 6),
                Text(
                  level['desc'] as String,
                  style: const TextStyle(color: AppColors.darkTextSecondary, fontSize: 14),
                ),
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: level['progress'] as double,
                    backgroundColor: AppColors.darkBorder,
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                    minHeight: 6,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
