// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Immortal System';

  @override
  String get systemName => 'The Strongest System';

  @override
  String get systemGreeting => 'Greetings, fellow cultivator';

  @override
  String systemGreetingWithName(String name) {
    return 'Greetings, $name';
  }

  @override
  String get systemIntroduction =>
      'I am your personal System. From today onward, I will accompany you as you cultivate Essence, Energy, and Spirit and advance through each realm.';

  @override
  String get foundationReady => 'Application foundation is ready';

  @override
  String get foundationDescription =>
      'Sign-in and cultivation data will be connected to the System in the next step.';

  @override
  String get pillarTinh => 'Essence';

  @override
  String get pillarKhi => 'Energy';

  @override
  String get pillarThan => 'Spirit';

  @override
  String get loginTitle => 'System Awakening';

  @override
  String get loginSubtitle =>
      'Sign in to continue your cultivation journey with durable quests, progress, and realm records.';

  @override
  String get email => 'Email';

  @override
  String get emailRequired => 'Enter your email.';

  @override
  String get emailInvalid => 'Enter a valid email.';

  @override
  String get password => 'Password';

  @override
  String get passwordRequired => 'Enter your password.';

  @override
  String get showPassword => 'Show password';

  @override
  String get hidePassword => 'Hide password';

  @override
  String get signIn => 'Sign in';

  @override
  String get signingIn => 'Signing in';

  @override
  String get loginInvalidCredentials => 'Email or password is incorrect.';

  @override
  String get loginServiceUnavailable =>
      'The System is temporarily unavailable. Please try again soon.';

  @override
  String get signOut => 'Sign out';

  @override
  String get loginFootnote => 'Your session is stored securely on this device.';

  @override
  String spiritualPower(int value) {
    return 'Spiritual power: $value';
  }

  @override
  String get settings => 'Settings';

  @override
  String get appearance => 'Appearance';

  @override
  String get language => 'Language';

  @override
  String get themeSystem => 'Use device setting';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get vietnamese => 'Tiếng Việt';

  @override
  String get english => 'English';

  @override
  String get retry => 'Try again';

  @override
  String get unknownError => 'Something went wrong. Please try again.';

  @override
  String get routeNotFound => 'This screen could not be found.';
}
