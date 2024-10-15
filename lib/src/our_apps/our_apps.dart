import 'dart:developer';

import 'package:common_packages/l10n/app_localizations.dart';
import 'package:common_packages/src/dialogs/actions_alert_dialogs.dart';
import 'package:common_packages/src/utils/open_url.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _ourAppsKey = 'hasOurApps';
const _ourAppsAttemptCountKey = 'hasOurAppsCount';

extension OurAppsX on BuildContext {
  void showOurAppsDialog({
    Function()? onHasReviewed,
    int showAfterAttempts = 0,
    bool isDebug = false,
  }) async {
    final localizations = AppLocalizations.of(this)!; // Локализованные строки

    final prefs = await SharedPreferences.getInstance();
    final hasReviewed = prefs.getBool(_ourAppsKey) ?? false;
    if (hasReviewed && !isDebug) {
      onHasReviewed?.call();
      return;
    }
    int attemptCount = prefs.getInt(_ourAppsAttemptCountKey) ?? 0;
    attemptCount++;
    await prefs.setInt(_ourAppsAttemptCountKey, attemptCount);

    // Проверяем, достиг ли счетчик заданного количества попыток
    if (attemptCount < showAfterAttempts) {
      // Если нет, просто возвращаемся
      log('Если нет, просто возвращаемся');
      return;
    } else {
      await prefs.setInt(_ourAppsAttemptCountKey, 0);
    }

    // Помечаем, что диалог был показан
    await prefs.setBool(_ourAppsKey, true);

    showDialog(
      context: this,
      builder: (BuildContext context) {
        return _AlertDialog(
          imageUrl: 'assets/images/discord.png',
          title: 'Хотите ознакомиться с нашими другими приложениями?',
          successOnPressed: () {
            openStringUrl(
              url:
                  'https://play.google.com/store/apps/dev?id=9203862170370327275',
            );
          },
        );
      },
    );
  }
}

class _AlertDialog extends StatelessWidget {
  const _AlertDialog({
    super.key,
    this.imageUrl,
    required this.title,
    this.successOnPressed,
  });
  final String? imageUrl;
  final String title;
  final Function()? successOnPressed;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return ActionsAlertDialog(
      imageUrl: imageUrl,
      title: title,
      noButton: (
        title: localizations.buttonNo,
        onPressed: () {
          Navigator.pop(context);
        }
      ),
      yesButton: (
        title: localizations.buttonYes,
        onPressed: () {
          Navigator.of(context).pop();
          successOnPressed?.call();
        }
      ),
    );
  }
}
