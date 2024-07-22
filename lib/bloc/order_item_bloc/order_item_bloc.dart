import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice/models/product/product.dart';

part 'order_item_event.dart';
part 'order_item_state.dart';
part 'order_item_bloc.freezed.dart';

class OrderItemBloc extends Bloc<OrderItemEvent, OrderItemState> {
  OrderItemBloc({
    required Product product,
    int? count,
  }) : super(OrderItemState.count(product: product, count: count ?? 0)) {
    on<OrderItemEvent>((event, emit) {
      event.map(
          changeCount: (event) => emit(
            state.copyWith(count: (state.count + event.delta) > 0 ? state.count + event.delta : 0)
          )
      );
    });
  }
}
