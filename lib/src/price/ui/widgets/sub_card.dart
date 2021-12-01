import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:zwap_design_system/atoms/card/zwapCard.dart';
import 'package:zwap_design_system/atoms/colors/zwapColors.dart';
import 'package:zwap_design_system/atoms/typography/zwapTypography.dart';
import 'package:zwap_pricing/src/price/domain/model/price_response_model.dart';
import 'package:zwap_pricing/src/price/ui/model/button_type.dart';
import 'package:zwap_pricing/src/price/ui/widgets/feature_tile.dart';
import 'package:zwap_pricing/src/price/ui/widgets/zwap_general_button.dart';

class SubCard extends StatelessWidget {
  const SubCard({
    Key? key,
    required this.isSelected,
    required this.sub,
    required this.planIndex,
    required this.currentPlanIndex,
    this.onTap,
  }) : super(key: key);

  final PriceResponseModel sub;
  final bool isSelected;
  final int planIndex;
  final int? currentPlanIndex;
  final Function()? onTap;

  final String _downgrade = "Downgrade";
  final String _upgrade = "Upgrade";
  final String _currentPlan = "Your current plan";
  final String _changeYourPlan = "Change your plan";

  Color? get textColor => isSelected ? Colors.white : null;

  bool get isCurrentPlan => currentPlanIndex == planIndex;

  String get buttonTitle {
    if (currentPlanIndex == null) return _changeYourPlan;

    if (planIndex < currentPlanIndex!) {
      return _downgrade;
    } else if (isCurrentPlan) {
      return _currentPlan;
    } else {
      return _upgrade;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.only(
          right: getValueForScreenType(
            context: context,
            mobile: 0,
            desktop: 16.0,
          ),
          top: getValueForScreenType(
            context: context,
            mobile: 0,
            desktop: isSelected ? 0 : 15,
          ),
          bottom: getValueForScreenType(
            context: context,
            mobile: 40,
            desktop: isSelected ? 15 : 0,
          ),
        ),
        child: ZwapCard(
          elevationLevel: getValueForScreenType(
            context: context,
            mobile: isSelected ? 10 : 1,
            desktop: isSelected ? 30 : .1,
          ),
          cardWidth: getValueForScreenType(
            context: context,
            mobile: double.maxFinite,
            desktop: 350,
          ),
          cardHeight: getValueForScreenType(
            context: context,
            mobile: height * .60,
            desktop: double.maxFinite,
          ),
          zwapCardType: ZwapCardType.levelOne,
          backgroundColor: isSelected ? ZwapColors.primary800 : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sub.title,
                  style: ZwapTypography.h1().copyWith(color: textColor),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    sub.description,
                    style: ZwapTypography.bodyRegular().copyWith(
                      color: textColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Text(
                    "€${sub.price}",
                    style: ZwapTypography.h1().copyWith(color: textColor),
                  ),
                ),
                Text(
                  "€${sub.price * 12} per year",
                  style: ZwapTypography.h3()
                      .copyWith(color: ZwapColors.neutral500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: ZwapGeneralButton(
                    text: buttonTitle,
                    buttonType: ButtonTypeExt.fromString(buttonTitle),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: sub.features.length,
                    itemBuilder: (_, int i) {
                      final feature = sub.features[i];
                      return FeatureTile(
                        feature: feature,
                        isSelected: isSelected,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
