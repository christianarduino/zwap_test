import 'package:flutter/material.dart';
import 'package:zwap_design_system/atoms/colors/zwapColors.dart';
import 'package:zwap_design_system/atoms/constants/zwapConstants.dart';
import 'package:zwap_pricing/src/price/domain/model/price_feature_response_model.dart';

class FeatureTile extends StatelessWidget {
  const FeatureTile({
    Key? key,
    required this.feature,
    required this.isSelected,
  }) : super(key: key);

  final PriceFeatureResponseModel feature;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Checkbox(
              activeColor: feature.enabled
                  ? ZwapColors.primary700
                  : ZwapColors.primary200,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  ZwapRadius.defaultRadius,
                ),
              ),
              value: true,
              onChanged: (val) {},
            ),
          ),
          const SizedBox(width: 8.0),
          Text(
            feature.name,
            style: TextStyle(
              color: isSelected
                  ? Colors.white
                  : feature.enabled
                      ? null
                      : ZwapColors.neutral400,
            ),
          ),
        ],
      ),
    );
  }
}
