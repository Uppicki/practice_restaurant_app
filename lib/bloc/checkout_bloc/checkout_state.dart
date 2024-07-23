part of 'checkout_bloc.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState.initial({Restaurant? restaurant}) = InitialChechoutState;
  const factory CheckoutState.delivery({
    Restaurant? restaurant,
    required String address,
}) = DeliveryChechoutState;
  const factory CheckoutState.pickup({
    required Restaurant restaurant,
}) = PickupChechoutState;

  factory CheckoutState.fromJson(Map<String, dynamic> json) =>
      _$CheckoutStateFromJson(json);
}
