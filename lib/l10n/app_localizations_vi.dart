// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appName => 'Hệ Thống Tu Tiên';

  @override
  String get systemName => 'Hệ Thống Mạnh Nhất';

  @override
  String get systemGreeting => 'Kính chào đạo hữu';

  @override
  String get systemIntroduction =>
      'Ta là Hệ Thống riêng của đạo hữu. Từ hôm nay, ta sẽ cùng đạo hữu rèn Tinh, luyện Khí, dưỡng Thần và từng bước đột phá cảnh giới.';

  @override
  String get foundationReady => 'Nền tảng ứng dụng đã sẵn sàng';

  @override
  String get foundationDescription =>
      'Đăng nhập và dữ liệu tu luyện sẽ được kết nối với Hệ Thống trong bước tiếp theo.';

  @override
  String get pillarTinh => 'Tinh';

  @override
  String get pillarKhi => 'Khí';

  @override
  String get pillarThan => 'Thần';

  @override
  String get settings => 'Thiết lập';

  @override
  String get appearance => 'Giao diện';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get themeSystem => 'Theo thiết bị';

  @override
  String get themeLight => 'Sáng';

  @override
  String get themeDark => 'Tối';

  @override
  String get vietnamese => 'Tiếng Việt';

  @override
  String get english => 'English';

  @override
  String get retry => 'Thử lại';

  @override
  String get unknownError => 'Đã xảy ra lỗi. Vui lòng thử lại.';

  @override
  String get routeNotFound => 'Không tìm thấy màn hình này.';
}
