import 'dart:developer';

import 'package:common_packages/src/dialogs/actions_alert_dialogs.dart';
import 'package:common_packages/src/rate_app/rate_app_localization.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension ReviewX on BuildContext {
  void showReviewDialog({
    Function()? onHasReviewed,
    int showAfterAttempts = 0,
    bool isDebug = false,
  }) async {
    final localizations = MyLocalizations.of(this); // Локализованные строки

    final prefs = await SharedPreferences.getInstance();
    final hasReviewed = prefs.getBool('hasReviewed') ?? false;
    if (hasReviewed && !isDebug) {
      onHasReviewed?.call();
      return;
    }
    int attemptCount = prefs.getInt('attemptCount') ?? 0;
    attemptCount++;
    await prefs.setInt('attemptCount', attemptCount);

    // Проверяем, достиг ли счетчик заданного количества попыток
    if (attemptCount < showAfterAttempts) {
      // Если нет, просто возвращаемся
      log('Если нет, просто возвращаемся');
      return;
    } else {
      await prefs.setInt('attemptCount', 0);
    }

    // Помечаем, что диалог был показан
    await prefs.setBool('hasReviewed', true);

    showDialog(
      context: this,
      builder: (BuildContext context) {
        return _AlertDialog(
          imageUrl: 'assets/images/like.png',
          title: localizations.reviewDialogTitle,
          successOnPressed: () {
            _showSecondDialog();
          },
        );
      },
    );
  }

  void _showSecondDialog() {
    final localizations = MyLocalizations.of(this);

    showDialog(
      context: this,
      builder: (BuildContext context) {
        return _AlertDialog(
          imageUrl: 'assets/images/heart.png',
          title: localizations.reviewDialogText,
          successOnPressed: () async {
            requestReview();
          },
        );
      },
    );
  }

  Future<void> requestReview() async {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    } else {
      inAppReview.openStoreListing();
    }
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
    final localizations = MyLocalizations.of(context);

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
