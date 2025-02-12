import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../l10n/app_localizations.dart';

const _hasReviewedKey = 'hasReviewed';
const _attemptCountKey = 'attemptCount';

extension RateAppStarsDialogX on BuildContext {
  void showStarsReviewDialog({
    Function()? onHasReviewed,
    int showAfterAttempts = 0,
    bool isDebug = false,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final hasReviewed = prefs.getBool(_hasReviewedKey) ?? false;
    if (hasReviewed && !isDebug) {
      onHasReviewed?.call();
      return;
    }

    int attemptCount = prefs.getInt(_attemptCountKey) ?? 0;
    attemptCount++;
    await prefs.setInt(_attemptCountKey, attemptCount);

    if (attemptCount < showAfterAttempts) {
      log('Недостаточно попыток для показа диалога');
      return;
    } else {
      await prefs.setInt(_attemptCountKey, 0);
    }

    await prefs.setBool(_hasReviewedKey, true);

    showDialog(
      context: this,
      builder: (context) => _StarsRatingDialog(
        onRatingSubmitted: (rating) async {
          if (rating >= 4) {
            final InAppReview inAppReview = InAppReview.instance;
            if (await inAppReview.isAvailable()) {
              inAppReview.requestReview();
            } else {
              inAppReview.openStoreListing();
            }
          } else {
            // Здесь можно добавить логику для низких оценок
            // Например, показать форму обратной связи
          }
        },
      ),
    );
  }
}

class _StarsRatingDialog extends StatefulWidget {
  const _StarsRatingDialog({
    super.key,
    required this.onRatingSubmitted,
  });

  final Function(int rating) onRatingSubmitted;

  @override
  State<_StarsRatingDialog> createState() => _StarsRatingDialogState();
}

class _StarsRatingDialogState extends State<_StarsRatingDialog> {
  int _selectedRating = -1;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(localizations.reviewDialogTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  localizations.reviewDialogSubtitle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => GestureDetector(
                onTapDown: (_) => setState(() => _selectedRating = index),
                onTapCancel: () => setState(() => _selectedRating = -1),
                onTapUp: (_) {
                  Navigator.pop(context);
                  widget.onRatingSubmitted(index + 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(
                    index <= _selectedRating
                        ? Icons.star_rounded
                        : Icons.star_border_rounded,
                    color: Colors.amber,
                    size: 48,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
