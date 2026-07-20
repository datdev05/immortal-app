import '../../core/network/api_client.dart';
import '../../core/storage/token_storage.dart';
import 'models/user_profile.dart';

class AuthRepository {
  AuthRepository({required this.apiClient, required this.tokenStorage});

  final ApiClient apiClient;
  final TokenStorage tokenStorage;

  Future<UserProfile?> restoreSession() async {
    final token = await tokenStorage.readAccessToken();
    if (token == null || token.isEmpty) {
      return null;
    }

    final response = await apiClient.get('/api/auth/me');
    return UserProfile.fromJson(response);
  }

  Future<UserProfile> login({
    required String email,
    required String password,
  }) async {
    final response = await apiClient.post(
      '/api/auth/login',
      data: <String, String>{'email': email, 'password': password},
    );
    final accessToken = response['accessToken']?.toString();
    if (accessToken == null || accessToken.isEmpty) {
      throw const FormatException(
        'Login response did not include an access token.',
      );
    }

    await tokenStorage.saveAccessToken(accessToken);
    final user = response['user'];
    if (user is Map<String, dynamic>) {
      return UserProfile.fromJson(user);
    }
    if (user is Map) {
      return UserProfile.fromJson(Map<String, dynamic>.from(user));
    }

    return restoreSession().then((value) {
      if (value == null) {
        throw const FormatException('Login response did not include a user.');
      }
      return value;
    });
  }

  Future<void> signOut() => tokenStorage.clear();
}
