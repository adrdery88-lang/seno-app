class AudioUtils {
  static String resolveVoiceTag(String accent) {
    return accent.toUpperCase() == 'UK' ? 'en-GB' : 'en-US';
  }

  static double resolveSpeechRate(double speed) {
    return speed <= 0.7 ? 0.6 : 1.0;
  }
}
