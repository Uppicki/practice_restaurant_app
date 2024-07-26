import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice/app/init_api_client.dart';
import 'package:practice/models/order_item/order_item.dart';
import 'package:practice/models/restaurant/restaurant.dart';
import 'package:practice/models/restaurant_chain/restaurant_chain.dart';
import 'package:practice/payload/requests/create_order_request/create_order_request.dart';
import 'package:practice/payload/requests/create_order_request/order_type/order_type.dart';
import 'package:practice/payload/requests/create_order_request/short_order_item/short_order_item.dart';

part 'checkout_event.dart';

part 'checkout_state.dart';

part 'checkout_bloc.freezed.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc({
    required RestaurantChain restaurantChain,
    required List<OrderItem> items,
    required Restaurant? restaurant,
  }) : super(CheckoutState.pickup(
            restaurantChain: restaurantChain,
            address: '',
            items: items,
            restaurant: restaurant,
            type: OrderType.pickup)) {
    on<CheckoutEvent>((event, emitter) {
      event.map(
          changeRestaurant: (event) => _changeRestaurant(event, emitter),
          changeAddress: (event) => _changeAddress(event, emitter),
          changeDelivery: (_) => _changeDelivery(emitter),
          changePickup: (_) => _changePickup(emitter),
          creteCheckout: (_) => state.mapOrNull(
                delivery: (_) => _createCheckout(state, emitter),
                pickup: (_) => _createCheckout(state, emitter),
              ),
          clearError: (_) => _clearError(emitter));
    });
  }

  _changeRestaurant(
      ChangeRestaurantCheckoutEvent event, Emitter<CheckoutState> emitter) {
    state.mapOrNull(
      delivery: (state) =>
          emitter(state.copyWith(restaurant: event.restaurant)),
      pickup: (state) => emitter(state.copyWith(restaurant: event.restaurant)),
    );
  }

  _changeAddress(
      ChangeAddressCheckoutEvent event, Emitter<CheckoutState> emitter) {
    state.mapOrNull(
      delivery: (state) => emitter(state.copyWith(address: event.address)),
      pickup: (state) => emitter(state.copyWith(address: event.address)),
    );
  }

  _clearError(Emitter<CheckoutState> emitter) {
    state.mapOrNull(
      delivery: (state) => emitter(state.copyWith(error: null)),
      pickup: (state) => emitter(state.copyWith(error: null)),
    );
  }

  _changeDelivery(Emitter<CheckoutState> emitter) {
    state.mapOrNull(
      pickup: (state) => emitter(DeliveryChechoutState(
          restaurantChain: state.restaurantChain,
          address: state.address,
          items: state.items,
          restaurant: state.restaurant,
          type: OrderType.delivery)),
    );
  }

  _changePickup(Emitter<CheckoutState> emitter) {
    state.mapOrNull(
      delivery: (state) => emitter(PickupChechoutState(
          restaurantChain: state.restaurantChain,
          address: state.address,
          items: state.items,
          restaurant: state.restaurant,
          type: OrderType.pickup)),
    );
  }

  _createCheckout(CheckoutState innerState, Emitter<CheckoutState> emitter) async {
    emitter(CheckoutState.upload(prevState: state));

    if ((innerState is DeliveryChechoutState) && innerState.address == '') {
      emitter(innerState.copyWith(error: 'Адрес необходимо заполнить'));
      return;
    }
    if ((innerState is PickupChechoutState) && innerState.restaurant == null) {
      emitter(innerState.copyWith(error: 'Ресторан необходимо выбрать'));
      return;
    }

    final request = innerState.mapOrNull(
        delivery: (state) => CreateOrderRequest(
            restaurantChainId: state.restaurantChain.id,
            items: state.items.map((item) => ShortOrderItem(
                productId: item.product.id,
                quantity: item.count
            )).toList(),
            type: state.type,
          address: state.address
        ),
        pickup: (state) => CreateOrderRequest(
            restaurantChainId: state.restaurantChain.id,
            restaurantId: state.restaurant!.id,
            items: state.items.map((item) => ShortOrderItem(
                productId: item.product.id,
                quantity: item.count
            )).toList(),
            type: state.type,
        ),
    );

    if (request == null) {
      innerState.mapOrNull(
        delivery: (state) => emitter(state.copyWith(error: 'Что-то пошло не так')),
        pickup: (state) => emitter(state.copyWith(error: 'Что-то пошло не так')),
      );
      return;
    }

    final client = ApiClient.client.orderClient;

    try {
      await client.createCheckout(request: request);
      emitter(const CheckoutState.success());
    } catch (e) {
      innerState.mapOrNull(
        delivery: (state) => emitter(state.copyWith(error: 'Что-то пошло не так')),
        pickup: (state) => emitter(state.copyWith(error: 'Что-то пошло не так')),
      );
    }
  }
}
