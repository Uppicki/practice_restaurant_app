import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:practice/redux/actions/auth_action/auth_action.dart';
import 'package:practice/redux/states/app_state.dart';
import 'package:practice/redux/states/auth_state/auth_state.dart';
import 'package:practice/redux/thunk_actions/auth_thunk_action.dart';
import 'package:redux/redux.dart';



class EmailFragment extends StatefulWidget {

  const EmailFragment({super.key});

  @override
  State<EmailFragment> createState() => _EmailFragmentState();
}

class _EmailFragmentState extends State<EmailFragment> {
  late TextEditingController emailController;
  late Store<AppState> store;
  late EmailConfirm _state;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void didUpdateWidget(covariant EmailFragment oldWidget) {
    super.didUpdateWidget(oldWidget);
    _state = store.state.authState as EmailConfirm;
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store = StoreProvider.of<AppState>(context);
    _state = store.state.authState as EmailConfirm;

    emailController.text = _state.email;
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) => store.dispatch(AuthBack()),
      child: Scaffold(
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
                  ),
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
                    store.dispatch(sendEmail(emailController.text));
                  },
                  child: Text('Отправить'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
