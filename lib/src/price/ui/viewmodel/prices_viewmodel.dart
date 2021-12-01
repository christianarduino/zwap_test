import 'package:flutter/material.dart';
import 'package:zwap_pricing/src/price/domain/model/prices_response_model.dart';
import 'package:zwap_pricing/src/price/domain/prices_repository.dart';
import 'package:zwap_pricing/src/price/ui/dtx/price_response_model_ext.dart';

enum SubscriptionType { annual, monthly }

class PricesViewModel extends ChangeNotifier {
  late PricesRepository _repository;

  Future<PricesResponseModel>? pricesFuture;
  int? currentAnnualPlanIndex;
  int? currentMonthPlanIndex;

  int? get currentPlanIndex =>
      isAnnualSelected ? currentAnnualPlanIndex : currentMonthPlanIndex;

  final String _annual = "Annual";

  int? _selectedSubIndex;
  int? get selectedSubIndex => _selectedSubIndex;
  set selectedSubIndex(int? newState) {
    if (newState == selectedSubIndex) {
      _selectedSubIndex = null;
    } else {
      _selectedSubIndex = newState;
    }
    notifyListeners();
  }

  SubscriptionType _selectedSubscriptionType = SubscriptionType.annual;
  SubscriptionType get selectedSubscriptionType => _selectedSubscriptionType;
  set selectedSubscriptionType(SubscriptionType newState) {
    _selectedSubscriptionType = newState;
    _selectedSubIndex = null;
    notifyListeners();
  }

  bool get isAnnualSelected =>
      selectedSubscriptionType == SubscriptionType.annual;
  bool get isMonthlySelected =>
      selectedSubscriptionType == SubscriptionType.monthly;

  void update(PricesRepository repository) {
    _repository = repository;
    if (pricesFuture == null) {
      pricesFuture = getPrices();
      notifyListeners();
    }
  }

  Future<PricesResponseModel> getPrices() async {
    final response = await _repository.getPrices();
    currentAnnualPlanIndex = response.annual.getCurrentPlanIndex;
    currentMonthPlanIndex = response.annual.getCurrentPlanIndex;
    return response;
  }

  void onTabClick(String value) {
    if (value == _annual) {
      selectedSubscriptionType = SubscriptionType.annual;
    } else {
      selectedSubscriptionType = SubscriptionType.monthly;
    }
  }

  void onSubTap(int index) {
    selectedSubIndex = index;
  }
}
