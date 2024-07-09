import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:practice/redux/states/app_state.dart';
import 'package:practice/redux/states/auth_state/auth_state.dart';
import 'package:practice/ui/pages/profile_screen/profile_fragment_manager.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthState>(
        builder: (_, wm) => ProfileFragmentManager(state: wm),
        converter: (store) => store.state.authState,
    );
  }
}