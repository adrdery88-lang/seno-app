import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'injection.dart' as di;
import 'app.dart';
import 'core/debug/crash_reporter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    reportError('Flutter error', details.exceptionAsString(), details.stack);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    reportError('Dart error', error, stack);
    return true;
  };

  runZonedGuarded(
    () async {
      try {
        await di.initDependencies();
      } catch (error, stack) {
        reportError('Initialization error', error, stack);
      }
      await _readNativeCrashLog();
      runApp(const SenoApp());
    },
    (error, stack) {
      reportError('Zone error', error, stack);
    },
  );
}

Future<void> _readNativeCrashLog() async {
  try {
    const channel = MethodChannel('com.seno.app/crash');
    final report = await channel.invokeMethod<String>('takeCrashLog');
    if (report != null && report.isNotEmpty) {
      appendDiagnostic('--- Native crash on previous launch ---\n$report');
    }
  } catch (error) {
    // Ignore: native crash reporting is best-effort.
  }
}
