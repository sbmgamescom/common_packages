import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

var _globalPaddingSetup = const EdgeInsets.all(16);
void setGlobalPadding(EdgeInsets padding) {
  _globalPaddingSetup = padding;
}

class GlobalPadding extends StatelessWidget {
  const GlobalPadding({
    super.key,
    required this.child,
    this.padding,
  });
  final Widget child;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? _globalPaddingSetup,
      child: child,
    );
  }
}
