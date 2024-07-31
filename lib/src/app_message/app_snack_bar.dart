import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppSnackbar {
  static void error(BuildContext context, {required String message}) {
    return _AppSnackbar.show(
      context,
      message: message,
      type: _SnackbarType.error,
    );
  }

  static void common(BuildContext context, {required String message}) {
    return _AppSnackbar.show(
      context,
      message: message,
      type: _SnackbarType.common,
    );
  }

  static void success(BuildContext context, {required String message}) {
    return _AppSnackbar.show(
      context,
      message: message,
      type: _SnackbarType.success,
    );
  }
}

enum _SnackbarType {
  common,
  error,
  success,
}

class _AppSnackbar {
  static void show(
    BuildContext context, {
    required String message,
    required _SnackbarType type,
    FlashPosition? flashPosition,
  }) {
    var snackbarConfig = _getSnackbarConfig(context, type);

    context.showFlash<bool>(
      barrierDismissible: true,
      duration: const Duration(seconds: 2),
      builder: (context, controller) => FlashBar(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
        position: flashPosition ?? FlashPosition.top,
        controller: controller,
        behavior: FlashBehavior.floating,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        elevation: 0,
        margin: const EdgeInsets.all(16.0),
        clipBehavior: Clip.antiAlias,
        icon: SvgPicture.asset(
          "assets/icons/info.svg",
          package: 'common_packages',
          height: 24,
          width: 24,
          colorFilter:
              ColorFilter.mode(snackbarConfig.contentColor, BlendMode.srcIn),
        ),
        content: Text(
          message,
          style: TextStyle(color: snackbarConfig.contentColor),
        ),
        primaryAction: IconButton(
          onPressed: () {
            controller.dismiss();
          },
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
        backgroundColor: snackbarConfig.backgroundColor,
      ),
    );
  }

  static _SnackbarConfig _getSnackbarConfig(
      BuildContext context, _SnackbarType type) {
    switch (type) {
      case _SnackbarType.error:
        return _SnackbarConfig(
          backgroundColor: Colors.red.shade300,
          // contentColor: Colors.red.shade200,
          contentColor: Colors.white,
        );
      case _SnackbarType.success:
        return _SnackbarConfig(
          backgroundColor: Colors.green.shade300,
          // contentColor: Colors.green.shade200,
          contentColor: Colors.white,
        );
      case _SnackbarType.common:
        return _SnackbarConfig(
          backgroundColor: Colors.orange.shade300,
          // contentColor: Colors.orange.shade200,
          contentColor: Colors.white,
        );
      default:
        return _SnackbarConfig(
          backgroundColor: Colors.orange.shade300,
          // contentColor: Colors.orange.shade200,
          contentColor: Colors.white,
        );
    }
  }
}

class _SnackbarConfig {
  final Color backgroundColor;
  final Color contentColor;

  _SnackbarConfig({
    required this.backgroundColor,
    required this.contentColor,
  });
}
