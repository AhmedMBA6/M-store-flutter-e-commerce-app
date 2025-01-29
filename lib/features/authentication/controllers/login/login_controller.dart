import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_splash_test1/features/personalization/controllers/user_controller.dart';
import 'package:flutter_splash_test1/utils/constants/image_strings.dart';
import 'package:flutter_splash_test1/utils/helpers/network_manager.dart';
import 'package:flutter_splash_test1/utils/popups/full_screen_loader.dart';
import 'package:flutter_splash_test1/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController(); // Controller for email input
  final password = TextEditingController(); // Controller for password input
  GlobalKey<FormState> loginFormkey =
      GlobalKey<FormState>(); // Form key for form validation
  final userController = Get.put(UserController());



  /// -- Email and Password sign in.
  Future<void> emailAndPasswordLogin() async {
    try {
      // start loading
      MFullScreenLoader.openLoadingDialog(
          'logging you in ....', MImages.decorAnimation);

      // Check internet connection
      final isConnect = await NetworkManager.instance.isConnected();
      if (isConnect) {
        MFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormkey.currentState!.validate()) {
        MFullScreenLoader.stopLoading();
        return;
      }

      // Save data if remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user using email & password authentication
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      MFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      MFullScreenLoader.stopLoading();
      MLoaders.errorSnackBar(title: "On snap!", message: e.toString());
    }
  }

  /// -- Google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
      // start loading
      MFullScreenLoader.openLoadingDialog(
          'Logging you in...', MImages.decorAnimation);

      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (isConnected) {
        MFullScreenLoader.stopLoading();
        return;
      }

      // Google authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      // Save User Record
      await userController.saveUserRecord(userCredentials);

      // Remove Loader
      MFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove loader
      MFullScreenLoader.stopLoading();
      MLoaders.errorSnackBar(title: 'On snap!', message: e.toString());
    }
  }
}
