

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
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: state.map(
          initial: (_) => LoginFragment(),
          emailCodeConfirm: (_) => EmailCodeFragment(),
          emailConfirm: (_) => EmailFragment(),
          registration: (_) => RegistrationFragment(),
          authorize: (_) => ProfileFragment()
      ),
    );
  }
}
