import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/bloc/catalog_bloc/catalog_bloc.dart';
import 'package:practice/bloc/list_loading_bloc/list_loading_bloc.dart';
import 'package:practice/router/app_router.dart';
import 'package:practice/ui/cards/short_card.dart';

class CategoryListFragment extends StatelessWidget {
  final LoadedState state;

  const CategoryListFragment({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final catalogBloc = context.read<CatalogBloc>();

    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => InkWell(
          onTap: () async {
            catalogBloc.add(CatalogEvent.changeCategory(category: state.list[index]));

            await AutoRouter.of(context)
                .push(const RestaurantProductListRoute());

            catalogBloc.add(const CatalogEvent.back());
          },
          child: shortCard(
              imageUrl: state.list[index].imageUrl,
              title: state.list[index].name
          ),
        ),
        childCount: state.list.length,
      ),
    );
  }
}
