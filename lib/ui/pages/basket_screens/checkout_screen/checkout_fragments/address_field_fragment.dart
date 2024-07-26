

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:practice/bloc/checkout_bloc/checkout_bloc.dart';

class AddressFieldFragment extends StatefulWidget {
  final Function blocFunction;
  final Function eventFunction;
  final String address;

  const AddressFieldFragment({
    super.key,
    required this.blocFunction,
    required this.eventFunction,
    required this.address
  });

  @override
  State<AddressFieldFragment> createState() => _AddressFieldFragmentState();
}

class _AddressFieldFragmentState extends State<AddressFieldFragment> {
  late TextEditingController _controller;
  late Timer? _timer;
  static const _debounceDuration = Duration(milliseconds: 500);



  @override
  Widget build(BuildContext context) {
    _controller.text = widget.address;

    return TextField(
      controller: _controller,
      onChanged: (value) => _onTextChanged(value),
      style: TextStyle()
    );
  }

  _onTextChanged(String value) {
    _timer?.cancel();


    _timer = Timer(_debounceDuration, () {
      widget.blocFunction(widget.eventFunction(address: _controller.text));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _timer = null;
  }
}
