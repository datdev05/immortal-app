import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:immortal_app/l10n/app_localizations.dart';

import '../core/navigation/app_router.dart';
import '../core/navigation/app_routes.dart';
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
        initialRoute: AppRoutes.home,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
