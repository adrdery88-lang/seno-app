import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/debug/crash_reporter.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'features/splash/bloc/splash_cubit.dart';

class SenoApp extends StatelessWidget {
  const SenoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(create: (_) => SplashCubit()),
      ],
      child: ValueListenableBuilder<String?>(
        valueListenable: crashReport,
        builder: (context, report, child) {
          return Stack(
            children: [
              child!,
              if (report != null)
                Material(
                  color: const Color(0xEE000000),
                  child: SafeArea(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: SelectableText(
                        'Seno diagnostic report\n\n$report',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
        child: MaterialApp.router(
          title: 'Seno — English Learning',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme(),
          darkTheme: AppTheme.darkTheme(),
          themeMode: ThemeMode.dark, // Dark mode default as specified
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
