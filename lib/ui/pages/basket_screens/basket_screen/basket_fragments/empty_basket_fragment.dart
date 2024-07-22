import 'package:flutter/material.dart';

class EmptyBasketFragment extends StatelessWidget {
  const EmptyBasketFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Корзина пуста, Вы можете добавить товары в корзину в Каталоге.',
                textAlign: TextAlign.center),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Перейти в каталог'),
            )
          ],
        ),
      ),
    );
  }
}
