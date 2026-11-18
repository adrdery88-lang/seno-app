import 'package:equatable/equatable.dart';

class SavedWord extends Equatable {
  final String id;
  final String word;
  final String ipa;
  final String definition;
  final String translation;
  final String example;
  final int srsIntervalDays;
  final int repetition;
  final double easeFactor;
  final DateTime nextReviewDate;

  const SavedWord({
    required this.id,
    required this.word,
    required this.ipa,
    required this.definition,
    required this.translation,
    required this.example,
    required this.srsIntervalDays,
    required this.repetition,
    required this.easeFactor,
    required this.nextReviewDate,
  });

  @override
  List<Object?> get props => [id, word, ipa, srsIntervalDays, repetition, nextReviewDate];
}
