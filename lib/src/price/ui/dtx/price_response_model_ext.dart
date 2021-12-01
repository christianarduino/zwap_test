import 'package:zwap_pricing/src/price/domain/model/price_response_model.dart';

extension ListPriceResponseModelExt on List<PriceResponseModel> {
  int? get getCurrentPlanIndex {
    int i = 0;
    bool found = false;
    while(i < length && !found) {
      final sub = this[i];
      found = sub.isCurrentPlan;
      i++;
    }

    if(found) {
      return --i;
    } else {
      return null;
    }
  }
}