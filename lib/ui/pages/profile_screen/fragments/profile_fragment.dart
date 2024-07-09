import 'package:flutter/material.dart';
import 'package:practice/redux/states/auth_state/auth_state.dart';

class ProfileFragment extends StatelessWidget {
  final Authorized state;

  const ProfileFragment({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return const Placeholder(child: Text('asd'),);
  }
}
