import 'package:nexpo_app_flutter/redux/auth/auth_actions.dart';
import 'package:nexpo_app_flutter/redux/auth/auth_state.dart';

authReducer(AuthState prevState, SetAuthStateAction action) {
  final payload = action.authState;
  return prevState.copyWith(
    isAuthenticating: payload.isAuthenticating,
    accessToken: payload.accessToken,
    isError: payload.isError,
  );
}
