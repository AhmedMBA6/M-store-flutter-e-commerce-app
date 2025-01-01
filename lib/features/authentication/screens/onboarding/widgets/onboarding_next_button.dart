import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/features/authentication/controllers/onboarding_controller.dart';
import 'package:flutter_splash_test1/utils/constants/colors.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';
import 'package:flutter_splash_test1/utils/device/device_utility.dart';
import 'package:flutter_splash_test1/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Positioned(
        right: MSizes.defaultSpace,
        bottom: MDeviceUtilities.getBottomNavigationBarHeight(),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: dark ? MColors.primary : Colors.black),
            onPressed: () => OnBoardingController.instance.nextPage(),
            child: const Icon(Iconsax.arrow_right_3)));
  }
}
