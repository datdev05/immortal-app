import 'package:equatable/equatable.dart';

import 'models/user_profile.dart';

enum AuthStatus { checking, unauthenticated, authenticated }

class AuthState extends Equatable {
  const AuthState({
    this.status = AuthStatus.checking,
    this.user,
    this.errorCode,
    this.isSubmitting = false,
  });

  final AuthStatus status;
  final UserProfile? user;
  final String? errorCode;
  final bool isSubmitting;

  AuthState copyWith({
    AuthStatus? status,
    UserProfile? user,
    String? errorCode,
    bool? isSubmitting,
    bool clearUser = false,
    bool clearError = false,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: clearUser ? null : user ?? this.user,
      errorCode: clearError ? null : errorCode ?? this.errorCode,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }

  @override
  List<Object?> get props => [status, user, errorCode, isSubmitting];
}
