import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesStore {
  PreferencesStore(this._preferences);

  static const _localeKey = 'app.locale';
  static const _themeKey = 'app.theme';
  final SharedPreferences _preferences;

  String get locale => _preferences.getString(_localeKey) ?? 'vi';

  ThemeMode get themeMode {
    final value = _preferences.getString(_themeKey);
    return ThemeMode.values.firstWhere(
      (mode) => mode.name == value,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> saveLocale(String locale) =>
      _preferences.setString(_localeKey, locale);

  Future<void> saveThemeMode(ThemeMode mode) =>
      _preferences.setString(_themeKey, mode.name);
}
