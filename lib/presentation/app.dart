import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import 'router/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '学汉字',
      theme: AppTheme.theme,
      routerConfig: router,
    );
  }
}
