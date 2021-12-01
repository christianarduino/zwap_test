// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_prices_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkPricesResponseModel _$NetworkPricesResponseModelFromJson(
        Map<String, dynamic> json) =>
    NetworkPricesResponseModel(
      (json['annual'] as List<dynamic>)
          .map((e) =>
              NetworkPriceResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['monthly'] as List<dynamic>)
          .map((e) =>
              NetworkPriceResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NetworkPricesResponseModelToJson(
        NetworkPricesResponseModel instance) =>
    <String, dynamic>{
      'annual': instance.annual.map((e) => e.toJson()).toList(),
      'monthly': instance.monthly.map((e) => e.toJson()).toList(),
    };
