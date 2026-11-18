import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure([String message = 'Server Error occurred']) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure([String message = 'Cache/Local Storage Error occurred']) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure([String message = 'No internet connection detected']) : super(message);
}

class SpeechFailure extends Failure {
  const SpeechFailure([String message = 'Speech recognition or synthesis error']) : super(message);
}

class AIFailure extends Failure {
  const AIFailure([String message = 'AI persona engine processing error']) : super(message);
}

class PermissionFailure extends Failure {
  const PermissionFailure([String message = 'Required permission was denied']) : super(message);
}
