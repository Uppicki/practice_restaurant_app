import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:practice/redux/actions/auth_action/auth_action.dart';
import 'package:practice/redux/states/app_state.dart';
import 'package:practice/redux/states/auth_state/auth_state.dart';

class ProfileFragment extends StatelessWidget {

  const ProfileFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              store.dispatch(LogoutAction());
            },
            child: Text('Выйти')
        ),
      ),
    );
  }
}
