import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/features/authentication/controllers/login/login_controller.dart';
import 'package:flutter_splash_test1/utils/constants/colors.dart';
import 'package:flutter_splash_test1/utils/constants/image_strings.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';
import 'package:get/get.dart';

class MSocialButtons extends StatelessWidget {
  const MSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: MColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () => controller.googleSignIn(),
              icon: const Image(
                  width: MSizes.iconMd,
                  height: MSizes.iconMd,
                  image: AssetImage(MImages.google))),
        ),
        const SizedBox(
          width: MSizes.spaceBetweenItems,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: MColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                  width: MSizes.iconMd,
                  height: MSizes.iconMd,
                  image: AssetImage(MImages.facebook))),
        ),
      ],
    );
  }
}
