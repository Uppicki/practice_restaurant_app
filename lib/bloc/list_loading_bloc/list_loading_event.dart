part of 'list_loading_bloc.dart';

@freezed
class ListLoadingEvent with _$ListLoadingEvent {
  const factory ListLoadingEvent.loadItems() = _LoadItemsEvent;
}