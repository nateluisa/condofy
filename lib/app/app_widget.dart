// lib/app/app_widget.dart

import 'package:flutter/material.dart';
import '../core/config/app_theme.dart';
import '../core/config/router.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const themeMode = ThemeMode.system;

    return MaterialApp.router(
      title: 'Condofy',
      debugShowCheckedModeBanner: false,

      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeMode,

      routerConfig: router,
    );
  }
}