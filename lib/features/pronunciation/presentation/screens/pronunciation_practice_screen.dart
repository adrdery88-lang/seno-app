import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/accent_toggle_button.dart';
import '../../../../core/widgets/pronunciation_badge.dart';
import '../../../../core/widgets/speed_control_button.dart';
import '../../../../core/widgets/waveform_visualizer.dart';

class PronunciationPracticeScreen extends StatefulWidget {
  const PronunciationPracticeScreen({super.key});

  @override
  State<PronunciationPracticeScreen> createState() => _PronunciationPracticeScreenState();
}

class _PronunciationPracticeScreenState extends State<PronunciationPracticeScreen> {
  String _accent = 'US';
  double _speed = 1.0;
  bool _isRecording = false;
  double _score = 86.0;

  final String _targetPhrase = "Good communication leads to great opportunities.";
  final List<Map<String, dynamic>> _wordFeedback = [
    {'word': 'Good', 'accurate': true},
    {'word': 'communication', 'accurate': false, 'tip': 'Stress the fourth syllable: /keɪ/'},
    {'word': 'leads', 'accurate': true},
    {'word': 'to', 'accurate': true},
    {'word': 'great', 'accurate': true},
    {'word': 'opportunities.', 'accurate': true},
  ];

  void _toggleRecord() {
    setState(() => _isRecording = !_isRecording);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(title: const Text('AI Speech Coach')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              const SizedBox(height: 36),
              const Text('Target Sentence:', style: TextStyle(color: AppColors.darkTextSecondary, fontSize: 14)),
              const SizedBox(height: 12),
              Text(
                _targetPhrase,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 28),

              // Syllable/Word color-coded analysis
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 8,
                children: _wordFeedback.map((item) {
                  final accurate = item['accurate'] as bool;
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: accurate ? AppColors.secondary.withOpacity(0.15) : AppColors.accent.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: accurate ? AppColors.secondary : AppColors.accent,
                        width: 1.2,
                      ),
                    ),
                    child: Text(
                      item['word'] as String,
                      style: TextStyle(
                        color: accurate ? AppColors.secondary : AppColors.accent,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 24),
              PronunciationBadge(accuracy: _score, size: 40),

              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.darkSurface,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.darkBorder),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.lightbulb_outline_rounded, color: AppColors.warning, size: 20),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Tip: On "communication", place more emphasis and vocal weight on the second-to-last syllable: /keɪ/.',
                        style: TextStyle(color: AppColors.darkTextSecondary, fontSize: 13, height: 1.3),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),
              WaveformVisualizer(
                samples: _isRecording ? List.generate(40, (i) => (i % 7) * 0.12 + 0.1) : const [],
                isRecording: _isRecording,
                color: _isRecording ? AppColors.accent : AppColors.waveformNative,
              ),
              const SizedBox(height: 24),

              GestureDetector(
                onTap: _toggleRecord,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: _isRecording ? AppColors.accent : AppColors.primary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: (_isRecording ? AppColors.accent : AppColors.primary).withOpacity(0.4),
                        blurRadius: 20,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: Icon(
                    _isRecording ? Icons.stop_rounded : Icons.mic_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _isRecording ? 'Listening... Tap to evaluate' : 'Tap mic and speak naturally',
                style: const TextStyle(color: AppColors.darkTextSecondary, fontSize: 13),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
