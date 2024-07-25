import 'package:common_packages/src/onboarding/onboarding_list.dart';
import 'package:flutter/material.dart';

import 'onboarding_service.dart';

class OnboardingScope extends StatefulWidget {
  const OnboardingScope({
    super.key,
    required this.child,
    required this.pages,
  });

  final Widget child;
  final List<Widget> pages;

  @override
  State<OnboardingScope> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<OnboardingScope> {
  final OnboardingService onboardingService = OnboardingService();
  late final List<Widget> _pages = widget.pages;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: onboardingService.isFirstOpen,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == true) {
            return widget.child;
          }
          return OnboardingList(
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
