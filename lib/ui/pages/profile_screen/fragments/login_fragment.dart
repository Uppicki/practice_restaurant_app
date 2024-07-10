


import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:practice/redux/actions/auth_action/auth_action.dart';
import 'package:practice/redux/states/app_state.dart';
import 'package:practice/redux/states/auth_state/auth_state.dart';
import 'package:practice/redux/thunk_actions/auth_thunk_action.dart';
import 'package:practice/ui/fields/password_field.dart';
import 'package:redux/redux.dart';

class LoginFragment extends StatefulWidget {
  LoginFragment({super.key});

  @override
  State<LoginFragment> createState() => _LoginFragmentState();
}

class _LoginFragmentState extends State<LoginFragment> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late Store<AppState> store;
  late UnAuthorized _state;

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void didUpdateWidget(covariant LoginFragment oldWidget) {
    _state = store.state.authState as UnAuthorized;

    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store = StoreProvider.of<AppState>(context);
    _state = store.state.authState as UnAuthorized;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Вход')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Ввeдите Email'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: PasswordField(
                  controller: passwordController,
                  labelText: 'Введите пароль',
                ),
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      store.dispatch(const StartRegistration());
                    },
                    child: Text('Регистрация'),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => store.dispatch(
                        login(
                            email: emailController.text,
                            password: passwordController.text
                        )
                    ),
                    child: Text('Войти'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
