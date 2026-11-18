import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';

class RoleplayMenuScreen extends StatelessWidget {
  const RoleplayMenuScreen({super.key});

  final List<Map<String, String>> _personas = const [
    {
      'id': 'officer_rivera',
      'name': 'Officer Rivera',
      'role': 'Border Customs Officer',
      'scenario': 'Airport Customs Check',
      'level': 'A2-B1',
      'avatar': '👮',
    },
    {
      'id': 'maya_barista',
      'name': 'Maya',
      'role': 'Friendly Barista',
      'scenario': 'Downtown Coffee Shop',
      'level': 'A1-A2',
      'avatar': '☕',
    },
    {
      'id': 'sarah_chen',
      'name': 'Sarah Chen',
      'role': 'Tech VP & Hiring Manager',
      'scenario': 'Job Interview Simulation',
      'level': 'B1-B2',
      'avatar': '👔',
    },
    {
      'id': 'james_mitchell',
      'name': 'James Mitchell',
      'role': 'Procurement Director',
      'scenario': 'Enterprise SaaS Negotiation',
      'level': 'B2-C1',
      'avatar': '🏢',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(title: const Text('AI Roleplay Personas')),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: _personas.length,
        itemBuilder: (context, i) {
          final p = _personas[i];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.darkSurface,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.primary.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: AppColors.primary.withOpacity(0.15),
                  child: Text(p['avatar']!, style: const TextStyle(fontSize: 26)),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(p['name']!, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white)),
                      const SizedBox(height: 2),
                      Text(p['role']!, style: const TextStyle(color: AppColors.primaryLight, fontSize: 13)),
                      const SizedBox(height: 4),
                      Text(p['scenario']!, style: const TextStyle(color: AppColors.darkTextSecondary, fontSize: 13)),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () => context.go('/practice/roleplay/${p['id']}'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Start', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
