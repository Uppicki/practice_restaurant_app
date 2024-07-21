



import 'dart:core';


import 'package:dio/dio.dart';
import 'package:practice/api_clients/catalog_client/catalog_url.dart';
import 'package:practice/payload/requests/restaurant_get_request/restaurant_get_request.dart';
import 'package:practice/payload/responses/category_list_response/category_list_response.dart';
import 'package:practice/payload/responses/restaurant_chain_list_response/restaurant_chain_list_response.dart';
import 'package:practice/payload/responses/restaurant_list_response/restaurant_list_response.dart';
import 'package:retrofit/http.dart';

part 'catalog_client.g.dart';


@RestApi()
abstract class CatalogClient {
  factory CatalogClient(Dio dio, {String baseUrl}) = _CatalogClient;

  @GET(CatalogUrl.restaurantChains)
  Future<RestaurantChainListResponse> getRestaurantChains({
    @Queries() RestaurantGetRequest? request,
  });

  @GET(CatalogUrl.restaurantByChain)
  Future<RestaurantListResponse> getRestaurant({
    @Queries() required RestaurantGetRequest request,
  });

  @GET(CatalogUrl.restaurantCategory)
  Future<CategoryListResponse> getCategory({
    @Queries() required RestaurantGetRequest request,
  });

}


