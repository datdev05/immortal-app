import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/network/api_exception.dart';
import 'auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._repository) : super(const AuthState());

  final AuthRepository _repository;

  Future<void> restoreSession() async {
    emit(const AuthState());
    try {
      final user = await _repository.restoreSession();
      emit(
        user == null
            ? const AuthState(status: AuthStatus.unauthenticated)
            : AuthState(status: AuthStatus.authenticated, user: user),
      );
    } catch (_) {
      await _repository.signOut();
      emit(const AuthState(status: AuthStatus.unauthenticated));
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(state.copyWith(isSubmitting: true, clearError: true));
    try {
      final user = await _repository.login(email: email, password: password);
      emit(AuthState(status: AuthStatus.authenticated, user: user));
    } on ApiException catch (error) {
      emit(
        state.copyWith(
          status: AuthStatus.unauthenticated,
          errorCode: error.statusCode == 401
              ? 'invalid_credentials'
              : 'service_unavailable',
          isSubmitting: false,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: AuthStatus.unauthenticated,
          errorCode: 'unknown',
          isSubmitting: false,
        ),
      );
    }
  }

  Future<void> signOut() async {
    await _repository.signOut();
    emit(const AuthState(status: AuthStatus.unauthenticated));
  }
}
