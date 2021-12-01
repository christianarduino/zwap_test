
import 'package:zwap_pricing/src/price/domain/model/price_feature_response_model.dart';

class PriceResponseModel {
  final String title;
  final String description;
  final int price;
  final bool isCurrentPlan;
  final List<PriceFeatureResponseModel> features;

  PriceResponseModel({
    required this.title,
    required this.description,
    required this.isCurrentPlan,
    required this.price,
    required this.features,
  });
}