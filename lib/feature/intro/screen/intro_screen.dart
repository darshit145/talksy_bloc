import 'package:flutter/material.dart';
import '../../../get_it.dart';
import '../widget/onboarding_screen_1.dart';
import '../widget/onboarding_screen_2.dart';
import '../widget/onboarding_screen_3.dart';

class IntroScreen extends StatelessWidget {
  final PageController _pageController = PageController();
   IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(

        controller: _pageController,
        physics: BouncingScrollPhysics(),
        onPageChanged: (value) {
          // context.read<IntroScreenController>().changePageTo(value);
        },
        children: [
          OnboardingScreen1(pageController: _pageController,),
          OnboardingScreen2(pageController: _pageController,),
          OnboardingScreen3(pageController: _pageController,sharedPreferences: it(),),
        ],
      ),
    );
  }
}
