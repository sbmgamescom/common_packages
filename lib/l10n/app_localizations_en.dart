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
  String get buttonYes => 'Rate now';

  @override
  String get buttonNo => 'No, thanks';

  @override
  String get reviewDialogSubtitle => 'We always appreciate your feedback! If you enjoy our app, please rate it in the app store. Your opinion means a lot to us!';

  @override
  String get ourAppsTitle => 'Try our other apps!';

  @override
  String get ourNoButton => 'No';

  @override
  String get ourYesButton => 'Yes, let\'s go!';
}
