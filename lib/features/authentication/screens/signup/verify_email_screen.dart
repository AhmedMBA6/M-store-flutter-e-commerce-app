import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/success_screen/success_screen.dart';
import 'package:flutter_splash_test1/features/authentication/screens/login/login_screen.dart';
import 'package:flutter_splash_test1/utils/constants/image_strings.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';
import 'package:flutter_splash_test1/utils/constants/text_strings.dart';
import 'package:flutter_splash_test1/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(
                width: MHelperFunctions.screenWidth() * 0.6,
                image: const AssetImage(MImages.verifyIllustration),
              ),
              const SizedBox(
                height: MSizes.spaceBetweenSections,
              ),

              /// Title & subTitle
              Text(
                MTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: MSizes.spaceBetweenItems,
              ),
              Text(
                'Support-m@ahmedbuiomy.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: MSizes.spaceBetweenItems,
              ),
              Text(
                MTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: MSizes.spaceBetweenSections,
              ),

              /// Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => SuccessScreen(
                          onPressed: () => Get.to(() => const LoginScreen()),
                          title: MTexts.yourAccountCreatedTitle,
                          subTitle: MTexts.yourAccountCreatedSubTitle,
                          image: MImages.staticSuccessIllustration,
                        )),
                    child: const Text(MTexts.mContinue),
                  )),
              const SizedBox(
                height: MSizes.spaceBetweenItems,
              ),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(MTexts.resendEmail),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
