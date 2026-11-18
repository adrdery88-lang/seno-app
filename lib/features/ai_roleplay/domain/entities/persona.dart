import 'package:equatable/equatable.dart';

class Persona extends Equatable {
  final String id;
  final String name;
  final String role;
  final String scenario;
  final String personalityDescription;
  final String cefrLevelMin;
  final String cefrLevelMax;
  final String greetingMessage;

  const Persona({
    required this.id,
    required this.name,
    required this.role,
    required this.scenario,
    required this.personalityDescription,
    required this.cefrLevelMin,
    required this.cefrLevelMax,
    required this.greetingMessage,
  });

  @override
  List<Object?> get props => [id, name, role, scenario];
}
