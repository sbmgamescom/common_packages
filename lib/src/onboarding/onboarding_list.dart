import 'package:common_packages/src/onboarding/onboarding_item.dart';
import 'package:flutter/material.dart';

import 'onboarding_service.dart';

class OnboardingList extends StatefulWidget {
  const OnboardingList({
    super.key,
    required this.pages,
    required this.doneOnPressed,
    required this.skipOnPressed,
    this.skipWidget,
    this.nextWidget,
    this.doneWidget,
  });
  final List<OnboardingItem> pages;
  final VoidCallback doneOnPressed;
  final VoidCallback skipOnPressed;
  final Widget? skipWidget;
  final Widget? nextWidget;
  final Widget? doneWidget;
  // final double? itemHeight;

  @override
  State<OnboardingList> createState() => _OnboardingListState();
}

class _OnboardingListState extends State<OnboardingList> {
  final PageController _pageController = PageController();
  final OnboardingService onboardingService = OnboardingService();
  int _currentPage = 0;

  late final List<OnboardingItem> _pages = widget.pages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              // final page = OnboardingItem(
              //   image: _pages[index].image,
              //   title: _pages[index].title,
              //   description: _pages[index].description,
              // );
              return _pages[index];
            },
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black12,
                      textStyle: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      _pageController.animateToPage(
                        _pages.length - 1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                      onboardingService.setFirstOpen();
                      widget.skipOnPressed.call();
                    },
                    child: widget.skipWidget ?? const Text('SKIP'),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _pages.length,
                      (index) => _buildDot(index, context),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      textStyle: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      if (_currentPage == _pages.length - 1) {
                        onboardingService.setFirstOpen();
                        widget.doneOnPressed.call();
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: _currentPage == _pages.length - 1
                        ? widget.doneWidget ?? const Text('DONE')
                        : widget.nextWidget ?? const Text('NEXT'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.black : Colors.black12,
        shape: BoxShape.circle,
      ),
    );
  }
}
