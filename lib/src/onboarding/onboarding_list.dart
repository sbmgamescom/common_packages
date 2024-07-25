import 'package:flutter/material.dart';

import 'onboarding_service.dart';

class OnboardingList extends StatefulWidget {
  const OnboardingList({
    super.key,
    required this.pages,
    required this.doneOnPressed,
    required this.skipOnPressed,
  });
  final List<Widget> pages;
  final VoidCallback doneOnPressed;
  final VoidCallback skipOnPressed;

  @override
  State<OnboardingList> createState() => _OnboardingListState();
}

class _OnboardingListState extends State<OnboardingList> {
  final PageController _pageController = PageController();
  final OnboardingService onboardingService = OnboardingService();
  int _currentPage = 0;

  late final List<Widget> _pages = widget.pages;

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
              return _pages[index];
            },
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    _pageController.animateToPage(
                      _pages.length - 1,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                    onboardingService.setFirstOpen();
                    widget.skipOnPressed.call();
                  },
                  child: const Text('SKIP'),
                ),
                Row(
                  children: List.generate(
                    _pages.length,
                    (index) => _buildDot(index, context),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (_currentPage == _pages.length - 1) {
                      // Navigate to home screen
                      onboardingService.setFirstOpen();
                      widget.doneOnPressed.call();
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child:
                      Text(_currentPage == _pages.length - 1 ? 'DONE' : 'NEXT'),
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
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
