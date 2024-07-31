import 'package:common_packages/src/app_message/app_snack_bar.dart';
import 'package:flutter/material.dart';

class AppMessage extends StatefulWidget {
  const AppMessage({super.key, required this.child});
  final Widget child;

  static _AppMessageState? _instance;

  static void error(String message) {
    _instance?.showError(message);
  }

  static void common(String message) {
    _instance?.showCommon(message);
  }

  static void success(String message) {
    _instance?.showSuccess(message);
  }

  @override
  State<AppMessage> createState() => _AppMessageState();
}

class _AppMessageState extends State<AppMessage> {
  @override
  void initState() {
    super.initState();
    AppMessage._instance = this;
  }

  @override
  void dispose() {
    AppMessage._instance = null;
    super.dispose();
  }

  void showError(String message) {
    AppSnackbar.error(
      context,
      message: message,
    );
  }

  void showCommon(String message) {
    AppSnackbar.common(
      context,
      message: message,
    );
  }

  void showSuccess(String message) {
    AppSnackbar.success(
      context,
      message: message,
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
