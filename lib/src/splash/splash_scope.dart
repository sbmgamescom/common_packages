import 'package:flutter/material.dart';

class SplashScope extends StatefulWidget {
  const SplashScope({
    super.key,
    required this.init,
    required this.goPage,
    required this.errorPage,
  });

  final Future<void> init;
  final Widget goPage;
  final Widget Function(Object error) errorPage;

  @override
  State<SplashScope> createState() => _SplashScopeState();
}

class _SplashScopeState extends State<SplashScope> {
  @override
  void initState() {
    super.initState();
    widget.init.then(
      (value) {
        _goToPage(widget.goPage);
      },
    ).catchError(
      (error) {
        _goToError(widget.errorPage(error));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 8,
        ),
      ),
    );
  }

  void _goToPage(Widget page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void _goToError(Widget errorPage) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => errorPage),
    );
  }
}
