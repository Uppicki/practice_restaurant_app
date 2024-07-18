import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice/app/init_api_client.dart';

part 'list_loading_event.dart';

part 'list_loading_state.dart';

part 'list_loading_bloc.freezed.dart';

class ListLoadingBloc<T> extends Bloc<ListLoadingEvent, ListLoadingState<T>> {
  final Future<List<T>> Function() requestCallback;

  ListLoadingBloc({required this.requestCallback})
      : super(const ListLoadingState.initial()) {
    on<ListLoadingEvent>((event, emitter) async {
      await event.map(
          loadItems: (event) async => await _loadItems(event, emitter));
    });
  }

  _loadItems(
      _LoadItemsEvent event, Emitter<ListLoadingState<T>> emitter) async {
    emitter(const ListLoadingState.loading());
    final res = await requestCallback();
    res.isEmpty
        ? emitter(const ListLoadingState.empty())
        : emitter(ListLoadingState.loaded(list: res));
  }
}
