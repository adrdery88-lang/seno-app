import 'dart:math';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class WaveformVisualizer extends StatelessWidget {
  final List<double> samples;
  final Color color;
  final double height;
  final bool isRecording;

  const WaveformVisualizer({
    super.key,
    required this.samples,
    this.color = AppColors.waveformNative,
    this.height = 60.0,
    this.isRecording = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: CustomPaint(
        painter: _WaveformPainter(
          samples: samples.isEmpty ? List.generate(40, (i) => 0.15 + (sin(i) * 0.1).abs()) : samples,
          color: color,
        ),
      ),
    );
  }
}

class _WaveformPainter extends CustomPainter {
  final List<double> samples;
  final Color color;

  _WaveformPainter({required this.samples, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (samples.isEmpty) return;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round;

    final spacing = size.width / samples.length;
    final centerY = size.height / 2;

    for (int i = 0; i < samples.length; i++) {
      final x = i * spacing + (spacing / 2);
      final barHeight = (samples[i].clamp(0.05, 1.0)) * (size.height / 2);
      canvas.drawLine(
        Offset(x, centerY - barHeight),
        Offset(x, centerY + barHeight),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _WaveformPainter oldDelegate) => true;
}
