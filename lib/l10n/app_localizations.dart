import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi'),
  ];

  /// No description provided for @appName.
  ///
  /// In vi, this message translates to:
  /// **'Hệ Thống Tu Tiên'**
  String get appName;

  /// No description provided for @systemName.
  ///
  /// In vi, this message translates to:
  /// **'Hệ Thống Mạnh Nhất'**
  String get systemName;

  /// No description provided for @systemGreeting.
  ///
  /// In vi, this message translates to:
  /// **'Kính chào đạo hữu'**
  String get systemGreeting;

  /// No description provided for @systemGreetingWithName.
  ///
  /// In vi, this message translates to:
  /// **'Kính chào {name}'**
  String systemGreetingWithName(String name);

  /// No description provided for @systemIntroduction.
  ///
  /// In vi, this message translates to:
  /// **'Ta là Hệ Thống riêng của đạo hữu. Từ hôm nay, ta sẽ cùng đạo hữu rèn Tinh, luyện Khí, dưỡng Thần và từng bước đột phá cảnh giới.'**
  String get systemIntroduction;

  /// No description provided for @foundationReady.
  ///
  /// In vi, this message translates to:
  /// **'Nền tảng ứng dụng đã sẵn sàng'**
  String get foundationReady;

  /// No description provided for @foundationDescription.
  ///
  /// In vi, this message translates to:
  /// **'Đăng nhập và dữ liệu tu luyện sẽ được kết nối với Hệ Thống trong bước tiếp theo.'**
  String get foundationDescription;

  /// No description provided for @pillarTinh.
  ///
  /// In vi, this message translates to:
  /// **'Tinh'**
  String get pillarTinh;

  /// No description provided for @pillarKhi.
  ///
  /// In vi, this message translates to:
  /// **'Khí'**
  String get pillarKhi;

  /// No description provided for @pillarThan.
  ///
  /// In vi, this message translates to:
  /// **'Thần'**
  String get pillarThan;

  /// No description provided for @loginTitle.
  ///
  /// In vi, this message translates to:
  /// **'Hệ Thống Thức Tỉnh'**
  String get loginTitle;

  /// No description provided for @loginSubtitle.
  ///
  /// In vi, this message translates to:
  /// **'Đăng nhập để tiếp tục hành trình tu luyện với nhiệm vụ, tiến độ và cảnh giới được lưu bền vững.'**
  String get loginSubtitle;

  /// No description provided for @email.
  ///
  /// In vi, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @emailRequired.
  ///
  /// In vi, this message translates to:
  /// **'Vui lòng nhập email.'**
  String get emailRequired;

  /// No description provided for @emailInvalid.
  ///
  /// In vi, this message translates to:
  /// **'Email chưa hợp lệ.'**
  String get emailInvalid;

  /// No description provided for @password.
  ///
  /// In vi, this message translates to:
  /// **'Mật khẩu'**
  String get password;

  /// No description provided for @passwordRequired.
  ///
  /// In vi, this message translates to:
  /// **'Vui lòng nhập mật khẩu.'**
  String get passwordRequired;

  /// No description provided for @showPassword.
  ///
  /// In vi, this message translates to:
  /// **'Hiện mật khẩu'**
  String get showPassword;

  /// No description provided for @hidePassword.
  ///
  /// In vi, this message translates to:
  /// **'Ẩn mật khẩu'**
  String get hidePassword;

  /// No description provided for @signIn.
  ///
  /// In vi, this message translates to:
  /// **'Đăng nhập'**
  String get signIn;

  /// No description provided for @signingIn.
  ///
  /// In vi, this message translates to:
  /// **'Đang đăng nhập'**
  String get signingIn;

  /// No description provided for @loginInvalidCredentials.
  ///
  /// In vi, this message translates to:
  /// **'Email hoặc mật khẩu chưa đúng.'**
  String get loginInvalidCredentials;

  /// No description provided for @loginServiceUnavailable.
  ///
  /// In vi, this message translates to:
  /// **'Hệ Thống đang tạm gián đoạn. Đạo hữu vui lòng thử lại sau.'**
  String get loginServiceUnavailable;

  /// No description provided for @signOut.
  ///
  /// In vi, this message translates to:
  /// **'Đăng xuất'**
  String get signOut;

  /// No description provided for @loginFootnote.
  ///
  /// In vi, this message translates to:
  /// **'Phiên đăng nhập được lưu an toàn trên thiết bị này.'**
  String get loginFootnote;

  /// No description provided for @spiritualPower.
  ///
  /// In vi, this message translates to:
  /// **'Linh lực: {value}'**
  String spiritualPower(int value);

  /// No description provided for @settings.
  ///
  /// In vi, this message translates to:
  /// **'Thiết lập'**
  String get settings;

  /// No description provided for @appearance.
  ///
  /// In vi, this message translates to:
  /// **'Giao diện'**
  String get appearance;

  /// No description provided for @language.
  ///
  /// In vi, this message translates to:
  /// **'Ngôn ngữ'**
  String get language;

  /// No description provided for @themeSystem.
  ///
  /// In vi, this message translates to:
  /// **'Theo thiết bị'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In vi, this message translates to:
  /// **'Sáng'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In vi, this message translates to:
  /// **'Tối'**
  String get themeDark;

  /// No description provided for @vietnamese.
  ///
  /// In vi, this message translates to:
  /// **'Tiếng Việt'**
  String get vietnamese;

  /// No description provided for @english.
  ///
  /// In vi, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @retry.
  ///
  /// In vi, this message translates to:
  /// **'Thử lại'**
  String get retry;

  /// No description provided for @unknownError.
  ///
  /// In vi, this message translates to:
  /// **'Đã xảy ra lỗi. Vui lòng thử lại.'**
  String get unknownError;

  /// No description provided for @routeNotFound.
  ///
  /// In vi, this message translates to:
  /// **'Không tìm thấy màn hình này.'**
  String get routeNotFound;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
