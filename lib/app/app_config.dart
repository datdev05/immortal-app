class AppConfig {
  const AppConfig._();

  static const apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://api-immortal.tomdotnet.com',
  );
  static const apiRoutePrefix = String.fromEnvironment(
    'API_ROUTE_PREFIX',
    defaultValue: '/api/immortal',
  );

  static const defaultLocale = 'vi';
  static const defaultTimeZone = 'Asia/Ho_Chi_Minh';
}
