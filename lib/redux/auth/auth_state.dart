import 'package:meta/meta.dart';

@immutable
class AuthState {
  final bool isAuthenticating;
  final String accessToken;
  final bool isError;

  AuthState({
    this.isAuthenticating,
    this.accessToken,
    this.isError,
  });

  factory AuthState.initial() => AuthState(
        isAuthenticating: false,
        accessToken: "",
        isError: false,
      );

  AuthState copyWith({
    @required bool isAuthenticating,
    @required String accessToken,
    @required bool isError,
  }) {
    return AuthState(
      isAuthenticating: isAuthenticating ?? this.isAuthenticating,
      accessToken: accessToken ?? this.accessToken,
      isError: isError ?? this.isError,
    );
  }
}
