import 'package:flutter/material.dart';

class CategoryEmptyList extends StatelessWidget {
  const CategoryEmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Список Категорий пуст.'),
    );
  }
}