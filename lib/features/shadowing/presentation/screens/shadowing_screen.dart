import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/waveform_visualizer.dart';

class ShadowingScreen extends StatefulWidget {
  const ShadowingScreen({super.key});

  @override
  State<ShadowingScreen> createState() => _ShadowingScreenState();
}

class _ShadowingScreenState extends State<ShadowingScreen> {
  bool _isPlaying = false;
  bool _isRecording = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(title: const Text('Context Shadowing Mode')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Mimic the native speaker\'s rhythm & intonation:', style: TextStyle(color: AppColors.darkTextSecondary)),
              const SizedBox(height: 12),
              const Text(
                '"I completely agree with the proposed roadmap."',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 24),

              // Native Speaker Waveform
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.darkSurface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.waveformNative.withOpacity(0.4)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Native Speaker (US)', style: TextStyle(color: AppColors.waveformNative, fontWeight: FontWeight.bold)),
                        IconButton(
                          icon: Icon(_isPlaying ? Icons.pause_circle_rounded : Icons.play_circle_rounded, color: AppColors.waveformNative),
                          onPressed: () => setState(() => _isPlaying = !_isPlaying),
                        ),
                      ],
                    ),
                    const WaveformVisualizer(samples: [], color: AppColors.waveformNative, height: 50),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // User Recording Waveform
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.darkSurface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.waveformUser.withOpacity(0.4)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Your Voice Shadow', style: TextStyle(color: AppColors.waveformUser, fontWeight: FontWeight.bold)),
                        IconButton(
                          icon: Icon(_isRecording ? Icons.stop_circle_rounded : Icons.mic_rounded, color: AppColors.waveformUser),
                          onPressed: () => setState(() => _isRecording = !_isRecording),
                        ),
                      ],
                    ),
                    const WaveformVisualizer(samples: [], color: AppColors.waveformUser, height: 50),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Comparison Result Card
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.darkSurface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.secondary.withOpacity(0.3)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text('84%', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.secondary)),
                        SizedBox(height: 4),
                        Text('Rhythm Match', style: TextStyle(color: AppColors.darkTextSecondary, fontSize: 12)),
                      ],
                    ),
                    Column(
                      children: [
                        Text('79%', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.warning)),
                        SizedBox(height: 4),
                        Text('Intonation Fit', style: TextStyle(color: AppColors.darkTextSecondary, fontSize: 12)),
                      ],
                    ),
                    Column(
                      children: [
                        Text('82%', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.primaryLight)),
                        SizedBox(height: 4),
                        Text('Overall Score', style: TextStyle(color: AppColors.darkTextSecondary, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
