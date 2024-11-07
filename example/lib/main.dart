import 'package:common_packages/exports.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          //defualt colors all Text
          bodyMedium: TextStyle(
            color: MyTextThemeExtensions.light.primaryText,
            fontSize: 16,
          ),
        ),
        extensions: [
          MyTextThemeExtensions.light.copyWith(),
        ],
      ),
      home: Builder(
        builder: (context) {
          return Scaffold(
            body: Center(
              child: Column(
                children: [
                  const Text('Hello World!'),
                  const Text(
                    'Hello World!',
                  ).h1().tertiary(context),
                  const Text(
                    'Hello World!',
                    style: TextStyle(color: Colors.red),
                  ).h1().accent(context),
                  const Text(
                    'Hello World!',
                  ).small().primary(context),
                  const Text(
                    'Hello World!',
                  ).verySmall(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
