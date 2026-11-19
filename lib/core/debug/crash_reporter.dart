import 'package:flutter/foundation.dart';

/// Holds diagnostic messages so they can be displayed on screen in release
/// builds where logcat is not available to the user.
final ValueNotifier<String?> crashReport = ValueNotifier<String?>(null);

void reportError(String title, Object error, StackTrace? stack) {
  final buffer = StringBuffer(crashReport.value ?? '');
  if (buffer.isNotEmpty) {
    buffer.writeln();
  }
  buffer.writeln('--- $title ---');
  buffer.writeln(error.toString());
  if (stack != null) {
    buffer.writeln(stack.toString());
  }
  crashReport.value = buffer.toString();
}

void appendDiagnostic(String text) {
  final buffer = StringBuffer(crashReport.value ?? '');
  if (buffer.isNotEmpty) {
    buffer.writeln();
  }
  buffer.writeln(text);
  crashReport.value = buffer.toString();
}
