import 'package:common_packages/src/text/text_theme_color_extension.dart';
import 'package:flutter/material.dart';

extension TextColorsX on Text {
  Text primary(BuildContext context) {
    return Text(
      data!,
      style: (style ?? const TextStyle()).copyWith(
        color: Theme.of(context)
            .extension<MyTextColorThemeExtension>()!
            .primaryText,
      ),
    );
  }

  Text secondary(BuildContext context) {
    return Text(
      data!,
      style: (style ?? const TextStyle()).copyWith(
        color: Theme.of(context)
            .extension<MyTextColorThemeExtension>()!
            .secondaryText,
      ),
    );
  }

  Text tertiary(BuildContext context) {
    return Text(
      data!,
      style: (style ?? const TextStyle()).copyWith(
        color: Theme.of(context)
            .extension<MyTextColorThemeExtension>()!
            .tertiaryText,
      ),
    );
  }

  Text disabled(BuildContext context) {
    return Text(
      data!,
      style: (style ?? const TextStyle()).copyWith(
        color: Theme.of(context)
            .extension<MyTextColorThemeExtension>()!
            .disabledText,
      ),
    );
  }

  Text accent(BuildContext context) {
    return Text(
      data!,
      style: (style ?? const TextStyle()).copyWith(
        color: Theme.of(context)
            .extension<MyTextColorThemeExtension>()!
            .accentText,
      ),
    );
  }

  Text negative(BuildContext context) {
    return Text(
      data!,
      style: (style ?? const TextStyle()).copyWith(
        color: Theme.of(context)
            .extension<MyTextColorThemeExtension>()!
            .negativeText,
      ),
    );
  }

  Text warning(BuildContext context) {
    return Text(
      data!,
      style: (style ?? const TextStyle()).copyWith(
        color: Theme.of(context)
            .extension<MyTextColorThemeExtension>()!
            .warningText,
      ),
    );
  }

  Text success(BuildContext context) {
    return Text(
      data!,
      style: (style ?? const TextStyle()).copyWith(
        color: Theme.of(context)
            .extension<MyTextColorThemeExtension>()!
            .successText,
      ),
    );
  }
}
