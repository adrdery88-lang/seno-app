class XpCalculator {
  static int calculateLessonXp(int scorePercent) {
    if (scorePercent >= 90) return 50;
    if (scorePercent >= 70) return 35;
    if (scorePercent >= 50) return 20;
    return 10;
  }

  static int calculateGameXp(int score, String gameType) {
    switch (gameType) {
      case 'word_rush':
        return (score * 1.5).round();
      case 'sentence_builder':
        return (score * 2.0).round();
      case 'voice_escape':
        return (score * 2.5).round();
      default:
        return score;
    }
  }

  static int calculateStreakBonus(int currentStreakDays) {
    return (currentStreakDays * 5).clamp(5, 100);
  }
}
