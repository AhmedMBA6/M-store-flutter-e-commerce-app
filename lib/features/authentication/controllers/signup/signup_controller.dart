import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_splash_test1/data/repositories/user/user_repository.dart';
import 'package:flutter_splash_test1/features/authentication/models/user_model.dart';
import 'package:flutter_splash_test1/features/authentication/screens/signup/verify_email_screen.dart';
import 'package:flutter_splash_test1/utils/constants/image_strings.dart';
import 'package:flutter_splash_test1/utils/popups/full_screen_loader.dart';
import 'package:flutter_splash_test1/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers/network_manager.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// -- variables
  final hidePassword = true.obs; // observable for hiding/showing password
  final privacyPolicy = true.obs; // observable for privacy polices check
  final email = TextEditingController(); // Controller for email input
  final firstName = TextEditingController(); // Controller for first name input
  final lastName = TextEditingController(); // Controller for last name input
  final userName = TextEditingController(); // Controller for user name input
  final phoneNumber =
      TextEditingController(); // Controller for phone number input
  final password = TextEditingController(); // Controller for password input
  GlobalKey<FormState> signupFormkey =
      GlobalKey<FormState>(); // Form key for form validation

  /// -- Signup
  void signup() async {
    try {
      // start loading
      MFullScreenLoader.openLoadingDialog(
          'We are processing your information...', MImages.decorAnimation);

      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MFullScreenLoader.stopLoading();
      }

      // form validation
      if (!signupFormkey.currentState!.validate()) {
         MFullScreenLoader.stopLoading();
        return;}

      // privacy policy check

      if (!privacyPolicy.value) {
        // Remove loader
        MFullScreenLoader.stopLoading();
        MLoaders.warningSnackBar(
            title: "Accept Privacy Policy",
            message:
                "In order to create new account, you must read and accept the privacy policy & Terms of use.");
        return;
      }

      // Register user in the firebase authentication & Save user data in the firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // save the authenticated user data in the firebase firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        userName: userName.text.trim(),
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      MFullScreenLoader.stopLoading();

      // show success Message
      MLoaders.successSnackBar(
          title: "Congratulations",
          message:
              "your account has been created! Verify your email to continue.");

      // move to verify email screen
      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      // Remove Loader
      MFullScreenLoader.stopLoading();
      // Show some Generic error to the user
      MLoaders.errorSnackBar(title: "no Snap!", message: e.toString());
    }
  }
}
