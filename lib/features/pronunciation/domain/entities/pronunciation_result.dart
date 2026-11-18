import 'package:equatable/equatable.dart';

class WordPhoneticEvaluation extends Equatable {
  final String word;
  final bool isAccurate;
  final double confidence; // 0.0 - 1.0

  const WordPhoneticEvaluation({
    required this.word,
    required this.isAccurate,
    required this.confidence,
  });

  @override
  List<Object?> get props => [word, isAccurate, confidence];
}

class PronunciationResult extends Equatable {
  final String targetText;
  final String recognizedText;
  final double accuracyScore; // 0.0 - 100.0
  final List<WordPhoneticEvaluation> wordEvaluations;
  final String phoneticTip;

  const PronunciationResult({
    required this.targetText,
    required this.recognizedText,
    required this.accuracyScore,
    required this.wordEvaluations,
    required this.phoneticTip,
  });

  @override
  List<Object?> get props => [targetText, recognizedText, accuracyScore, wordEvaluations, phoneticTip];
}
