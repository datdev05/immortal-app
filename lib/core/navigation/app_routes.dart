class AppRoutes {
  const AppRoutes._();

  static const home = '/';
  static const settings = '/settings';
  static const quest = '/quests';

  static String questDetails(String questKey) => '$quest/$questKey';
}
