class AppConfig {
  const AppConfig._();

  static const apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:5014',
  );

  static const defaultLocale = 'vi';
  static const defaultTimeZone = 'Asia/Ho_Chi_Minh';
}
