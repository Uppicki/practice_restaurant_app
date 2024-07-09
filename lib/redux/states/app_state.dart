



import 'package:practice/redux/states/auth_state/auth_state.dart';

class AppState {
  AuthState authState;

  AppState({required this.authState});

  factory AppState.initial() => AppState(
    authState: const AuthState.initial(
      email: '',
      password: ''
    ),
  );

}