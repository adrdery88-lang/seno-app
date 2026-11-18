import 'package:flutter/material.dart';
import 'injection.dart' as di;
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize service locator & dependencies
  await di.initDependencies();

  runApp(const SenoApp());
}
