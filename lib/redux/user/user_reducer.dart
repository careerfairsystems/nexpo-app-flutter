import 'package:nexpo_app_flutter/redux/user/user_actions.dart';
import 'package:nexpo_app_flutter/redux/user/user_state.dart';

userReducer(UserState prevState, SetUserStateAction action) {
  final payload = action.userState;
  return prevState.copyWith(
    isLoading: payload.isLoading,
    isError: payload.isError,
    user: payload.user,
  );
}
