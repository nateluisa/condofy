// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsStore on _SettingsStoreBase, Store {
  late final _$themeModeAtom =
      Atom(name: '_SettingsStoreBase.themeMode', context: context);

  @override
  ThemeMode get themeMode {
    _$themeModeAtom.reportRead();
    return super.themeMode;
  }

  @override
  set themeMode(ThemeMode value) {
    _$themeModeAtom.reportWrite(value, super.themeMode, () {
      super.themeMode = value;
    });
  }

  late final _$userEmailAtom =
      Atom(name: '_SettingsStoreBase.userEmail', context: context);

  @override
  String get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(String value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  late final _$changeThemeAsyncAction =
      AsyncAction('_SettingsStoreBase.changeTheme', context: context);

  @override
  Future<void> changeTheme(ThemeMode newThemeMode) {
    return _$changeThemeAsyncAction.run(() => super.changeTheme(newThemeMode));
  }

  late final _$setUserEmailAsyncAction =
      AsyncAction('_SettingsStoreBase.setUserEmail', context: context);

  @override
  Future<void> setUserEmail(String newEmail) {
    return _$setUserEmailAsyncAction.run(() => super.setUserEmail(newEmail));
  }

  late final _$_SettingsStoreBaseActionController =
      ActionController(name: '_SettingsStoreBase', context: context);

  @override
  void _loadTheme() {
    final _$actionInfo = _$_SettingsStoreBaseActionController.startAction(
        name: '_SettingsStoreBase._loadTheme');
    try {
      return super._loadTheme();
    } finally {
      _$_SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _loadUserEmail() {
    final _$actionInfo = _$_SettingsStoreBaseActionController.startAction(
        name: '_SettingsStoreBase._loadUserEmail');
    try {
      return super._loadUserEmail();
    } finally {
      _$_SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
themeMode: ${themeMode},
userEmail: ${userEmail}
    ''';
  }
}
