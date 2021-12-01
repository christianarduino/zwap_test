import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:zwap_design_system/atoms/typography/zwapTypography.dart';

class HeaderDialog extends StatelessWidget {
  const HeaderDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getValueForScreenType(
        context: context,
        mobile: const EdgeInsets.only(bottom: 8.0),
        desktop: null,
      ),
      child: Text(
        "Invest in your career with Zwap Pro",
        textAlign: TextAlign.center,
        style: ZwapTypography.h1().copyWith(
          fontFamily: "Poppins",
        ),
      ),
    );
  }
}
