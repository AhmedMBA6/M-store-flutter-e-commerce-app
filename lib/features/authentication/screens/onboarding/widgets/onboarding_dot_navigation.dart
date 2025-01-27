import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter_splash_test1/utils/constants/colors.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';
import 'package:flutter_splash_test1/utils/device/device_utility.dart';
import 'package:flutter_splash_test1/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = MHelperFunctions.isDarkMode(context);
    return Positioned(
        bottom: MDeviceUtilities.getBottomNavigationBarHeight() + 25,
        left: MSizes.defaultSpace,
        child: SmoothPageIndicator(
          effect: ExpandingDotsEffect(
              activeDotColor: dark ? MColors.light : MColors.dark,
              dotHeight: 6),
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
        ));
  }
}
