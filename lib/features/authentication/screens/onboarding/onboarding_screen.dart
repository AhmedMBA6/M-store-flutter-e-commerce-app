import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/features/authentication/controllers/onboarding_controller.dart';
import 'package:flutter_splash_test1/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:flutter_splash_test1/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:flutter_splash_test1/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:flutter_splash_test1/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:flutter_splash_test1/utils/constants/image_strings.dart';
import 'package:flutter_splash_test1/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: MImages.onBoardingImage1,
                title: MTexts.onBoardingTitle1,
                subTitle: MTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: MImages.onBoardingImage2,
                title: MTexts.onBoardingTitle2,
                subTitle: MTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: MImages.onBoardingImage3,
                title: MTexts.onBoardingTitle3,
                subTitle: MTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          /// skip button
          const OnBoardingSkip(),

          /// dot navidation smoothPageIndicator
          const OnBoardingDotNavigation(),

          /// circular button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
