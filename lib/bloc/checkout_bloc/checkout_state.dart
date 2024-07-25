part of 'checkout_bloc.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState.delivery({
    required RestaurantChain restaurantChain,
    required String address,
    required List<OrderItem> items,
    required Restaurant? restaurant,
    required OrderType type,
    String? error
}) = DeliveryChechoutState;

  const factory CheckoutState.pickup({
    required RestaurantChain restaurantChain,
    required String address,
    required List<OrderItem> items,
    required Restaurant? restaurant,
    required OrderType type,
    String? error
}) = PickupChechoutState;

  const factory CheckoutState.upload({
    required CheckoutState prevState,
}) = UploadCheckoutState;

  const factory CheckoutState.success() = SuccessCheckoutState;
}
