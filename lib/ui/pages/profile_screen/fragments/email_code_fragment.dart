import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:practice/redux/actions/auth_action/auth_action.dart';
import 'package:practice/redux/states/app_state.dart';
import 'package:practice/redux/states/auth_state/auth_state.dart';
import 'package:practice/redux/thunk_actions/auth_thunk_action.dart';
import 'package:redux/redux.dart';



class EmailCodeFragment extends StatefulWidget {

  const EmailCodeFragment({super.key});

  @override
  State<EmailCodeFragment> createState() => _EmailCodeFragmentState();
}

class _EmailCodeFragmentState extends State<EmailCodeFragment> {
  late TextEditingController codeController;
  late TextEditingController emailController;
  late Store<AppState> store;
  late EmailCodeConfirm _state;

  @override
  void initState() {
    super.initState();
    codeController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void didUpdateWidget(covariant EmailCodeFragment oldWidget) {
    super.didUpdateWidget(oldWidget);
    _state = store.state.authState as EmailCodeConfirm;

    codeController.text = '';
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store = StoreProvider.of<AppState>(context);
    _state = store.state.authState as EmailCodeConfirm;

    emailController.text = _state.email;
  }

  @override
  void dispose() {
    emailController.dispose();
    codeController.dispose();
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
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Введите email',
                  ),
                  readOnly: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: PinCodeTextField(
                  appContext: context,
                  length: 6,
                  controller: codeController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly]
                )
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  _state.error ?? '',
                  style: TextStyle(
                      color: Colors.red
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  store.dispatch(sendCode(_state.email, codeController.text));
                },
                child: Text('Отправить'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

