import 'package:flutter/material.dart';
// import 'package:in_app_review/in_app_review.dart';

extension ReviewX on BuildContext {
  // final InAppReview _inAppReview = InAppReview.instance;

  void showReviewDialog() {
    showDialog(
      context: this,
      builder: (BuildContext context) {
        return _AlertDialog(
          imageUrl: 'assets/images/like.png',
          title: 'Вам понравилось приложение?',
          successOnPressed: () {
            _showSecondDialog();
          },
        );
      },
    );
  }

  void _showSecondDialog() {
    showDialog(
      context: this,
      builder: (BuildContext context) {
        return _AlertDialog(
          imageUrl: 'assets/images/heart.png',
          title: 'Не хотите оставить отзыв?',
          successOnPressed: () {
            requestReview();
          },
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
    return AlertDialog(
      icon: SizedBox(
        height: 100,
        child: imageUrl != null
            ? Image.asset(
                imageUrl!,
                package: 'common_packages',
              )
            : null,
      ),
      title: Text(
        title,
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
                    backgroundColor: Colors.red.shade200,
                  ),
                  child: const Text(
                    'Нет',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
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
                    backgroundColor: Colors.green.shade200,
                  ),
                  child: const Text(
                    'Да',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    successOnPressed?.call();
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
