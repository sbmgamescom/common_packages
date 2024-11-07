import 'package:flutter/material.dart';

extension TextWidthX on Text {
  Text italic() {
    return Text(
      data!,
      style: (style ?? const TextStyle()).copyWith(
        fontStyle: FontStyle.italic,
      ),
    );
  }

  Text bold() {
    return Text(
      data!,
      style: (style ?? const TextStyle()).copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text w100() {
    return Text(
      data!,
      style: (style ?? const TextStyle()).copyWith(
        fontWeight: FontWeight.w100,
      ),
    );
  }

  Text w200() {
    return Text(
      data!,
      style: (style ?? const TextStyle()).copyWith(
        fontWeight: FontWeight.w200,
      ),
    );
  }

  Text w300() {
    return Text(
      data!,
      style: (style ?? const TextStyle()).copyWith(
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Text w400() {
    return Text(
      data!,
      style: (style ?? const TextStyle()).copyWith(
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Text w500() {
    return Text(
      data!,
      style: (style ?? const TextStyle()).copyWith(
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Text w600() {
    return Text(
      data!,
      style: (style ?? const TextStyle()).copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Text w700() {
    return Text(
      data!,
      style: (style ?? const TextStyle()).copyWith(
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Text w800() {
    return Text(
      data!,
      style: (style ?? const TextStyle()).copyWith(
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Text w900() {
    return Text(
      data!,
      style: (style ?? const TextStyle()).copyWith(
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
