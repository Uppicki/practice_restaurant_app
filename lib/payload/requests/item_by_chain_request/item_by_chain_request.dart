




import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_by_chain_request.g.dart';
part 'item_by_chain_request.freezed.dart';


@freezed
class ItemByChainRequest with _$ItemByChainRequest {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ItemByChainRequest({
    required int restaurantChainId
}) = _ItemByChainRequest;


  factory ItemByChainRequest.fromJson(Map<String, dynamic> json) =>
      _$ItemByChainRequestFromJson(json);
}
