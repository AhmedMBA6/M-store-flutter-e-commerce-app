import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/features/personalization/controllers/user_controller.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';
import 'package:flutter_splash_test1/utils/constants/text_strings.dart';
import 'package:flutter_splash_test1/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Re-Authenticate User"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(MSizes.defaultSpace),
        child: Form(
          key: controller.reAuthFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Email
              TextFormField(
                controller: controller.verifyEmail,
                validator: MValidator.validateEmail,
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
                  controller: controller.verifyPassword,
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
                height: MSizes.spaceBetweenSections,
              ),

              /// Sign in Button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () =>
                          controller.reAuthenticateEmailAndPasswordUser(),
                      child: const Text('Verify'))),
              const SizedBox(
                height: MSizes.spaceBetweenItems,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
