import 'package:flutter/material.dart';

class ShowHelpButton extends StatelessWidget {
  const ShowHelpButton({
    super.key,
    this.iconWidget,
    required this.content,
    required this.title,
    this.close,
  });

  final Widget? iconWidget;
  final Widget content;
  final Widget? title;
  final Widget? close;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: iconWidget ?? const Icon(Icons.help_outline),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: title,
              content: content,
              actions: [
                TextButton(
                  child: close ?? const Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
