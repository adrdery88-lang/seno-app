import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/widgets/accent_toggle_button.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final _nameController = TextEditingController(text: 'Learner');
  String _accent = 'US';
  double _dailyMinutes = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(title: const Text('Profile & Preferences')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Display Name', style: TextStyle(color: AppColors.darkTextSecondary, fontSize: 14)),
              const SizedBox(height: 8),
              TextField(
                controller: _nameController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.darkSurface,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 24),
              const Text('Target Accent Focus', style: TextStyle(color: AppColors.darkTextSecondary, fontSize: 14)),
              const SizedBox(height: 10),
              AccentToggleButton(
                currentAccent: _accent,
                onAccentChanged: (acc) => setState(() => _accent = acc),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Daily Goal', style: TextStyle(color: AppColors.darkTextSecondary, fontSize: 14)),
                  Text('${_dailyMinutes.round()} minutes / day', style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryLight)),
                ],
              ),
              Slider(
                value: _dailyMinutes,
                min: 5,
                max: 45,
                divisions: 8,
                activeColor: AppColors.primary,
                inactiveColor: AppColors.darkBorder,
                onChanged: (val) => setState(() => _dailyMinutes = val),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () => context.go(RouteNames.home),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: const Text('Start Learning With Seno', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
