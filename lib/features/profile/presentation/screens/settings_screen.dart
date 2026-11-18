import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/accent_toggle_button.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = true;
  bool _srsNotifications = true;
  String _accent = 'US';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SwitchListTile(
            title: const Text('Dark Mode (Recommended)', style: TextStyle(color: Colors.white)),
            value: _darkMode,
            activeColor: AppColors.primary,
            onChanged: (v) => setState(() => _darkMode = v),
          ),
          SwitchListTile(
            title: const Text('SRS Review Push Notifications', style: TextStyle(color: Colors.white)),
            value: _srsNotifications,
            activeColor: AppColors.secondary,
            onChanged: (v) => setState(() => _srsNotifications = v),
          ),
          const SizedBox(height: 16),
          ListTile(
            title: const Text('Pronunciation Accent', style: TextStyle(color: Colors.white)),
            trailing: AccentToggleButton(
              currentAccent: _accent,
              onAccentChanged: (acc) => setState(() => _accent = acc),
            ),
          ),
        ],
      ),
    );
  }
}
