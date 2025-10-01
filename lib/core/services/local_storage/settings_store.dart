import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'local_storage_service.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStoreBase with _$SettingsStore;

abstract class _SettingsStoreBase with Store {
  final ILocalStorageService _storage;

  _SettingsStoreBase(this._storage) {
    _loadTheme();
    _loadUserEmail();
  }

  @observable
  ThemeMode themeMode = ThemeMode.system;

  @observable
  String userEmail = '';

  @action
  void _loadTheme() {
    final savedTheme = _storage.getString('theme_mode');
    if (savedTheme == 'light') {
      themeMode = ThemeMode.light;
    } else if (savedTheme == 'dark') {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.system;
    }
  }

  @action
  void _loadUserEmail() {
    userEmail = _storage.getString('user_email');
  }

  @action
  Future<void> changeTheme(ThemeMode newThemeMode) async {
    themeMode = newThemeMode;
    await _storage.setString('theme_mode', newThemeMode.name);
  }

  @action
  Future<void> setUserEmail(String newEmail) async {
    userEmail = newEmail;
    await _storage.setString('user_email', newEmail);
  }
}