import 'package:flutter/material.dart';

class ActionsAlertDialog extends StatelessWidget {
  const ActionsAlertDialog({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.noButton,
    required this.yesButton,
  });

  final String? imageUrl;
  final String title;
  final ({String title, VoidCallback onPressed}) noButton;
  final ({String title, VoidCallback onPressed}) yesButton;

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
                  onPressed: noButton.onPressed,
                  child: Text(
                    noButton.title,
                    style: const TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                  onPressed: yesButton.onPressed,
                  child: Text(
                    yesButton.title,
                    style: const TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
