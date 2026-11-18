import 'package:equatable/equatable.dart';

enum SenoLevel {
  beginner('Absolute Beginner', 'Pre-A1', 1),
  elementary('Elementary', 'A1-A2', 2),
  intermediate('Intermediate', 'B1-B2', 3),
  advanced('Advanced & Mastery', 'C1-C2', 4);

  final String label;
  final String cefr;
  final int order;
  const SenoLevel(this.label, this.cefr, this.order);
}

class AssessmentResult extends Equatable {
  final int score;
  final int totalQuestions;
  final SenoLevel recommendedLevel;
  final DateTime completedAt;

  const AssessmentResult({
    required this.score,
    required this.totalQuestions,
    required this.recommendedLevel,
    required this.completedAt,
  });

  @override
  List<Object?> get props => [score, totalQuestions, recommendedLevel, completedAt];
}
