

import 'package:practice/redux/reducers/auth_reducer/auth_reducer.dart';
import 'package:practice/redux/reducers/basket_reducer/basket_reducer.dart';
import 'package:practice/redux/states/app_state.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    authState: authReducer(state.authState, action),
    basketState: basketReducer(state.basketState, action)
  );
}