class RouteNames {
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String login = '/auth/login';
  static const String signup = '/auth/signup';
  static const String assessment = '/onboarding/assessment';
  static const String assessmentResult = '/onboarding/result';
  static const String profileSetup = '/onboarding/profile-setup';

  static const String home = '/home';
  static const String learn = '/learn';
  static const String levelDetail = '/learn/level/:levelId';
  static const String lesson = '/learn/lesson/:lessonId';

  static const String practice = '/practice';
  static const String wordRush = '/practice/word-rush';
  static const String sentenceBuilder = '/practice/sentence-builder';
  static const String voiceEscape = '/practice/voice-escape';
  static const String roleplay = '/practice/roleplay';
  static const String roleplayChat = '/practice/roleplay/:personaId';
  static const String snapLearn = '/practice/snap-learn';
  static const String shadowing = '/practice/shadowing';

  static const String vault = '/vault';
  static const String wordDetail = '/vault/word/:wordId';
  static const String srsReview = '/vault/review';

  static const String profile = '/profile';
  static const String settings = '/profile/settings';
  static const String achievements = '/profile/achievements';
  static const String leaderboard = '/profile/leaderboard';
}
