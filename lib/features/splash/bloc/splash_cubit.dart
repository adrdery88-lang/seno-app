import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {
  const SplashState();
  @override
  List<Object?> get props => [];
}

class SplashInitial extends SplashState {}
class SplashCompleted extends SplashState {
  final bool isAuthenticated;
  final bool hasAssessedLevel;
  const SplashCompleted({required this.isAuthenticated, required this.hasAssessedLevel});
  @override
  List<Object?> get props => [isAuthenticated, hasAssessedLevel];
}

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void initSplash() async {
    // 2.5s animated intro duration
    await Future.delayed(const Duration(milliseconds: 2500));
    // Check onboarding / auth cache (default to false for first run)
    emit(const SplashCompleted(isAuthenticated: false, hasAssessedLevel: false));
  }
}
