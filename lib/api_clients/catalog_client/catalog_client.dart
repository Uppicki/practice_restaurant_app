



import 'dart:core';


import 'package:dio/dio.dart';
import 'package:practice/models/restaurant/restaurant.dart';
import 'package:practice/models/restaurant_category/restaurant_category.dart';
import 'package:practice/models/restaurant_chain/restaurant_chain.dart';
import 'package:retrofit/http.dart';


@RestApi()
class CatalogClient {
  factory CatalogClient(Dio dio, {String baseUrl}) = CatalogClient;

  Future<List<RestaurantChain>> getRests();

  Future<List<Restaurant>> getRestsByChain();

}


