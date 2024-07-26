



import 'package:flutter/material.dart';
import 'package:practice/app/init_api_client.dart';
import 'package:practice/app/reg_redux.dart';
import 'package:practice/app/reg_router.dart';
import 'package:practice/redux/reducers/app_reducer.dart';
import 'package:practice/redux/states/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

Widget initApp() {
  WidgetsFlutterBinding.ensureInitialized();
  final store = Store<AppState>(
      appReducer,
      initialState: AppState.initial(),
      middleware: [
        thunkMiddleware,
      ]
  );

  initApiClient(store: store);

  Widget app = const RegRouter();
  app = regRedux(app: app, store: store);

  return app;
}
