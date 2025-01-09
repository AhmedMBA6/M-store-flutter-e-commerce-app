import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/features/authentication/screens/password_configration/forgot_password.dart';
import 'package:flutter_splash_test1/features/authentication/screens/signup/signup_screen.dart';
import 'package:flutter_splash_test1/navigation_menu.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';
import 'package:flutter_splash_test1/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MLoginForm extends StatelessWidget {
  const MLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: MSizes.spaceBetweenSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Iconsax.direct_right,
                  ),
                  labelText: MTexts.email),
            ),
            const SizedBox(
              height: MSizes.spaceBetweenInputFields,
            ),

            /// Password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: MTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(
              height: MSizes.spaceBetweenInputFields / 2,
            ),

            /// Remember Me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(MTexts.rememberMe),
                  ],
                ),

                /// Forgot Password
                TextButton(
                    onPressed: () => Get.to(() => const ForgotPassword()),
                    child: const Text(MTexts.forgotPassword)),
              ],
            ),
            const SizedBox(
              height: MSizes.spaceBetweenSections,
            ),

            /// Sign in Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const NavigationMenu()),
                    child: const Text(MTexts.signIn))),
            const SizedBox(
              height: MSizes.spaceBetweenItems,
            ),

            /// create account button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignupScreen()),
                    child: const Text(MTexts.createAccount))),
          ],
        ),
      ),
    );
  }
}
