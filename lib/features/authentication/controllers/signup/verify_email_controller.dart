import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_splash_test1/common/widgets/success_screen/success_screen.dart';
import 'package:flutter_splash_test1/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_splash_test1/utils/constants/image_strings.dart';
import 'package:flutter_splash_test1/utils/constants/text_strings.dart';
import 'package:flutter_splash_test1/utils/popups/loaders.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send email whenever verify screen appears & set timer to auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      MLoaders.successSnackBar(
          title: 'Email sent',
          message: 'Please check your inbox and verify your email');
    } catch (e) {
      MLoaders.errorSnackBar(title: 'on Snap!', message: e.toString());
    }
  }

  /// timer for automatically redirect on email verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            image: MImages.staticSuccessIllustration,
            title: MTexts.yourAccountCreatedTitle,
            subTitle: MTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  /// Manually check if Email Verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: MImages.staticSuccessIllustration,
          title: MTexts.yourAccountCreatedTitle,
          subTitle: MTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    } else {
      MLoaders.errorSnackBar(
          title: "Verify your email",
          message:
              "You should verify your email first and after that click continue.");
    }
  }
}
