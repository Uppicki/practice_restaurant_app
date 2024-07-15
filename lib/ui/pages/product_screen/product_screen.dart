





import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: ColoredBox(color: Colors.black,)),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("name"),
                  Text("description"),
                  Text("price"),
                  Text("category"),
                  Text("name"),
                  Text("description"),
                  Text("price"),
                  Text("category"),
                  Text("name"),
                  Text("description"),
                  Text("price"),
                  Text("category"),
                  Text("name"),
                  Text("description"),
                  Text("price"),
                  Text("category"),
                  Text("name"),
                  Text("description"),
                  Text("price"),
                  Text("category"),
                  Text("name"),
                  Text("description"),
                  Text("price"),
                  Text("category"),
                  Text("name"),
                  Text("description"),
                  Text("price"),
                  Text("category"),

                  // Add more fields as needed
                ],
              )
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: null,
                              icon: Icon(Icons.remove)
                          ),
                          Text("count"),
                          IconButton(
                              onPressed: null,
                              icon: Icon(Icons.add)
                          ),
                        ],
                      )
                  ),
                  Expanded(
                      flex: 1,
                      child: Text("Total cost")
                  )
                ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () { },
                    child: Text('Добавить в корзину'),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
