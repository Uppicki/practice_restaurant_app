import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:practice/redux/actions/auth_action/auth_action.dart';
import 'package:practice/redux/states/app_state.dart';
import 'package:practice/redux/states/auth_state/auth_state.dart';
import 'package:practice/redux/thunk_actions/auth_thunk_action.dart';
import 'package:practice/ui/fields/password_field.dart';
import 'package:redux/redux.dart';



class RegistrationFragment extends StatefulWidget {

  const RegistrationFragment({super.key});

  @override
  State<RegistrationFragment> createState() => _RegistrationFragmentState();
}

class _RegistrationFragmentState extends State<RegistrationFragment> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController repeatPasswordController;
  late TextEditingController firstNameController;
  late TextEditingController secondNameController;
  late Store<AppState> store;
  late RegistrationState _state;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    repeatPasswordController = TextEditingController();
    firstNameController = TextEditingController();
    secondNameController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store = StoreProvider.of<AppState>(context);
    _state = store.state.authState as RegistrationState;

    emailController.text = _state.email;
  }

  @override
  void didUpdateWidget(covariant RegistrationFragment oldWidget) {
    _state = store.state.authState as RegistrationState;

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
    firstNameController.dispose();
    secondNameController.dispose();

    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => store.dispatch(AuthBack()),
        ),
        title: Text('Регистрация'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Введите email',
                      ),
                      readOnly: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        labelText: ('Введите имя'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      controller: secondNameController,
                      decoration: InputDecoration(
                        labelText: ('Введите фамилию'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: PasswordField(
                      controller: passwordController,
                      labelText: 'Введите пароль',
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: PasswordField(
                      controller: repeatPasswordController,
                      labelText: 'Повторите пароль',
                    ),
                  ),
                  if (_state.error != null) Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      _state.error!,
                      style: TextStyle(
                          color: Colors.red
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  store.dispatch(regUser(
                      email: _state.email,
                      password: passwordController.text,
                      repeatPassword: repeatPasswordController.text,
                      firstName: firstNameController.text,
                      lastName: secondNameController.text
                  ));
                },
                child: Text('Регистрация'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
