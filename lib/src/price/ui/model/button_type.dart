enum ButtonType { selected, currentPlan, idle }

extension ButtonTypeExt on ButtonType {
  static ButtonType fromString(String text) {
    const String _downgrade = "Downgrade";
    const String _upgrade = "Upgrade";
    const String _currentPlan = "Your current plan";
    const String _changeYourPlan = "Change your plan";

    switch (text) {
      case _downgrade:
      case _upgrade:
        return ButtonType.idle;
      case _currentPlan:
        return ButtonType.currentPlan;
      case _changeYourPlan:
        return ButtonType.idle;
      default:
        return ButtonType.idle;
    }
  }
}
