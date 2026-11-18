import 'package:equatable/equatable.dart';

class SenoUser extends Equatable {
  final String id;
  final String displayName;
  final String email;
  final String avatarUrl;
  final int totalXp;
  final int currentStreak;
  final String preferredAccent;

  const SenoUser({
    required this.id,
    required this.displayName,
    required this.email,
    required this.avatarUrl,
    required this.totalXp,
    required this.currentStreak,
    required this.preferredAccent,
  });

  @override
  List<Object?> get props => [id, displayName, email, totalXp, currentStreak, preferredAccent];
}
