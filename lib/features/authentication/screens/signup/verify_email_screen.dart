import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_splash_test1/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:flutter_splash_test1/utils/constants/image_strings.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';
import 'package:flutter_splash_test1/utils/constants/text_strings.dart';
import 'package:flutter_splash_test1/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      /// The close icone in the app bar to logout the user and redirect them to the login screen
      /// This approch handle scenarios where the user enters the registration process
      /// and the data is stored, upon reopening the app, it checks if the email is verified
      /// if not verified. the app always navigates to the verification screen.

      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
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
                email ?? '',
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
                    onPressed: () => controller.checkEmailVerificationStatus(),
                    child: const Text(MTexts.mContinue),
                  )),
              const SizedBox(
                height: MSizes.spaceBetweenItems,
              ),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => controller.sendEmailVerification(),
                    child: const Text(MTexts.resendEmail),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
