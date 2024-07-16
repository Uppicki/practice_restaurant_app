



import 'dart:core';

import 'package:practice/models/restaurant_chain/restaurant_chain.dart';

class CatalogClient {
  _CatalogRepository catalogRepository = _CatalogRepository();

  Future<List<RestaurantChain>> getRests() async {
    return await catalogRepository.getRests();
  }

}




class _CatalogRepository {
  static List<RestaurantChain> rests = [
    RestaurantChain(
        id: 10,
      name: "Вкусно и точка",
      imageUrl: 'https://storage.googleapis.com/restaurant-app-c6238.appspot.com/vkusno.png',
      unique: true,
    ),
    RestaurantChain(
        id: 20,
        imageUrl: 'https://storage.googleapis.com/restaurant-app-c6238.appspot.com/burger_king.jpg',
        name: 'Бургер ',
        unique: false
    )
  ];

  Future<List<RestaurantChain>> getRests() async {
    await  Future.delayed(const Duration(milliseconds: 100));
    return rests;
  }
}

