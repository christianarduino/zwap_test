import 'package:zwap_pricing/src/price/data/model/network_price_response_model.dart';
import 'package:zwap_pricing/src/price/data/model/network_prices_response_model.dart';
import 'package:zwap_pricing/src/price/domain/model/price_feature_response_model.dart';
import 'package:zwap_pricing/src/price/domain/model/price_response_model.dart';
import 'package:zwap_pricing/src/price/domain/model/prices_response_model.dart';

extension NetworkPricesResponseModelExt on NetworkPricesResponseModel {
  PricesResponseModel get toDomain {
    return PricesResponseModel(
      annual: annual.map((price) => price.toDomain).toList(),
      monthly: monthly.map((price) => price.toDomain).toList(),
    );
  }
}

extension NetworkPriceResponseModelExt on NetworkPriceResponseModel {
  PriceResponseModel get toDomain {
    return PriceResponseModel(
      description: description,
      isCurrentPlan: isCurrentPlan,
      price: price,
      title: title,
      features: features.map((feature) => feature.toDomain).toList(),
    );
  }
}

extension NetworkPriceFeatureResponseModelExt
    on NetworkPriceFeatureResponseModel {
  PriceFeatureResponseModel get toDomain {
    return PriceFeatureResponseModel(
      enabled: enabled,
      name: name,
    );
  }
}
