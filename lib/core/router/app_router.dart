import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'route_names.dart';
import '../widgets/bottom_nav_shell.dart';

// Splash & Onboarding
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/onboarding/presentation/screens/welcome_screen.dart';
import '../../features/onboarding/presentation/screens/level_assessment_screen.dart';
import '../../features/onboarding/presentation/screens/assessment_result_screen.dart';
import '../../features/onboarding/presentation/screens/profile_setup_screen.dart';

// Auth
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/signup_screen.dart';

// Shell Tabs
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/curriculum/presentation/screens/curriculum_screen.dart';
import '../../features/curriculum/presentation/screens/lesson_screen.dart';
import '../../features/games/presentation/screens/games_hub_screen.dart';
import '../../features/word_vault/presentation/screens/word_vault_screen.dart';
import '../../features/word_vault/presentation/screens/srs_review_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';

// Sub-features & Games
import '../../features/games/presentation/screens/word_rush_screen.dart';
import '../../features/games/presentation/screens/sentence_builder_screen.dart';
import '../../features/games/presentation/screens/voice_escape_screen.dart';
import '../../features/ai_roleplay/presentation/screens/roleplay_menu_screen.dart';
import '../../features/ai_roleplay/presentation/screens/roleplay_chat_screen.dart';
import '../../features/snap_learn/presentation/screens/camera_scan_screen.dart';
import '../../features/shadowing/presentation/screens/shadowing_screen.dart';
import '../../features/profile/presentation/screens/settings_screen.dart';
import '../../features/profile/presentation/screens/achievements_screen.dart';
import '../../features/leaderboard/presentation/screens/leaderboard_screen.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouteNames.splash,
    routes: [
      GoRoute(
        path: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteNames.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: RouteNames.assessment,
        builder: (context, state) => const LevelAssessmentScreen(),
      ),
      GoRoute(
        path: RouteNames.assessmentResult,
        builder: (context, state) {
          final score = state.extra as int? ?? 3;
          return AssessmentResultScreen(score: score);
        },
      ),
      GoRoute(
        path: RouteNames.profileSetup,
        builder: (context, state) => const ProfileSetupScreen(),
      ),
      GoRoute(
        path: RouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteNames.signup,
        builder: (context, state) => const SignupScreen(),
      ),

      // Stateful Shell with 5 bottom navigation tabs
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => BottomNavShell(navigationShell: navigationShell),
        branches: [
          // 1. Home
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.home,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          // 2. Learn (Curriculum)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.learn,
                builder: (context, state) => const CurriculumScreen(),
              ),
            ],
          ),
          // 3. Practice (Games & AI)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.practice,
                builder: (context, state) => const GamesHubScreen(),
              ),
            ],
          ),
          // 4. Word Vault
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.vault,
                builder: (context, state) => const WordVaultScreen(),
              ),
            ],
          ),
          // 5. Profile
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.profile,
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),

      // Practice Sub-routes
      GoRoute(
        path: RouteNames.wordRush,
        builder: (context, state) => const WordRushScreen(),
      ),
      GoRoute(
        path: RouteNames.sentenceBuilder,
        builder: (context, state) => const SentenceBuilderScreen(),
      ),
      GoRoute(
        path: RouteNames.voiceEscape,
        builder: (context, state) => const VoiceEscapeScreen(),
      ),
      GoRoute(
        path: RouteNames.roleplay,
        builder: (context, state) => const RoleplayMenuScreen(),
      ),
      GoRoute(
        path: RouteNames.roleplayChat,
        builder: (context, state) {
          final personaId = state.pathParameters['personaId'] ?? 'sarah_chen';
          return RoleplayChatScreen(personaId: personaId);
        },
      ),
      GoRoute(
        path: RouteNames.snapLearn,
        builder: (context, state) => const CameraScanScreen(),
      ),
      GoRoute(
        path: RouteNames.shadowing,
        builder: (context, state) => const ShadowingScreen(),
      ),
      GoRoute(
        path: RouteNames.srsReview,
        builder: (context, state) => const SrsReviewScreen(),
      ),

      // Lesson Sub-route
      GoRoute(
        path: RouteNames.lesson,
        builder: (context, state) {
          final lessonId = state.pathParameters['lessonId'] ?? '1';
          return LessonScreen(lessonId: lessonId);
        },
      ),

      // Profile Sub-routes
      GoRoute(
        path: RouteNames.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: RouteNames.achievements,
        builder: (context, state) => const AchievementsScreen(),
      ),
      GoRoute(
        path: RouteNames.leaderboard,
        builder: (context, state) => const LeaderboardScreen(),
      ),
    ],
  );
}
