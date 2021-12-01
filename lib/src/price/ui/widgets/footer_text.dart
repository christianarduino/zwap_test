import 'package:flutter/material.dart';
import 'package:zwap_design_system/atoms/colors/zwapColors.dart';
import 'package:zwap_design_system/atoms/typography/zwapTypography.dart';

class FooterText extends StatelessWidget {
  const FooterText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "See how our plans compares",
      style: ZwapTypography.h3().copyWith(color: ZwapColors.primary700),
    );
  }
}
