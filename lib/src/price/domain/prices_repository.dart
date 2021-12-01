import 'package:zwap_pricing/src/price/domain/model/prices_response_model.dart';

abstract class PricesRepository {
  Future<PricesResponseModel> getPrices();
}