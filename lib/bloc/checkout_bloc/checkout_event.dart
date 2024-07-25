part of 'checkout_bloc.dart';

@freezed
class CheckoutEvent with _$CheckoutEvent {
  const factory CheckoutEvent.changeRestaurant({
    required Restaurant restaurant,
}) = ChangeRestaurantCheckoutEvent;

  const factory CheckoutEvent.changeAddress({
    required String address,
  }) = ChangeAddressCheckoutEvent;


  const factory CheckoutEvent.changeDelivery() = ChangeDeliveryCheckoutEvent;

  const factory CheckoutEvent.changePickup() = ChangePickupCheckoutEvent;

  const factory CheckoutEvent.creteCheckout() = CreateCheckoutEvent;

  const factory CheckoutEvent.clearError() = ClearErrorCheckoutEvent;

}
