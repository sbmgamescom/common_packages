import 'package:flutter/material.dart';
// import 'package:in_app_review/in_app_review.dart';

extension ReviewX on BuildContext {
  // final InAppReview _inAppReview = InAppReview.instance;

  void showReviewDialog() {
    showDialog(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: SizedBox(
            height: 100,
            child: Image.asset(
              'assets/images/like.png',
              package: 'common_packages',
            ),
          ),
          title: const Text(
            'Вам понравилось приложение?',
            textAlign: TextAlign.center,
          ),
          // titleTextStyle: const TextStyle(
          //     fontWeight: FontWeight.bold, color: Colors.black87),
          actionsAlignment: MainAxisAlignment.center,
          contentPadding: const EdgeInsets.all(20), // Добавляем отступы
          actions: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50, // Устанавливаем фиксированную высоту кнопок
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent.shade200,
                      ),
                      child: const Text(
                        'Нет',
                        style: TextStyle(fontSize: 19, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 10), // Промежуток между кнопками
                Expanded(
                  child: SizedBox(
                    height: 50, // Устанавливаем фиксированную высоту кнопок
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent.shade200,
                      ),
                      child: const Text(
                        'Да',
                        style: TextStyle(fontSize: 19, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        _showSecondDialog();
                      },
                    ),
                  ),
                ),
              ],
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
          actions: [
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
