import 'package:flutter/material.dart';

class EmptyProductListFragment extends StatelessWidget {
  const EmptyProductListFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Список продуктов пуст.'),
    );
  }
}