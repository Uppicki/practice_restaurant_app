

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:practice/redux/actions/auth_action/auth_action.dart';
import 'package:practice/redux/states/app_state.dart';
import 'package:practice/redux/states/auth_state/auth_state.dart';
import 'package:practice/ui/pages/profile_screen/fragments/email_code_fragment.dart';
import 'package:practice/ui/pages/profile_screen/fragments/email_fragment.dart';
import 'package:practice/ui/pages/profile_screen/fragments/login_fragment.dart';
import 'package:practice/ui/pages/profile_screen/fragments/profile_fragment.dart';
import 'package:practice/ui/pages/profile_screen/fragments/registration_fragment.dart';



class ProfileFragmentManager extends StatelessWidget {
  final AuthState state;

  const ProfileFragmentManager({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);

    return state.map(
        initial: (_) => LoginFragment(),
        emailCodeConfirm: (_) => PopScope(
            canPop: false,
            onPopInvoked: (_) => store.dispatch(AuthBack()),
            child: EmailCodeFragment()
        ),
        emailConfirm: (_) => PopScope(
          canPop: false,
          onPopInvoked: (_) => store.dispatch(AuthBack()),
          child: EmailFragment()
        ),
        registration: (_) => PopScope(
            canPop: false,
            onPopInvoked: (_) => store.dispatch(AuthBack()),
            child: RegistrationFragment())
        ,
        authorize: (_) => ProfileFragment()
    );

    if (state is UnAuthorized) {
      return LoginFragment();
    } else if (state is EmailConfirm) {
      return EmailFragment();
    } else if (state is EmailCodeConfirm) {
      return EmailCodeFragment();
    } else if (state is RegistrationState) {
      return RegistrationFragment();
    } else if (state is Authorized) {
      return ProfileFragment();
    }
    return const Placeholder();
  }
}
