import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/stylies/spacing_styles.dart';
import 'package:flutter_splash_test1/common/widgets/login_signup/form_divider.dart';
import 'package:flutter_splash_test1/common/widgets/login_signup/social_buttons.dart';
import 'package:flutter_splash_test1/features/authentication/screens/login/widgets/login_form.dart';
import 'package:flutter_splash_test1/features/authentication/screens/login/widgets/login_header.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';
import 'package:flutter_splash_test1/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: MSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title & sub-title
              const MLoginHeader(),

              /// Form
              const MLoginForm(),

              /// Divider
              MFormDivider(
                dividerText: MTexts.orSignInWith.capitalize!,
              ),
              const SizedBox(
                height: MSizes.spaceBetweenSections,
              ),

              /// Footer
              const MSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
