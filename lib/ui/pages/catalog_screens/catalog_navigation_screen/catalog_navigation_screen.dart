


import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/bloc/catalog_bloc/catalog_bloc.dart';


@RoutePage()
class CatalogNavigationScreen extends StatelessWidget implements AutoRouteWrapper{
  const CatalogNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => CatalogBloc(),
      child: this,
    );
  }
}
