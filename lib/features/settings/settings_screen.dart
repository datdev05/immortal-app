import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:immortal_app/l10n/app_localizations.dart';

import '../../app/app_cubit.dart';
import '../../app/app_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(strings.settings)),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) => ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              strings.language,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            RadioGroup<String>(
              groupValue: state.locale.languageCode,
              onChanged: (value) {
                if (value != null) {
                  context.read<AppCubit>().changeLocale(Locale(value));
                }
              },
              child: Column(
                children: [
                  RadioListTile(value: 'vi', title: Text(strings.vietnamese)),
                  RadioListTile(value: 'en', title: Text(strings.english)),
                ],
              ),
            ),
            const Divider(height: 32),
            Text(
              strings.appearance,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            RadioGroup<ThemeMode>(
              groupValue: state.themeMode,
              onChanged: (value) {
                if (value != null) context.read<AppCubit>().changeTheme(value);
              },
              child: Column(
                children: [
                  RadioListTile(
                    value: ThemeMode.system,
                    title: Text(strings.themeSystem),
                  ),
                  RadioListTile(
                    value: ThemeMode.light,
                    title: Text(strings.themeLight),
                  ),
                  RadioListTile(
                    value: ThemeMode.dark,
                    title: Text(strings.themeDark),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
