


import 'package:dio/dio.dart';
import 'package:practice/api_clients/order_client/order_url.dart';
import 'package:practice/payload/requests/create_order_request/create_order_request.dart';
import 'package:retrofit/http.dart';


part 'order_client.g.dart';


@RestApi()
abstract class OrderClient {
  factory OrderClient(Dio dio, {String baseUrl}) = _OrderClient;


  @POST(OrderUrl.addOrder)
  Future<void> createCheckout({
    @Body() required CreateOrderRequest request
});

}
