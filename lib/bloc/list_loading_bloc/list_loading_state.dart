part of 'list_loading_bloc.dart';



@Freezed(genericArgumentFactories: true)
class ListLoadingState<T> with _$ListLoadingState<T> {
  const factory ListLoadingState.initial() = InitialState;
  const factory ListLoadingState.loading() = _LoadingState;
  const factory ListLoadingState.loaded({
    required List<T> list,
  }) = LoadedState;
  const factory ListLoadingState.empty() = _EmptyState;
}
