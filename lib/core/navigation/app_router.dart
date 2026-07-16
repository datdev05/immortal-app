import 'package:flutter/material.dart';
import 'package:immortal_app/l10n/app_localizations.dart';

import '../../features/home/home_screen.dart';
import '../../features/settings/settings_screen.dart';
import 'app_routes.dart';

class AppRouter {
  const AppRouter._();

  static final navigatorKey = GlobalKey<NavigatorState>();

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final name = settings.name ?? AppRoutes.home;
    if (name == AppRoutes.home) {
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
    if (name == AppRoutes.settings) {
      return MaterialPageRoute(builder: (_) => const SettingsScreen());
    }
    if (name.startsWith('${AppRoutes.quest}/')) {
      final questKey = Uri.decodeComponent(name.split('/').last);
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(title: Text(questKey)),
          body: Center(child: Text(questKey)),
        ),
      );
    }
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(child: Text(AppLocalizations.of(context).routeNotFound)),
      ),
    );
  }
}
