import 'package:flutter/material.dart';

extension NavigatorContextX on BuildContext {
  void push(Widget page) {
    Navigator.of(this).push(MaterialPageRoute(
      builder: (BuildContext context) {
        return page;
      },
    ));
  }

  void pushReplacement(Widget page) {
    Navigator.pushReplacement(
        this, MaterialPageRoute(builder: (context) => page));
  }

  void pop() {
    Navigator.pop(this);
  }
}
