import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:immortal_app/app/app.dart';
import 'package:immortal_app/app/app_cubit.dart';
import 'package:immortal_app/features/auth/auth_cubit.dart';
import 'package:immortal_app/features/auth/auth_repository.dart';
import 'package:immortal_app/features/auth/models/user_profile.dart';
import 'package:immortal_app/core/network/api_client.dart';
import 'package:immortal_app/core/storage/preferences_store.dart';
import 'package:immortal_app/core/storage/token_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('shows the Vietnamese login screen when signed out', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    final preferences = PreferencesStore(await SharedPreferences.getInstance());

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AppCubit(preferences)..restore()),
          BlocProvider(
            create: (_) =>
                AuthCubit(_FakeAuthRepository(restoredUser: null))
                  ..restoreSession(),
          ),
        ],
        child: const ImmortalApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Hệ Thống Thức Tỉnh'), findsOneWidget);
    expect(find.text('Đăng nhập'), findsOneWidget);
  });

  testWidgets('shows the Vietnamese-first cultivation shell when signed in', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    final preferences = PreferencesStore(await SharedPreferences.getInstance());

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AppCubit(preferences)..restore()),
          BlocProvider(
            create: (_) =>
                AuthCubit(_FakeAuthRepository(restoredUser: _user))
                  ..restoreSession(),
          ),
        ],
        child: const ImmortalApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Kính chào đạo hữu'), findsOneWidget);
    expect(find.text('Tinh'), findsOneWidget);
    expect(find.text('Khí'), findsOneWidget);
    expect(find.text('Thần'), findsOneWidget);
  });
}

const _user = UserProfile(
  id: 'user-1',
  email: 'dao.huu@example.com',
  displayName: '',
  path: '',
  motto: '',
  spiritualPower: 0,
  gender: '',
);

class _FakeAuthRepository extends AuthRepository {
  _FakeAuthRepository({required this.restoredUser})
    : super(
        apiClient: ApiClient(tokenStorage: const _NoopTokenStorage()),
        tokenStorage: const _NoopTokenStorage(),
      );

  final UserProfile? restoredUser;

  @override
  Future<UserProfile?> restoreSession() async => restoredUser;
}

class _NoopTokenStorage implements TokenStorage {
  const _NoopTokenStorage();

  @override
  Future<void> clear() async {}

  @override
  Future<String?> readAccessToken() async => null;

  @override
  Future<void> saveAccessToken(String token) async {}
}
