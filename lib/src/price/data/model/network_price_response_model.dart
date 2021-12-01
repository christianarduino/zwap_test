import 'package:json_annotation/json_annotation.dart';

part 'network_price_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class NetworkPriceResponseModel {
  final int id;
  final String title;
  final String description;
  final int price;
  @JsonKey(name: "is_current_plan")
  final bool isCurrentPlan;
  final List<NetworkPriceFeatureResponseModel> features;

  NetworkPriceResponseModel(
    this.title,
    this.description,
    this.price,
    this.features,
    this.id,
    this.isCurrentPlan,
  );

  factory NetworkPriceResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NetworkPriceResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkPriceResponseModelToJson(this);
}

@JsonSerializable()
class NetworkPriceFeatureResponseModel {
  final String name;
  final bool enabled;

  NetworkPriceFeatureResponseModel(this.name, this.enabled);

  factory NetworkPriceFeatureResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$NetworkPriceFeatureResponseModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$NetworkPriceFeatureResponseModelToJson(this);
}
