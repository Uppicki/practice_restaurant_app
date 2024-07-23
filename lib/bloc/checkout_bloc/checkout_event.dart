part of 'checkout_bloc.dart';

@freezed
class CheckoutEvent with _$CheckoutEvent {
  const factory CheckoutEvent.changeRestaurant({
    required Restaurant restaurant,
}) = ChangeRestaurantEvent;

  const factory CheckoutEvent.changeDelivery() = _ChangeDeliveryCheckoutEvent;


}
