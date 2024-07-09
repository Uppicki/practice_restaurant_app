


import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:practice/redux/actions/auth_action/auth_action.dart';
import 'package:practice/redux/states/app_state.dart';
import 'package:practice/redux/states/auth_state/auth_state.dart';

class LoginFragment extends StatelessWidget {
  final UnAuthorized state;
  const LoginFragment({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Вход')),
      body: Column(
        children: [
          TextField(),
          TextField(),
          ElevatedButton(
            onPressed: () {
              store.dispatch(const StartRegistration());
            },
            child: Text('Регистрация'),
          ),
          ElevatedButton(
              onPressed: () {},
              child: Text('Войти'),
          ),
        ],
      ),
    );
  }
}
