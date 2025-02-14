import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/features/authentication/controllers/login/login_controller.dart';
import 'package:flutter_splash_test1/features/authentication/screens/password_configration/forgot_password_screen.dart';
import 'package:flutter_splash_test1/features/authentication/screens/signup/signup_screen.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';
import 'package:flutter_splash_test1/utils/constants/text_strings.dart';
import 'package:flutter_splash_test1/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MLoginForm extends StatelessWidget {
  const MLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormkey,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: MSizes.spaceBetweenSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              controller: controller.email,
              validator: (value) => MValidator.validateEmail(value),
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
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) =>
                    MValidator.validateEmptyText("Password", value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: MTexts.password,
                  prefixIcon: const Icon(
                    Iconsax.password_check,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  ),
                ),
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
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value),
                    ),
                    const Text(MTexts.rememberMe),
                  ],
                ),

                /// Forgot Password
                TextButton(
                    onPressed: () => Get.to(() => const ForgotPasswordScreen()),
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
                    onPressed: () => controller.emailAndPasswordLogin(),
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
