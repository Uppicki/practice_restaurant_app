


import 'package:practice/redux/actions/auth_action/auth_action.dart';
import 'package:practice/redux/states/auth_state/auth_state.dart';
import 'package:redux/redux.dart';

final authReducer = combineReducers<AuthState>([
  TypedReducer<AuthState, AuthBack>(_returnPrevState),
  TypedReducer<AuthState, SendEmail>(_sendEmailReducer),
  TypedReducer<AuthState, StartRegistration>(_startRegistration),
  TypedReducer<AuthState, EmailConfirmAction>(_sendEmailCodeReducer),
  TypedReducer<AuthState, RegistrationAction>(_registrationReducer),
  TypedReducer<AuthState, ReturnErrorAction>(_returnErrorReducer),
  TypedReducer<AuthState, AuthorizationAction>(_authReducer),
  TypedReducer<AuthState, LogoutAction>(_logoutReducer)
]);


AuthState _logoutReducer(AuthState state, LogoutAction action) {
  return UnAuthorized(email: '', password: '');
}


AuthState _authReducer(AuthState state, AuthorizationAction action){
  return Authorized(
      email: action.email,
      accessToken: action.accessToken,
      refreshToken: action.refreshToken
  );
}


AuthState _returnPrevState(AuthState state, AuthBack action) {
  return state.map(
      initial: (state) => state, 
      emailCodeConfirm: (state) => EmailConfirm(email: state.email), 
      emailConfirm: (state) => const UnAuthorized(email: '', password: ''), 
      registration: (state) => EmailConfirm(email: state.email),
      authorize: (state) => state
  );
}

AuthState _startRegistration(AuthState state, StartRegistration action) {
  return const EmailConfirm(email: '');
}

AuthState _sendEmailReducer(AuthState state, SendEmail action) {
  return EmailCodeConfirm(email: action.email);
}

AuthState _sendEmailCodeReducer(AuthState state, EmailConfirmAction action) {
  return RegistrationState(
      name: '',
      email: action.email,
      password: '',
      repeatPassword: '',
      secondName: ''
  );
}

AuthState _registrationReducer(AuthState state, RegistrationAction action) {
  return UnAuthorized(email: '', password: '');
}


AuthState _returnErrorReducer(AuthState state, ReturnErrorAction action) {
  return state.map(
      initial: (state) =>
          state.copyWith(error: action.error),
      emailCodeConfirm: (state) =>
        state.copyWith(error: action.error),
      emailConfirm: (state) =>
          state.copyWith(error: action.error),
      registration: (state) =>
          state.copyWith(error: action.error),
      authorize: (state) => state.copyWith()
  );
}
