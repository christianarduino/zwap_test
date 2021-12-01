import 'package:flutter/material.dart';
import 'package:zwap_design_system/atoms/typography/zwapTypography.dart';

class SubHeaderDialog extends StatelessWidget {
  const SubHeaderDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "With Pro and Legendary you get the tools you need to grow as a professinal",
      textAlign: TextAlign.center,
      style: ZwapTypography.bodyRegular().copyWith(fontFamily: "Poppins"),
    );
  }
}
