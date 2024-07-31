import 'package:common_packages/src/splash/error_page.dart';
import 'package:flutter/material.dart';

class SplashScope extends StatefulWidget {
  const SplashScope({
    super.key,
    required this.init,
    required this.goPage,
    this.showAppBar = false,
  });

  final Future<void> init;
  final Widget goPage;

  final bool showAppBar;

  @override
  State<SplashScope> createState() => _SplashScopeState();
}

class _SplashScopeState extends State<SplashScope> {
  late Widget _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = Scaffold(
      appBar: widget.showAppBar ? AppBar() : null,
      body: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 8,
        ),
      ),
    );
    widget.init.then(
      (value) {
        setState(() {
          _currentPage = widget.goPage;
        });
      },
    ).catchError(
      (error) {
        setState(() {
          _currentPage = ErrorPage(
            error: error,
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _currentPage;
  }
}
