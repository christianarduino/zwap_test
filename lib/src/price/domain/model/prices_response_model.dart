import 'package:zwap_pricing/src/price/domain/model/price_response_model.dart';

class PricesResponseModel {
  final List<PriceResponseModel> annual;
  final List<PriceResponseModel> monthly;

  PricesResponseModel({required this.annual, required this.monthly});
}
