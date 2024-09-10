import 'package:flutter/material.dart';

extension BottomSheetExtension on BuildContext {
  Future<T?> showCustomBottomSheet<T>({
    required WidgetBuilder builder,
    bool isDismissible = true,
    bool enableDrag = true,
    Color? backgroundColor,
  }) {
    return showModalBottomSheet<T>(
      context: this,
      builder: builder,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: backgroundColor,
    );
  }
}
