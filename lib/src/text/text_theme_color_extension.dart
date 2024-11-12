import 'package:flutter/material.dart';

class MyTextThemeExtensions {
  static const light = MyTextColorThemeExtension(
    primaryText: Color(0xff364954),
    secondaryText: Color(0xff425A69),
    tertiaryText: Color(0xff678AA1),
    disabledText: Color(0xffA3BFD2),
    accentText: Color(0xff55BBEB),
    negativeText: Color(0xffF40101),
    warningText: Color(0xffFFA722),
    successText: Color(0xff71BD4E),
  );
  static const dark = MyTextColorThemeExtension(
    primaryText: Color(0xffE0E6ED),
    secondaryText: Color(0xffB4C0CC),
    tertiaryText: Color(0xff8FA2B5),
    disabledText: Color(0xff5A6978),
    accentText: Color(0xff4DA0E6),
    negativeText: Color(0xffFF5A5A),
    warningText: Color(0xffFFB347),
    successText: Color(0xff63D36A),
  );
}

@immutable
class MyTextColorThemeExtension
    extends ThemeExtension<MyTextColorThemeExtension> {
  final Color primaryText;
  final Color secondaryText;
  final Color tertiaryText;
  final Color disabledText;
  final Color accentText;
  final Color negativeText;
  final Color warningText;
  final Color successText;

  const MyTextColorThemeExtension({
    required this.primaryText,
    required this.secondaryText,
    required this.tertiaryText,
    required this.disabledText,
    required this.accentText,
    required this.negativeText,
    required this.warningText,
    required this.successText,
  });

  @override
  MyTextColorThemeExtension copyWith({
    Color? primaryText,
    Color? secondaryText,
    Color? tertiaryText,
    Color? disabledText,
    Color? accentText,
    Color? negativeText,
    Color? warningText,
    Color? successText,
  }) {
    return MyTextColorThemeExtension(
      primaryText: primaryText ?? this.primaryText,
      secondaryText: secondaryText ?? this.secondaryText,
      tertiaryText: tertiaryText ?? this.tertiaryText,
      disabledText: disabledText ?? this.disabledText,
      accentText: accentText ?? this.accentText,
      negativeText: negativeText ?? this.negativeText,
      warningText: warningText ?? this.warningText,
      successText: successText ?? this.successText,
    );
  }

  @override
  MyTextColorThemeExtension lerp(
      ThemeExtension<MyTextColorThemeExtension>? other, double t) {
    if (other is! MyTextColorThemeExtension) return this;
    return MyTextColorThemeExtension(
      primaryText: Color.lerp(primaryText, other.primaryText, t)!,
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t)!,
      tertiaryText: Color.lerp(tertiaryText, other.tertiaryText, t)!,
      disabledText: Color.lerp(disabledText, other.disabledText, t)!,
      accentText: Color.lerp(accentText, other.accentText, t)!,
      negativeText: Color.lerp(negativeText, other.negativeText, t)!,
      warningText: Color.lerp(warningText, other.warningText, t)!,
      successText: Color.lerp(successText, other.successText, t)!,
    );
  }
}
