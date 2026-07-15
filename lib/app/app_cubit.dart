import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/storage/preferences_store.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(this._preferences) : super(const AppState());

  final PreferencesStore _preferences;

  void restore() {
    emit(
      AppState(
        locale: Locale(_preferences.locale),
        themeMode: _preferences.themeMode,
      ),
    );
  }

  Future<void> changeLocale(Locale locale) async {
    await _preferences.saveLocale(locale.languageCode);
    emit(state.copyWith(locale: locale));
  }

  Future<void> changeTheme(ThemeMode mode) async {
    await _preferences.saveThemeMode(mode);
    emit(state.copyWith(themeMode: mode));
  }
}
