import 'package:common_packages/src/text/text_theme_color_extension.dart';
import 'package:flutter/material.dart';

extension TextColorsX on Text {
  Text _copyWith(BuildContext? context, {Color? color}) {
    return Text(
      data!,
      style: (style ?? const TextStyle()).copyWith(color: color),
      key: key,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      strutStyle: strutStyle,
      selectionColor: selectionColor,
      textHeightBehavior: textHeightBehavior,
      textScaler: textScaler,
      textWidthBasis: textWidthBasis,
    );
  }

  Text primary(BuildContext context) {
    return _copyWith(
      context,
      color:
          Theme.of(context).extension<MyTextColorThemeExtension>()!.primaryText,
    );
  }

  Text secondary(BuildContext context) {
    return _copyWith(
      context,
      color: Theme.of(context)
          .extension<MyTextColorThemeExtension>()!
          .secondaryText,
    );
  }

  Text tertiary(BuildContext context) {
    return _copyWith(
      context,
      color: Theme.of(context)
          .extension<MyTextColorThemeExtension>()!
          .tertiaryText,
    );
  }

  Text disabled(BuildContext context) {
    return _copyWith(
      context,
      color: Theme.of(context)
          .extension<MyTextColorThemeExtension>()!
          .disabledText,
    );
  }

  Text accent(BuildContext context) {
    return _copyWith(
      context,
      color:
          Theme.of(context).extension<MyTextColorThemeExtension>()!.accentText,
    );
  }

  Text negative(BuildContext context) {
    return _copyWith(
      context,
      color: Theme.of(context)
          .extension<MyTextColorThemeExtension>()!
          .negativeText,
    );
  }

  Text warning(BuildContext context) {
    return _copyWith(
      context,
      color:
          Theme.of(context).extension<MyTextColorThemeExtension>()!.warningText,
    );
  }

  Text success(BuildContext context) {
    return _copyWith(
      context,
      color:
          Theme.of(context).extension<MyTextColorThemeExtension>()!.successText,
    );
  }

  Text white() {
    return _copyWith(
      null,
      color: Colors.white,
    );
  }
}
