import 'dart:developer';
import 'package:common_packages/l10n/app_localizations.dart';
import 'package:common_packages/src/utils/open_url.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _ourAppsKey = 'hasOurApps';
const _ourAppsAttemptCountKey = 'hasOurAppsCount';

extension OurAppsExtension on BuildContext {
  void showOurAppsBottomSheet({
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
      log('Попыток пока недостаточно для показа BottomSheet');
      return;
    } else {
      await prefs.setInt(_ourAppsAttemptCountKey, 0);
    }

    // Помечаем, что BottomSheet был показан
    await prefs.setBool(_ourAppsKey, true);

    // Показать BottomSheet вместо диалога
    showModalBottomSheet(
      context: this,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      isScrollControlled: true,
      isDismissible: false,
      builder: (BuildContext context) {
        return _OurAppsBottomSheet(
          imageUrl: 'assets/images/like.png',
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

class _OurAppsBottomSheet extends StatelessWidget {
  const _OurAppsBottomSheet({
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

    const bottomTextStyle = const TextStyle(
      fontSize: 19,
      color: Colors.black,
      // fontWeight: FontWeight.bold,
    );
    const textStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    );
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 5,
            margin: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 10),
          if (imageUrl != null)
            SizedBox(
              height: 100,
              child: Image.asset(
                imageUrl!,
                package: 'common_packages',
              ),
            ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: textStyle,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade200,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      localizations.buttonNo,
                      style: bottomTextStyle,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade200,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      successOnPressed?.call();
                    },
                    child: Text(
                      localizations.buttonYes,
                      style: bottomTextStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
