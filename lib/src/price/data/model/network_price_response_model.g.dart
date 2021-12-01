// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_price_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkPriceResponseModel _$NetworkPriceResponseModelFromJson(
        Map<String, dynamic> json) =>
    NetworkPriceResponseModel(
      json['title'] as String,
      json['description'] as String,
      json['price'] as int,
      (json['features'] as List<dynamic>)
          .map((e) => NetworkPriceFeatureResponseModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      json['id'] as int,
      json['is_current_plan'] as bool,
    );

Map<String, dynamic> _$NetworkPriceResponseModelToJson(
        NetworkPriceResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'is_current_plan': instance.isCurrentPlan,
      'features': instance.features.map((e) => e.toJson()).toList(),
    };

NetworkPriceFeatureResponseModel _$NetworkPriceFeatureResponseModelFromJson(
        Map<String, dynamic> json) =>
    NetworkPriceFeatureResponseModel(
      json['name'] as String,
      json['enabled'] as bool,
    );

Map<String, dynamic> _$NetworkPriceFeatureResponseModelToJson(
        NetworkPriceFeatureResponseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'enabled': instance.enabled,
    };
