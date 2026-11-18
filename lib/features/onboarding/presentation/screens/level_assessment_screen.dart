import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/widgets/animated_progress_ring.dart';

class LevelAssessmentScreen extends StatefulWidget {
  const LevelAssessmentScreen({super.key});

  @override
  State<LevelAssessmentScreen> createState() => _LevelAssessmentScreenState();
}

class _LevelAssessmentScreenState extends State<LevelAssessmentScreen> {
  int _currentIndex = 0;
  int _score = 0;
  int? _selectedOption;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Choose the correct greeting for the morning:',
      'options': ['Good night', 'Good morning', 'Good afternoon', 'Goodbye'],
      'correct': 1,
    },
    {
      'question': 'She ______ to school every day by bus.',
      'options': ['go', 'goes', 'going', 'gone'],
      'correct': 1,
    },
    {
      'question': 'Yesterday, they ______ delicious pizza at the Italian restaurant.',
      'options': ['eats', 'eating', 'ate', 'eaten'],
      'correct': 2,
    },
    {
      'question': 'What is the opposite of "generous"?',
      'options': ['Selfish', 'Kind', 'Polite', 'Brave'],
      'correct': 0,
    },
    {
      'question': 'If I ______ more time, I would travel around the world.',
      'options': ['have', 'had', 'will have', 'would have'],
      'correct': 1,
    },
  ];

  void _answer(int index) {
    setState(() {
      _selectedOption = index;
      if (index == _questions[_currentIndex]['correct']) {
        _score++;
      }
    });

    Future.delayed(const Duration(milliseconds: 400), () {
      if (_currentIndex < _questions.length - 1) {
        setState(() {
          _currentIndex++;
          _selectedOption = null;
        });
      } else {
        context.go(RouteNames.assessmentResult, extra: _score);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final q = _questions[_currentIndex];
    final progress = (_currentIndex + 1) / _questions.length;

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        title: const Text('Level Assessment'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                '${_currentIndex + 1}/${_questions.length}',
                style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearProgressIndicator(
                value: progress,
                backgroundColor: AppColors.darkBorder,
                valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                minHeight: 6,
                borderRadius: BorderRadius.circular(4),
              ),
              const SizedBox(height: 36),
              Text(
                'Question ${_currentIndex + 1}',
                style: const TextStyle(color: AppColors.darkTextSecondary, fontSize: 14),
              ),
              const SizedBox(height: 8),
              Text(
                q['question'] as String,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkTextPrimary,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 32),
              ...List.generate((q['options'] as List).length, (i) {
                final option = q['options'][i] as String;
                final isSelected = _selectedOption == i;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 14.0),
                  child: InkWell(
                    onTap: _selectedOption == null ? () => _answer(i) : null,
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.primary.withOpacity(0.2) : AppColors.darkSurface,
                        border: Border.all(
                          color: isSelected ? AppColors.primary : AppColors.darkBorder,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        option,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                          color: isSelected ? AppColors.primaryLight : AppColors.darkTextPrimary,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
