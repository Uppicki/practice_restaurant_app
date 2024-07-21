
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice/payload/responses/category_list_response/category_list_response.dart';
import 'package:practice/payload/responses/restaurant_chain_list_response/restaurant_chain_list_response.dart';
import 'package:practice/payload/responses/restaurant_list_response/restaurant_list_response.dart';

part 'list_loading_event.dart';

part 'list_loading_state.dart';

part 'list_loading_bloc.freezed.dart';

class ListLoadingBloc<T> extends Bloc<ListLoadingEvent, ListLoadingState<T>> {
  final Future<dynamic> Function({dynamic request}) requestCallback;

  ListLoadingBloc({required this.requestCallback})
      : super(const ListLoadingState.initial()) {
    on<ListLoadingEvent>((event, emitter) async {
      await event.map(
          loadItems: (event) async => await _loadItems(event, emitter));
    });
  }

  _loadItems(_LoadItemsEvent event,
      Emitter<ListLoadingState<T>> emitter) async {
    emitter(const ListLoadingState.loading());

    final res = (event.loadingRequest != null) ?
    await requestCallback(request: event.loadingRequest) :
    await requestCallback(request: null);


    if (res is RestaurantChainListResponse) {
      res.items.isEmpty ? emitter(const ListLoadingState.empty())
          : emitter(ListLoadingState.loaded(list: res.items as List<T>));
    } else if (res is RestaurantListResponse) {
      res.items.isEmpty ? emitter(const ListLoadingState.empty())
          : emitter(ListLoadingState.loaded(list: res.items as List<T>));
    } else if (res is CategoryListResponse) {
      res.items.isEmpty ? emitter(const ListLoadingState.empty())
          : emitter(ListLoadingState.loaded(list: res.items as List<T>));
    }
  }
}
