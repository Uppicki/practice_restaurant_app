import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:practice/redux/actions/auth_action/auth_action.dart';
import 'package:practice/redux/states/app_state.dart';
import 'package:practice/redux/states/auth_state/auth_state.dart';



class EmailFragment extends StatelessWidget {
  final EmailConfirm state;

  const EmailFragment({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => store.dispatch(AuthBack()),
        ),
        title: Text('Регистрация'),
      ),
      body: Column(
        children: [
          TextField(),
          ElevatedButton(
            onPressed: () {
              store.dispatch(SendEmail(email: ''));
            },
            child: Text('Отправить'),
          ),
        ],
      ),
    );
  }
}
