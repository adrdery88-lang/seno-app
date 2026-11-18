import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      child: MaterialApp.router(
        title: 'Seno — English Learning',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme(),
        darkTheme: AppTheme.darkTheme(),
        themeMode: ThemeMode.dark, // Dark mode default as specified
        routerConfig: AppRouter.router,
      ),
    );
  }
}
