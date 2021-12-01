import 'package:json_annotation/json_annotation.dart';
import 'package:zwap_pricing/src/price/data/model/network_price_response_model.dart';

part 'network_prices_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class NetworkPricesResponseModel {

  final List<NetworkPriceResponseModel> annual;
  final List<NetworkPriceResponseModel> monthly;

  NetworkPricesResponseModel(this.annual, this.monthly);

  factory NetworkPricesResponseModel.fromJson(Map<String, dynamic> json) => _$NetworkPricesResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkPricesResponseModelToJson(this);
}