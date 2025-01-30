import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/data/repositories/user/user_repository.dart';
import 'package:flutter_splash_test1/features/personalization/controllers/user_controller.dart';
import 'package:flutter_splash_test1/features/personalization/screens/profile/profile_screen.dart';
import 'package:flutter_splash_test1/utils/constants/image_strings.dart';
import 'package:flutter_splash_test1/utils/helpers/network_manager.dart';
import 'package:flutter_splash_test1/utils/popups/full_screen_loader.dart';
import 'package:flutter_splash_test1/utils/popups/loaders.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when home screen appears
  @override
  void onInit() {
    intializeNames();
    super.onInit();
  }

  /// fetch user record
  Future<void> intializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // start loading
      MFullScreenLoader.openLoadingDialog(
          "We are updating your information", MImages.decorAnimation);

      // Check internet connection
      final isConnect = await NetworkManager.instance.isConnected();
      if (!isConnect) {
        MFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        MFullScreenLoader.stopLoading();
        return;
      }

      // Update user name in the firebase
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      // Update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove loader
      MFullScreenLoader.stopLoading();

      // Show success message
      MLoaders.successSnackBar(
          title: "Congratulation", message: "Your name has been updated.");

      // Move to the previous screen

      Get.off(() => const ProfileScreen());
    } catch (e) {
      MFullScreenLoader.stopLoading();
      MLoaders.errorSnackBar(title: 'On snap!', message: e.toString());
    }
  }
}
