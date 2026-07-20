import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:immortal_app/l10n/app_localizations.dart';

import '../core/navigation/app_router.dart';
import '../core/widgets/app_loading_view.dart';
import '../features/auth/auth_cubit.dart';
import '../features/auth/auth_state.dart';
import '../features/auth/login_screen.dart';
import '../features/home/home_screen.dart';
import '../core/theme/app_theme.dart';
import 'app_cubit.dart';
import 'app_state.dart';

class ImmortalApp extends StatelessWidget {
  const ImmortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hệ Thống Tu Tiên',
        locale: state.locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: state.themeMode,
        navigatorKey: AppRouter.navigatorKey,
        home: const _SessionGate(),
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}

class _SessionGate extends StatelessWidget {
  const _SessionGate();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return switch (state.status) {
          AuthStatus.checking => const Scaffold(body: AppLoadingView()),
          AuthStatus.authenticated => const HomeScreen(),
          AuthStatus.unauthenticated => const LoginScreen(),
        };
      },
    );
  }
}
