import 'package:flutter/material.dart';

extension TextX on Text {
  Text _copyWith({TextStyle? newStyle}) {
    return Text(
      data!,
      style: (style ?? const TextStyle()).merge(newStyle),
      key: key,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      selectionColor: selectionColor,
      textHeightBehavior: textHeightBehavior,
      textScaler: textScaler,
      textWidthBasis: textWidthBasis,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      strutStyle: strutStyle,
    );
  }

  Text h1() => _copyWith(newStyle: const TextStyle(fontSize: 32));
  Text h2() => _copyWith(newStyle: const TextStyle(fontSize: 24));
  Text h3() => _copyWith(newStyle: const TextStyle(fontSize: 20));
  Text h4() => _copyWith(newStyle: const TextStyle(fontSize: 18));
  Text body() => _copyWith(newStyle: const TextStyle(fontSize: 16));
  Text small() => _copyWith(newStyle: const TextStyle(fontSize: 14));
  Text verySmall() => _copyWith(newStyle: const TextStyle(fontSize: 12));
}
