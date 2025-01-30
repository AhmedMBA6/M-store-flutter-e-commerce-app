import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_splash_test1/features/authentication/screens/password_configration/reset_password_screen.dart';
import 'package:flutter_splash_test1/utils/helpers/network_manager.dart';
import 'package:flutter_splash_test1/utils/popups/full_screen_loader.dart';
import 'package:flutter_splash_test1/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  /// send reset password email
  sendPasswordResetEmail() async {
    try {
      // start loading
      MFullScreenLoader.openLoadingDialog(
          "Processing your request ....", MImages.decorAnimation);

      // Check the internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MFullScreenLoader.stopLoading();
        return;
      }

      // Form Validate
      if (!forgotPasswordFormKey.currentState!.validate()) {
        MFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to reset password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      MFullScreenLoader.stopLoading();

      // Show success Screen
      MLoaders.successSnackBar(
          title: "Email sent",
          message: 'Email Link Sent to Reset your password.'.tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      //Remove Loader
      MFullScreenLoader.stopLoading();
      MLoaders.errorSnackBar(title: 'On snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // start loading
      MFullScreenLoader.openLoadingDialog(
          "Processing your request ....", MImages.decorAnimation);

      // Check the internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      MFullScreenLoader.stopLoading();

      // Show success Screen
      MLoaders.successSnackBar(
          title: "Email sent",
          message: 'Email Link Sent to Reset your password.'.tr);
    } catch (e) {
      //Remove Loader
      MFullScreenLoader.stopLoading();
      MLoaders.errorSnackBar(title: 'On snap!', message: e.toString());
    }
  }
}
