import 'package:flutter/material.dart';
// import 'package:in_app_review/in_app_review.dart';

extension ReviewX on BuildContext {
  // final InAppReview _inAppReview = InAppReview.instance;

  void showReviewDialog() {
    showDialog(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Вам понравилось приложение?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Нет'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Да'),
              onPressed: () {
                Navigator.of(context).pop();
                _showSecondDialog();
              },
            ),
          ],
        );
      },
    );
  }

  void _showSecondDialog() {
    showDialog(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Не хотите оставить отзыв?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Нет'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Да'),
              onPressed: () {
                Navigator.of(context).pop();
                requestReview();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> requestReview() async {
    // if (await _inAppReview.isAvailable()) {
    //   _inAppReview.requestReview();
    // } else {
    //   _inAppReview.openStoreListing();
    // }
    print('review');
  }
}
