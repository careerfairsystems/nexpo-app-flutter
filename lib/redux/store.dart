import 'package:meta/meta.dart';
import 'package:nexpo_app_flutter/redux/auth/auth_actions.dart';
import 'package:nexpo_app_flutter/redux/auth/auth_reducer.dart';
import 'package:redux/redux.dart';
import 'package:nexpo_app_flutter/redux/user/user_actions.dart';
import 'package:nexpo_app_flutter/redux/user/user_reducer.dart';
import 'package:nexpo_app_flutter/redux/user/user_state.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'auth/auth_state.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is SetUserStateAction) {
    final nextUserState = userReducer(state.userState, action);

    return state.copyWith(userState: nextUserState);
  } else if (action is SetAuthStateAction) {
    final nextAuthState = authReducer(state.authState, action);

    return state.copyWith(authState: nextAuthState);
  }

  return state;
}

@immutable
class AppState {
  final UserState userState;
  final AuthState authState;

  AppState({
    @required this.userState,
    @required this.authState,
  });

  AppState copyWith({
    UserState userState,
    AuthState authState,
  }) {
    return AppState(
      userState: userState ?? this.userState,
      authState: authState ?? this.authState,
    );
  }
}

class Redux {
  static Store<AppState> _store;

  static Store<AppState> get store {
    if (_store == null) {
      throw Exception("store is not initialized");
    } else {
      return _store;
    }
  }

  static Future<void> init() async {
    final postsStateInitial = UserState.initial();
    final authStateInitial = AuthState.initial();

    _store = Store<AppState>(
      appReducer,
      middleware: [thunkMiddleware],
      initialState: AppState(
        userState: postsStateInitial,
        authState: authStateInitial,
      ),
    );
  }
}
