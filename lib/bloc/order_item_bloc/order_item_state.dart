part of 'order_item_bloc.dart';



@freezed
class OrderItemState with _$OrderItemState {
   factory OrderItemState.count({
     required Product product,
     required int count
  }) = _CountState;
}
