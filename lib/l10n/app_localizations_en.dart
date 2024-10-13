import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get reviewDialogTitle => 'Did you like the app?';

  @override
  String get reviewDialogText => 'Would you like to leave a review?';

  @override
  String get reviewLeftTitle => 'Review left';

  @override
  String get buttonYes => 'Yes';

  @override
  String get buttonNo => 'No';
}
