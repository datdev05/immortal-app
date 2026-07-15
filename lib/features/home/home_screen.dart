import 'package:flutter/material.dart';
import 'package:immortal_app/l10n/app_localizations.dart';

import '../../core/navigation/app_routes.dart';
import '../../core/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(strings.systemName),
        actions: [
          IconButton(
            tooltip: strings.settings,
            onPressed: () => Navigator.pushNamed(context, AppRoutes.settings),
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
          children: [
            Text(
              strings.systemGreeting,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            Text(
              strings.systemIntroduction,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(height: 1.55),
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                Expanded(
                  child: _PillarCard(
                    label: strings.pillarTinh,
                    icon: Icons.favorite_outline,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _PillarCard(
                    label: strings.pillarKhi,
                    icon: Icons.code,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _PillarCard(
                    label: strings.pillarThan,
                    icon: Icons.menu_book_outlined,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.check_circle_outline,
                      color: AppColors.jade,
                      size: 32,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      strings.foundationReady,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(strings.foundationDescription),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PillarCard extends StatelessWidget {
  const _PillarCard({required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
      child: Column(
        children: [
          Icon(icon, color: AppColors.jade),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
        ],
      ),
    ),
  );
}
