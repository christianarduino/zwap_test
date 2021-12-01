import 'package:flutter/material.dart';
import 'package:zwap_design_system/atoms/colors/zwapColors.dart';
import 'package:zwap_design_system/atoms/constants/zwapConstants.dart';
import 'package:zwap_design_system/molecules/tabBar/secondary/zwapSecondaryTabBar.dart';
import 'package:zwap_pricing/src/price/ui/viewmodel/prices_viewmodel.dart';

class SubscriptionTab extends StatelessWidget {
  const SubscriptionTab({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final PricesViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ZwapRadius.tabBarRadius),
        color: ZwapColors.neutral200,
      ),
      padding: const EdgeInsets.all(4),
      child: ZwapSecondaryTabBar(
        items: const ["Annual", "Monthly"],
        callBackClick: viewModel.onTabClick,
      ),
    );
  }
}
