import 'package:flutter/material.dart';

extension TextWeightX on Text {
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

  Text italic() =>
      _copyWith(newStyle: const TextStyle(fontStyle: FontStyle.italic));
  Text bold() =>
      _copyWith(newStyle: const TextStyle(fontWeight: FontWeight.bold));
  Text w100() =>
      _copyWith(newStyle: const TextStyle(fontWeight: FontWeight.w100));
  Text w200() =>
      _copyWith(newStyle: const TextStyle(fontWeight: FontWeight.w200));
  Text w300() =>
      _copyWith(newStyle: const TextStyle(fontWeight: FontWeight.w300));
  Text w400() =>
      _copyWith(newStyle: const TextStyle(fontWeight: FontWeight.w400));
  Text w500() =>
      _copyWith(newStyle: const TextStyle(fontWeight: FontWeight.w500));
  Text w600() =>
      _copyWith(newStyle: const TextStyle(fontWeight: FontWeight.w600));
  Text w700() =>
      _copyWith(newStyle: const TextStyle(fontWeight: FontWeight.w700));
  Text w800() =>
      _copyWith(newStyle: const TextStyle(fontWeight: FontWeight.w800));
  Text w900() =>
      _copyWith(newStyle: const TextStyle(fontWeight: FontWeight.w900));
}
