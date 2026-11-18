import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class VoiceEscapeScreen extends StatefulWidget {
  const VoiceEscapeScreen({super.key});

  @override
  State<VoiceEscapeScreen> createState() => _VoiceEscapeScreenState();
}

class _VoiceEscapeScreenState extends State<VoiceEscapeScreen> {
  int _currentDoor = 1;
  final int _totalDoors = 4;
  bool _unlocked = false;

  final List<String> _passphrases = [
    'Open the gateway to fluent speech.',
    'Clear articulation unlocks progress.',
    'Consistent practice overcomes hurdles.',
    'Welcome to mastery.',
  ];

  void _pronouncePassphrase() {
    setState(() => _unlocked = true);
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (_currentDoor < _totalDoors) {
        setState(() {
          _currentDoor++;
          _unlocked = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(title: const Text('Voice Escape Room')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text('Door $_currentDoor of $_totalDoors', style: const TextStyle(color: AppColors.darkTextSecondary, fontSize: 14)),
              const SizedBox(height: 24),
              Icon(
                _unlocked ? Icons.lock_open_rounded : Icons.lock_rounded,
                size: 90,
                color: _unlocked ? AppColors.secondary : AppColors.accent,
              ),
              const SizedBox(height: 24),
              const Text('Speak this passphrase to unlock door:', style: TextStyle(color: AppColors.darkTextSecondary, fontSize: 14)),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.darkSurface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.darkBorder),
                ),
                child: Text(
                  _passphrases[_currentDoor - 1],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: _pronouncePassphrase,
                icon: const Icon(Icons.mic_rounded, color: Colors.white),
                label: const Text('Pronounce to Unlock Door', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: const Size(double.infinity, 54),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
