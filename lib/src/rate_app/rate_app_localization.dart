import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// 1.  dart run intl_translation:extract_to_arb --output-dir=lib/l10n lib/src/rate_app/rate_app_localization.dart
/// 2   dart run intl_translation:generate_from_arb --output-dir=lib/l10n --no-use-deferred-loading lib/src/rate_app/rate_app_localization.dart lib/l10n/intl_*.arb
///

class MyLocalizations {
  static MyLocalizations of(BuildContext context) {
    return Localizations.of<MyLocalizations>(context, MyLocalizations)!;
  }

  String get reviewDialogTitle =>
      Intl.message('Did you like the app?', name: 'reviewDialogTitle');
  String get reviewDialogText =>
      Intl.message('Would you like to leave a review?',
          name: 'reviewDialogText');
  String get reviewLeftTitle =>
      Intl.message('Review left', name: 'reviewLeftTitle');
  String get buttonYes => Intl.message('Yes', name: 'buttonYes');
  String get buttonNo => Intl.message('No', name: 'buttonNo');
}
