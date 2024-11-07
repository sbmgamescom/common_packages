import 'package:flutter/material.dart';

extension TextX on Text {
  Text h1({Color color = Colors.black}) {
    return Text(
      data!,
      style: style?.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }

  Text h2({Color color = Colors.black}) {
    return Text(
      data!,
      style: style?.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }
}
