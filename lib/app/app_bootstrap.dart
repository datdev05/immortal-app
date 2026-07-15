import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/network/api_client.dart';
import '../core/notifications/notification_service.dart';
import '../core/storage/preferences_store.dart';
import '../core/storage/token_storage.dart';
import 'app.dart';
import 'app_cubit.dart';

class AppBootstrap {
  const AppBootstrap._();

  static Future<Widget> create() async {
    final preferences = PreferencesStore(await SharedPreferences.getInstance());
    const tokenStorage = SecureTokenStorage();
    final apiClient = ApiClient(tokenStorage: tokenStorage);
    final notificationService = NotificationService();
    await notificationService.initialize();

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<PreferencesStore>.value(value: preferences),
        RepositoryProvider<TokenStorage>.value(value: tokenStorage),
        RepositoryProvider<ApiClient>.value(value: apiClient),
        RepositoryProvider<NotificationService>.value(
          value: notificationService,
        ),
      ],
      child: BlocProvider(
        create: (_) => AppCubit(preferences)..restore(),
        child: const ImmortalApp(),
      ),
    );
  }
}
