import 'package:flutter/material.dart';
import 'core/di/injection.dart';
import 'infrastructure/database/objectbox/objectbox.dart';
import 'presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await initObjectBox();
  runApp(const App());
}
