import 'dart:async';

import 'package:flutter/material.dart';

typedef AsyncCallback = FutureOr<void> Function();

enum IconPosition { left, right }

class AppAsyncButton extends StatefulWidget {
  const AppAsyncButton({
    super.key,
    required this.onPressed,
    this.title,
    this.icon,
    this.iconPosition = IconPosition.left,
    this.style,
    this.loaderColor,
    this.loaderStrokeWidth = 2.0,
    this.loaderSize = 24.0,
    this.minimumWidth = double.infinity,
    this.height = 48.0,
    this.borderRadius = 12.0,
    this.child,
    this.textStyle,
  });

  /// Асинхронный коллбэк.
  final AsyncCallback? onPressed;
  final Widget? child;

  /// Текст кнопки.
  final String? title;
  final TextStyle? textStyle;

  /// Иконка кнопки.
  final IconData? icon;

  /// Позиция иконки: слева или справа.
  final IconPosition iconPosition;

  /// Кастомный стиль кнопки.
  final ButtonStyle? style;

  /// Настройки лоадера.
  final Color? loaderColor;
  final double loaderStrokeWidth;
  final double loaderSize;

  /// Размеры кнопки.
  final double minimumWidth;
  final double height;

  /// Скругление углов.
  final double borderRadius;

  @override
  State<AppAsyncButton> createState() => _AppAsyncButtonState();
}

class _AppAsyncButtonState extends State<AppAsyncButton> {
  bool isLoading = false;

  Future<void> _handlePressed() async {
    if (widget.onPressed == null) return;
    setState(() => isLoading = true);
    try {
      await widget.onPressed!();
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final onPressed = isLoading ? null : _handlePressed;

    final child = switch (isLoading) {
      true => SizedBox(
          width: widget.loaderSize,
          height: widget.loaderSize,
          child: CircularProgressIndicator(
            color: widget.loaderColor,
            strokeWidth: widget.loaderStrokeWidth,
          ),
        ),
      false => widget.child ?? _buildContent(),
    };

    return ElevatedButton(
      onPressed: onPressed,
      style: widget.style ??
          ElevatedButton.styleFrom(
            minimumSize: Size(widget.minimumWidth, widget.height),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
          ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: child,
        ),
        child: child,
      ),
    );
  }

  Widget _buildContent() {
    if (widget.title == null && widget.icon == null) {
      return const SizedBox.shrink();
    }

    final textWidget = widget.title != null
        ? Text(
            widget.title!,
            style: widget.textStyle ?? const TextStyle(fontSize: 16),
          )
        : const SizedBox.shrink();
    final iconWidget =
        widget.icon != null ? Icon(widget.icon) : const SizedBox.shrink();

    return switch ((widget.icon, widget.title, widget.iconPosition)) {
      (null, String(), _) => textWidget,
      (IconData(), null, _) => iconWidget,
      (IconData(), String(), IconPosition.left) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            iconWidget,
            const SizedBox(width: 8),
            textWidget,
          ],
        ),
      (IconData(), String(), IconPosition.right) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            textWidget,
            const SizedBox(width: 8),
            iconWidget,
          ],
        ),
      _ => const SizedBox.shrink(),
    };
  }
}
