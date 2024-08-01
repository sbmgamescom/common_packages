import 'package:flutter/material.dart';

class AppButton extends ElevatedButton {
  final bool isLoading;
  final Widget? childLoading;

  const AppButton({
    super.key,
    required VoidCallback? onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    Clip super.clipBehavior = Clip.none,
    required Widget child,
    this.isLoading = false,
    this.childLoading,
  }) : super(
          onPressed: isLoading ? null : onPressed,
          child: isLoading
              ? childLoading ??
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2.0,
                    ),
                  )
              : child,
        );
}
