import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../core/config/app_theme.dart';
import '../core/config/router.dart';
import '../core/services/local_storage/settings_store.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsStore = GetIt.I<SettingsStore>();

    return Observer(
      builder: (_) {
        return MaterialApp.router(
          title: 'Condofy',
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: settingsStore.themeMode,
          routerConfig: router,
        );
      },
    );
  }
}