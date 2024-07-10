


import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  PasswordField({super.key, required this.controller, required this.labelText});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _visible = false;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: IconButton(
          icon: Icon(
            _visible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _visible = !_visible;
            });
          },
        ),
      ),
      obscureText: !_visible,
    );
  }
}
