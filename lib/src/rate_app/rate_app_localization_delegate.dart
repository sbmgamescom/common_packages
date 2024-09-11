import 'package:common_packages/l10n/messages_all_locales.dart';
import 'package:common_packages/src/rate_app/rate_app_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {
  const MyLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ru'].contains(locale.languageCode);
  }

  @override
  Future<MyLocalizations> load(Locale locale) async {
    final String name = locale.languageCode;
    final String localeName = Intl.canonicalizedLocale(name);

    // Загрузка перевода для текущего локаля
    await initializeMessages(localeName);
    Intl.defaultLocale = localeName;
    return MyLocalizations();
  }

  @override
  bool shouldReload(LocalizationsDelegate<MyLocalizations> old) => false;
}
