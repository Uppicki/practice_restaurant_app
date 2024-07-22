



import 'package:decimal/decimal.dart';
import 'package:practice/redux/states/auth_state/auth_state.dart';
import 'package:practice/redux/states/basket_state/basket_state.dart';

class AppState {
  AuthState authState;
  BasketState basketState;

  AppState({required this.authState, required this.basketState});

  factory AppState.initial() => AppState(
    authState: const AuthState.initial(
      email: '',
      password: ''
    ),
    basketState: const BasketState.initial()
  );

}