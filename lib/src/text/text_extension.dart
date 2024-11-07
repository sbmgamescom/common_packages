import 'package:flutter/material.dart';

extension TextX on Text {
  Text h1() {
    return Text(
      data!,
      style: (style ?? const TextStyle()).copyWith(
        fontSize: 32,
      ),
    );
  }

  Text h2() {
    return Text(
      data!,
      style: (style ?? const TextStyle()).copyWith(
        fontSize: 24,
      ),
    );
  }

  Text h3() {
    return Text(
      data!,
      style: (style ?? const TextStyle()).copyWith(
        fontSize: 20,
      ),
    );
  }

  Text h4() {
    return Text(
      data!,
      style: (style ?? const TextStyle()).copyWith(
        fontSize: 18,
      ),
    );
  }

  Text body() {
    return Text(
      data!,
      style: (style ?? const TextStyle()).copyWith(
        fontSize: 16,
      ),
    );
  }

  Text small() {
    return Text(
      data!,
      style: (style ?? const TextStyle()).copyWith(
        fontSize: 14,
      ),
    );
  }

  Text verySmall() {
    return Text(
      data!,
      style: (style ?? const TextStyle()).copyWith(
        fontSize: 12,
      ),
    );
  }
}
