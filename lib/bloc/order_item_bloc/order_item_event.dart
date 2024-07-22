part of 'order_item_bloc.dart';

@freezed
class OrderItemEvent with _$OrderItemEvent {
  const factory OrderItemEvent.changeCount({
    required int delta
  }) = _ChangeCountEvent;
}
