import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/features/authentication/controllers/forgot_password/forgot_password_controller.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';
import 'package:flutter_splash_test1/utils/constants/text_strings.dart';
import 'package:flutter_splash_test1/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(MSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(
              MTexts.forgotPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: MSizes.spaceBetweenItems,
            ),
            Text(
              MTexts.forgotPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: MSizes.spaceBetweenSections * 2,
            ),

            /// Text fiels
            Form(
              key: controller.forgotPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: MValidator.validateEmail,
                decoration: const InputDecoration(
                  labelText: MTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
            ),
            const SizedBox(
              height: MSizes.spaceBetweenSections,
            ),

            /// submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.sendPasswordResetEmail(),
                  child: const Text(MTexts.submit)),
            ),
          ],
        ),
      ),
    );
  }
}
