import 'package:flutter/material.dart';
import 'package:zwap_design_system/atoms/atoms.dart';
import 'package:zwap_pricing/src/price/ui/model/button_type.dart';

class ZwapGeneralButton extends StatelessWidget {
  final String text;
  final ButtonType buttonType;

  const ZwapGeneralButton({
    Key? key,
    required this.text,
    required this.buttonType,
  }) : super(key: key);

  bool get isCurrentPlan => buttonType == ButtonType.currentPlan;

  Border? get border {
    if (!isCurrentPlan) {
      return Border.all(color: ZwapColors.primary800);
    } else {
      return null;
    }
  }

  Color get backgroundColor {
    if (isCurrentPlan) {
      return ZwapColors.primary200;
    } else {
      return Colors.white;
    }
  }

  Color get textColor {
    if (isCurrentPlan) {
      return Colors.white;
    } else {
      return ZwapColors.primary800;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ZwapRadius.buttonRadius),
        border: border,
        color: backgroundColor,
      ),
      child: ElevatedButton(
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(16),
          ),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ZwapRadius.buttonRadius),
            ),
          ),
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: null,
      ),
    );
  }
}
