import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/login_signup/form_divider.dart';
import 'package:flutter_splash_test1/common/widgets/login_signup/social_buttons.dart';
import 'package:flutter_splash_test1/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';
import 'package:flutter_splash_test1/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                MTexts.signUpTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: MSizes.spacedBetweenSections,
              ),

              /// Form
              const MSignUpForm(),
              const SizedBox(
                height: MSizes.spacedBetweenSections,
              ),

              /// Divider
              MFormDivider(dividerText: MTexts.orSignUpWith.capitalize!),
              const SizedBox(
                height: MSizes.spacedBetweenSections,
              ),

              /// Social Buttons
              const MSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
