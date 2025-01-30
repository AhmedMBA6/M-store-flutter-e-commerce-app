import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/features/authentication/controllers/forgot_password/forgot_password_controller.dart';
import 'package:flutter_splash_test1/features/authentication/screens/login/login_screen.dart';
import 'package:flutter_splash_test1/utils/constants/image_strings.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';
import 'package:flutter_splash_test1/utils/constants/text_strings.dart';
import 'package:flutter_splash_test1/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear)),
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
                image: const AssetImage(MImages.deliveredEmailIllustration),
              ),
              const SizedBox(
                height: MSizes.spaceBetweenSections,
              ),

              /// Email, Title & subTitle
              Text(
                email,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: MSizes.spaceBetweenItems,
              ),
              Text(
                MTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: MSizes.spaceBetweenItems,
              ),
              Text(
                MTexts.changeYourPasswordSubTitle,
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
                    onPressed: () => Get.offAll(() => const LoginScreen()),
                    child: const Text("Done"),
                  )),
              const SizedBox(
                height: MSizes.spaceBetweenItems,
              ),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => ForgotPasswordController.instance
                        .resendPasswordResetEmail(email),
                    child: const Text(MTexts.resendEmail),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
