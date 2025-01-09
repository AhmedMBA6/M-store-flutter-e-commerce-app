import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/features/authentication/screens/signup/verify_email_screen.dart';
import 'package:flutter_splash_test1/features/authentication/screens/signup/widgets/terms_and_conditions_checkbox.dart';
import 'package:flutter_splash_test1/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';

class MSignUpForm extends StatelessWidget {
  const MSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                    labelText: MTexts.firstName,
                    prefixIcon: Icon(
                      Iconsax.user,
                    )),
              ),
            ),
            const SizedBox(
              width: MSizes.spaceBetweenInputFields,
            ),
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                    labelText: MTexts.lastName,
                    prefixIcon: Icon(
                      Iconsax.user,
                    )),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: MSizes.spaceBetweenInputFields,
        ),

        /// Username
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: MTexts.userName,
              prefixIcon: Icon(
                Iconsax.user_edit,
              )),
        ),
        const SizedBox(
          height: MSizes.spaceBetweenInputFields,
        ),

        /// Email
        TextFormField(
          decoration: const InputDecoration(
              labelText: MTexts.email,
              prefixIcon: Icon(
                Iconsax.direct,
              )),
        ),
        const SizedBox(
          height: MSizes.spaceBetweenInputFields,
        ),

        /// Phone Number
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: MTexts.phoneNo,
              prefixIcon: Icon(
                Iconsax.call,
              )),
        ),
        const SizedBox(
          height: MSizes.spaceBetweenInputFields,
        ),

        /// Password
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            labelText: MTexts.password,
            prefixIcon: Icon(
              Iconsax.password_check,
            ),
            suffixIcon: Icon(
              Iconsax.eye_slash,
            ),
          ),
        ),
        const SizedBox(
          height: MSizes.spaceBetweenInputFields,
        ),

        /// Terms&Conditions Checkbox
        const MTermsAndConditionCheckbox(),
        const SizedBox(
          height: MSizes.spaceBetweenSections,
        ),

        /// Sign up Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () => Get.to(() => const VerifyEmailScreen()),
              child: const Text(MTexts.createAccount)),
        )
      ],
    ));
  }
}
