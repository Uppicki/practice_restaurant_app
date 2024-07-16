

import 'package:flutter/material.dart';
import 'package:practice/bloc/restaurant_chains_bloc/restaurant_chains_bloc.dart';
import 'package:practice/ui/fragment/progress_indicator_fragment.dart';
import 'package:practice/ui/pages/restaurant_chains_screen/restaurant_chains_fragments/chain_empty_list.dart';
import 'package:practice/ui/pages/restaurant_chains_screen/restaurant_chains_fragments/chain_list_fragment.dart';

Widget fragmentManager(RestaurantChainsState state) {
  return state.map(
      initial: (_) => const ChainEmptyList(),
      loading: (state) => const ProgressIndicatorFragment(),
      loaded: (_) => ChainsListFragment()
  );
}