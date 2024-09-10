import 'package:flutter/material.dart';

class StandardBottomSheet extends StatelessWidget {
  final String title;
  final Widget content;
  final String closeButtonText;

  const StandardBottomSheet({
    Key? key,
    required this.title,
    required this.content,
    this.closeButtonText = "Close",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Заголовок
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Основной контент
          content,
          const SizedBox(height: 16),

          // Кнопка закрытия
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(closeButtonText),
          ),
        ],
      ),
    );
  }
}
