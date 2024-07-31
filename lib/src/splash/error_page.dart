import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key, required this.error});
  final Object error;

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.error.toString(),
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Restart.restartApp();
              },
              child: const Text('Перезапустить приложение'),
            ),
          ],
        ),
      ),
    );
  }
}
