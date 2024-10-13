import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get reviewDialogTitle => 'Вам понравилось приложение?';

  @override
  String get reviewDialogText => 'Не хотите оставить отзыв?';

  @override
  String get reviewLeftTitle => 'Отзыв оставлен';

  @override
  String get buttonYes => 'Да';

  @override
  String get buttonNo => 'Нет';
}
