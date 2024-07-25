import 'package:common_packages/src/onboarding/onboarding_item.dart';
import 'package:common_packages/src/onboarding/onboarding_list.dart';
import 'package:flutter/material.dart';

import 'onboarding_service.dart';

class OnboardingScope extends StatefulWidget {
  const OnboardingScope({super.key, required this.child});

  final Widget child;

  @override
  State<OnboardingScope> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<OnboardingScope> {
  final OnboardingService onboardingService = OnboardingService();

  final List<Widget> _pages = [
    const OnboardingItem(
      image: 'assets/images/1.jpg',
      title: 'Добро пожаловать',
      description:
          'Добро пожаловать в наше приложение! Зарабатывайте коины, играя в игры.',
    ),
    const OnboardingItem(
      image: 'assets/images/1.jpg',
      title: 'Играй и зарабатывай',
      description: 'Проходите игры и задания, чтобы зарабатывать коины.',
    ),
    const OnboardingItem(
      image: 'assets/images/1.jpg',
      title: 'Инвестируй и получай прибыль',
      description:
          'Используйте коины для покупки ферм, которые приносят реальные деньги со временем.',
    ),
    const OnboardingItem(
      image: 'assets/images/1.jpg',
      title: 'Собирайте доход',
      description:
          'Регулярно собирайте свои заработки и наслаждайтесь прибылью!',
    ),
  ];

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
