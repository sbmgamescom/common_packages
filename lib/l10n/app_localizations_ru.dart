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
  String get buttonYes => 'Оценить';

  @override
  String get buttonNo => 'Нет, спасибо';

  @override
  String get reviewDialogSubtitle => 'Мы всегда рады обратной связи! Если вам нравится наше приложение, оцените его в магазине. Нам это очень важно!';

  @override
  String get ourAppsTitle => 'Попробуйте другие наши приложения!';

  @override
  String get ourNoButton => 'Нет';

  @override
  String get ourYesButton => 'Да, давайте!';
}
