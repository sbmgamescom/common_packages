import 'package:common_packages/exports.dart';
import 'package:flutter/material.dart';

class OnboardingScope extends StatefulWidget {
  const OnboardingScope({
    super.key,
    required this.child,
    required this.pages,
    this.skipWidget,
    this.nextWidget,
    this.doneWidget,
    this.show,
  });

  final Widget child;
  final List<OnboardingItem> pages;
  final Widget? skipWidget;
  final Widget? nextWidget;
  final Widget? doneWidget;
  final bool? show;

  @override
  State<OnboardingScope> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<OnboardingScope> {
  final OnboardingService onboardingService = OnboardingService();
  late final List<OnboardingItem> _pages = widget.pages;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: onboardingService.isFirstOpen,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == true && widget.show != true) {
            return widget.child;
          }
          return OnboardingList(
            skipWidget: widget.skipWidget,
            doneWidget: widget.doneWidget,
            nextWidget: widget.nextWidget,
            pages: _pages,
            doneOnPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => widget.child),
                (Route<dynamic> route) => false,
              );
            },
            skipOnPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => widget.child),
                (Route<dynamic> route) => false,
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
