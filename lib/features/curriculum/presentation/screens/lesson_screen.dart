import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/accent_toggle_button.dart';
import '../../../../core/widgets/pronunciation_badge.dart';
import '../../../../core/widgets/speed_control_button.dart';

class LessonScreen extends StatefulWidget {
  final String lessonId;
  const LessonScreen({super.key, required this.lessonId});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  String _accent = 'US';
  double _speed = 1.0;
  bool _isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        title: const Text('Vocabulary Lesson'),
        actions: [
          IconButton(
            icon: Icon(_isSaved ? Icons.bookmark_added_rounded : Icons.bookmark_add_outlined,
                color: _isSaved ? AppColors.secondary : Colors.white),
            onPressed: () => setState(() => _isSaved = !_isSaved),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AccentToggleButton(
                    currentAccent: _accent,
                    onAccentChanged: (acc) => setState(() => _accent = acc),
                  ),
                  SpeedControlButton(
                    currentSpeed: _speed,
                    onSpeedChanged: (sp) => setState(() => _speed = sp),
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: Column(
                  children: [
                    const Text(
                      'negotiation',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      '/nɪˌɡoʊ.ʃiˈeɪ.ʃən/',
                      style: TextStyle(fontFamily: 'NotoSans', fontSize: 16, color: AppColors.primaryLight),
                    ),
                    const SizedBox(height: 16),
                    IconButton(
                      iconSize: 56,
                      icon: const Icon(Icons.volume_up_rounded, color: AppColors.primary),
                      onPressed: () {},
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.darkSurface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.darkBorder),
                      ),
                      child: const Column(
                        children: [
                          Text(
                            '"The commercial contract is still under negotiation."',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 15, fontStyle: FontStyle.italic),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'المفاوضات / التداول',
                            style: TextStyle(color: AppColors.darkTextSecondary, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  const PronunciationBadge(accuracy: 88),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.mic_rounded, color: Colors.white),
                      label: const Text('Tap to Pronounce', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
