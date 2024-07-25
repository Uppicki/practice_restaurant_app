import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/bloc/checkout_bloc/checkout_bloc.dart';

class TypeOrder extends StatelessWidget {
  final CheckoutBloc bloc;
  final CheckoutState state;

  const TypeOrder({super.key, required this.bloc, required this.state});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CheckoutBloc>();

    return BlocBuilder<CheckoutBloc, CheckoutState>(
        bloc: bloc,
        builder: (context, state) {
          String selectedSegment = '';
          if (state is DeliveryChechoutState) {
            selectedSegment = 'Доставка';
          } else if (state is PickupChechoutState) {
            selectedSegment = 'Самовывоз';
          }

          return Center(
            child: SegmentedButton<String>(
              segments: [
                ButtonSegment<String>(
                  value: 'Доставка',
                  label: Text('Доставка'),
                ),
                ButtonSegment<String>(
                  value: 'Самовывоз',
                  label: Text('Самовывоз'),
                ),
              ],
              selected: {selectedSegment},
              onSelectionChanged: (Set<String> newSelection) {
                if (newSelection.first == 'Доставка') {
                  bloc.add(CheckoutEvent.changeDelivery());
                } else if (newSelection.first == 'Самовывоз') {

                }
              },
            ),
          );
        }
    );
  }
}
