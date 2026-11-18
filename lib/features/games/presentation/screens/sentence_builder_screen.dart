import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class SentenceBuilderScreen extends StatefulWidget {
  const SentenceBuilderScreen({super.key});

  @override
  State<SentenceBuilderScreen> createState() => _SentenceBuilderScreenState();
}

class _SentenceBuilderScreenState extends State<SentenceBuilderScreen> {
  final List<String> _targetWords = ['She', 'has', 'lived', 'in', 'London', 'since', '2020'];
  final List<String> _availableWords = ['since', 'lived', 'She', '2020', 'has', 'in', 'London'];
  final List<String> _assembledWords = [];
  bool? _isCorrect;

  void _addWord(String w) {
    setState(() {
      _assembledWords.add(w);
      _availableWords.remove(w);
      _isCorrect = null;
    });
  }

  void _removeWord(String w) {
    setState(() {
      _assembledWords.remove(w);
      _availableWords.add(w);
      _isCorrect = null;
    });
  }

  void _check() {
    setState(() {
      _isCorrect = _assembledWords.join(' ') == _targetWords.join(' ');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(title: const Text('Sentence Builder')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Arrange the words in the correct order:', style: TextStyle(color: AppColors.darkTextSecondary, fontSize: 14)),
              const SizedBox(height: 24),

              // Assembly Area
              Container(
                minHeight: 120,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.darkSurface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: _isCorrect == null
                        ? AppColors.darkBorder
                        : (_isCorrect! ? AppColors.secondary : AppColors.accent),
                    width: 2,
                  ),
                ),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _assembledWords.map((w) {
                    return InkWell(
                      onTap: () => _removeWord(w),
                      child: Chip(
                        label: Text(w, style: const TextStyle(fontWeight: FontWeight.bold)),
                        backgroundColor: AppColors.primary,
                        deleteIconColor: Colors.white,
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 32),
              const Text('Available Words:', style: TextStyle(color: AppColors.darkTextSecondary, fontSize: 14)),
              const SizedBox(height: 12),

              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: _availableWords.map((w) {
                  return ActionChip(
                    label: Text(w, style: const TextStyle(color: Colors.white)),
                    backgroundColor: AppColors.darkCard,
                    side: const BorderSide(color: AppColors.darkBorder),
                    onPressed: () => _addWord(w),
                  );
                }).toList(),
              ),

              const Spacer(),
              if (_isCorrect != null)
                Text(
                  _isCorrect! ? '🎉 Correct sentence structure!' : '❌ Incorrect order. Try again!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: _isCorrect! ? AppColors.secondary : AppColors.accent,
                  ),
                ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _assembledWords.isNotEmpty ? _check : null,
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondary),
                  child: const Text('Check Sentence', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
