




import 'package:freezed_annotation/freezed_annotation.dart';

enum OrderType{
  @JsonValue('DELIVERY')
  delivery,

  @JsonValue('PICKUP')
  pickup,
}