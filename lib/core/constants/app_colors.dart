import 'package:flutter/material.dart';

class AppColors {
  // Brand Colors (Seno)
  static const Color primary = Color(0xFF6C63FF);
  static const Color primaryDark = Color(0xFF5A52D5);
  static const Color primaryLight = Color(0xFF8B84FF);

  // Gamification & Status
  static const Color secondary = Color(0xFF00D9A6); // Success / Correct
  static const Color accent = Color(0xFFFF6B6B);    // Error / Streak Fire
  static const Color warning = Color(0xFFFFB800);   // Review due / Caution
  static const Color xpGold = Color(0xFFFFD700);    // XP & Badges
  static const Color info = Color(0xFF00B2FE);

  // Dark Mode Palette (Default)
  static const Color darkBackground = Color(0xFF0D0D1A);
  static const Color darkSurface = Color(0xFF1A1A2E);
  static const Color darkCard = Color(0xFF222238);
  static const Color darkBorder = Color(0xFF2E2E48);
  static const Color darkTextPrimary = Color(0xFFEAEAEF);
  static const Color darkTextSecondary = Color(0xFF8888A0);

  // Light Mode Palette
  static const Color lightBackground = Color(0xFFF6F7FB);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightBorder = Color(0xFFE2E4EC);
  static const Color lightTextPrimary = Color(0xFF1A1A2E);
  static const Color lightTextSecondary = Color(0xFF6B6B80);

  // Audio & Waveform Colors
  static const Color waveformNative = Color(0xFF00B2FE);
  static const Color waveformUser = Color(0xFF00D9A6);
}
