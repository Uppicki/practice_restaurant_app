import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:practice/redux/reducers/app_reducer.dart';
import 'package:practice/redux/states/app_state.dart';
import 'package:redux/redux.dart';

Widget regRedux({required Widget app}){
  return _RegRedux(widget: app);
}


class _RegRedux extends StatelessWidget {
  final Widget widget;
  const _RegRedux({required this.widget});

  @override
  Widget build(BuildContext context) {
    final store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
    );

    return StoreProvider(
        store: store,
        child: widget
    );
  }
}
