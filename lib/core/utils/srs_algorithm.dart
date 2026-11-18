import 'dart:math';

class SrsResult {
  final int repetition;
  final double easeFactor;
  final int intervalDays;
  final DateTime nextReviewDate;

  const SrsResult({
    required this.repetition,
    required this.easeFactor,
    required this.intervalDays,
    required this.nextReviewDate,
  });
}

class SrsAlgorithm {
  /// SuperMemo-2 (SM-2) Spaced Repetition Algorithm
  /// quality: 0 (total blackout) to 5 (perfect recall)
  static SrsResult calculate({
    required int quality,
    required int currentRepetition,
    required double currentEaseFactor,
    required int currentInterval,
  }) {
    int repetition = currentRepetition;
    double easeFactor = currentEaseFactor;
    int intervalDays = currentInterval;

    if (quality >= 3) {
      if (repetition == 0) {
        intervalDays = 1;
      } else if (repetition == 1) {
        intervalDays = 6;
      } else {
        intervalDays = (currentInterval * easeFactor).round();
      }
      repetition += 1;
    } else {
      repetition = 0;
      intervalDays = 1;
    }

    // Update Ease Factor
    easeFactor = easeFactor + (0.1 - (5 - quality) * (0.08 + (5 - quality) * 0.02));
    easeFactor = max(1.3, easeFactor);

    final nextReviewDate = DateTime.now().add(Duration(days: intervalDays));

    return SrsResult(
      repetition: repetition,
      easeFactor: easeFactor,
      intervalDays: intervalDays,
      nextReviewDate: nextReviewDate,
    );
  }
}
