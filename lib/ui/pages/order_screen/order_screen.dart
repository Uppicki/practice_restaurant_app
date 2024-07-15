import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:practice/router/app_router.dart';

@RoutePage()
class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Корзина')),
      body: OrderListFragment(),
    );
  }
}


class EmptyOrderFragment extends StatelessWidget {
  const EmptyOrderFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Корзина пуста, Вы можете добавить товары в корзину.'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text('Перейти в каталог'),
          )
        ],
      ),
    );
  }
}



class OrderListFragment extends StatelessWidget {
  const OrderListFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.confirmation_num_sharp),
                title: Text('Ресторан'),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.build),
                        title: Text("Товар $index"),
                        subtitle: Row(
                          children: [
                            Expanded(child: Text("Кол-во")),
                            Expanded(child: Text("Цена"))
                          ],
                        ),
                        trailing: Icon(Icons.delete),
                        onTap: () async => await AutoRouter.of(context).push(ProductRoute()),
                      );
                    }
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: null,
            child: Text('Оформить заказ'),
          ),
        )
      ],
    );
  }
}