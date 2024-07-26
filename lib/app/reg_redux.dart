import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:practice/redux/reducers/app_reducer.dart';
import 'package:practice/redux/states/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

Widget regRedux({required Widget app, required Store<AppState> store}){
  return _RegRedux(widget: app, store: store);
}


class _RegRedux extends StatelessWidget {
  final Widget widget;
  final Store<AppState> store;
  const _RegRedux({required this.widget, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: widget
    );
  }
}
