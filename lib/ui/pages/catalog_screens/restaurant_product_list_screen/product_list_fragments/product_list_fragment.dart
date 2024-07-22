import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/bloc/catalog_bloc/catalog_bloc.dart';
import 'package:practice/bloc/list_loading_bloc/list_loading_bloc.dart';
import 'package:practice/router/app_router.dart';
import 'package:practice/ui/cards/short_card.dart';

class ProductListFragment extends StatelessWidget {
  final LoadedState state;

  const ProductListFragment({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final catalogBloc = context.read<CatalogBloc>();


    return BlocListener<CatalogBloc, CatalogState>(
      listener: (context, state) {
        state.mapOrNull(
          changeProduct: (catalogState) async {
            await AutoRouter.of(context)
                .push(ProductRoute(
              product: catalogState.product,
              restaurantChain: catalogState.restaurantChain,
              restaurant: catalogState.restaurant,
            ));

            catalogBloc.add(const CatalogEvent.back());
          }
        );
      },
      child: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        delegate: SliverChildBuilderDelegate(
              (context, index) => InkWell(
            onTap: () async {
              catalogBloc.add(CatalogEvent.changedProduct(product: state.list[index]));

            },
            child: shortCard(
                imageUrl: state.list[index].imageUrl,
                title: state.list[index].name
            ),
          ),
          childCount: state.list.length,
        ),
      ),
    );
  }
}
