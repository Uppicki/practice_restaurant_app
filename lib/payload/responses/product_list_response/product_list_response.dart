


import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice/models/product/product.dart';

part 'product_list_response.g.dart';
part 'product_list_response.freezed.dart';

@freezed
class ProductListResponse with _$ProductListResponse {
  const factory ProductListResponse({
    required List<Product> items
  }) = _ProductListResponse;


  factory ProductListResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductListResponseFromJson(json);
}
