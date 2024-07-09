


import 'package:practice/redux/actions/auth_action/auth_action.dart';
import 'package:practice/redux/states/auth_state/auth_state.dart';
import 'package:redux/redux.dart';

final authReducer = combineReducers<AuthState>([
  TypedReducer<AuthState, AuthBack>(_returnPrevState),
  TypedReducer<AuthState, SendEmail>(_sendEmailReducer),
  TypedReducer<AuthState, StartRegistration>(_startRegistration),
  TypedReducer<AuthState, ConfirmEmail>(_sendEmailCodeReducer),
  TypedReducer<AuthState, Registration>(_registrationReducer),
]);


AuthState _returnPrevState(AuthState state, AuthBack action) {
  if (state is ConfirmEmail) {
    return const UnAuthorized(
      email: '',
      password: ''
  );
  }
  return const UnAuthorized(email: '',password: '');
}

AuthState _startRegistration(AuthState state, StartRegistration action) {
  return const EmailConfirm(email: '');
}

AuthState _sendEmailReducer(AuthState state, SendEmail action) {
  return EmailCodeConfirm(email: '');
}

AuthState _sendEmailCodeReducer(AuthState state, ConfirmEmail action) {
  return RegistrationState(
      name: '',
      email: action.email,
      password: '',
      repeatPassword: ''
  );
}

AuthState _registrationReducer(AuthState state, Registration action) {
  return UnAuthorized(email: '', password: '');
}


