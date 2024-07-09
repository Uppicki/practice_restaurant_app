

import 'package:flutter/material.dart';
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
    if (state is UnAuthorized) {
      return LoginFragment(state: state as UnAuthorized);
    } else if (state is EmailConfirm) {
      return EmailFragment(state:  state as EmailConfirm);
    } else if (state is EmailCodeConfirm) {
      return EmailCodeFragment(state:  state as EmailCodeConfirm);
    } else if (state is RegistrationState) {
      return RegistrationFragment(state: state as RegistrationState);
    } else if (state is Authorized) {
      return ProfileFragment(state:  state as Authorized);
    }
    return const Placeholder();
  }
}
