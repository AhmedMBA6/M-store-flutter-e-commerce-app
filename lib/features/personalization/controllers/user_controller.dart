import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_splash_test1/data/repositories/user/user_repository.dart';
import 'package:flutter_splash_test1/features/authentication/models/user_model.dart';
import 'package:flutter_splash_test1/features/authentication/screens/login/login_screen.dart';
import 'package:flutter_splash_test1/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:flutter_splash_test1/utils/constants/image_strings.dart';
import 'package:flutter_splash_test1/utils/helpers/network_manager.dart';
import 'package:flutter_splash_test1/utils/popups/full_screen_loader.dart';
import 'package:flutter_splash_test1/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../../utils/constants/sizes.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      // First update Rx  User and check if user data is already stored, if not store new Record,
      await fetchUserRecord();

      if (user.value.id.isEmpty) {
        // if no record already stored
        if (userCredentials != null) {
          // Convert Name to first and last name
          final nameParts =
              UserModel.namePart(userCredentials.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredentials.user!.displayName ?? '');

          // Map data
          final user = UserModel(
            id: userCredentials.user!.uid,
            userName: username,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          // Save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      MLoaders.warningSnackBar(
          title: "Data not saved",
          message:
              'Something went wrong while saving your information, you can re-save your data in your profile.');
    }
  }

  /// Delete account warning
  void deleteAccounteWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(MSizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: MSizes.lg),
            child: Text("Delete"),
          )),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text("Cancel"),
      ),
    );
  }

  /// Delete User Account
  void deleteUserAccount() async {
    try {
      MFullScreenLoader.openLoadingDialog(
          'Processing..!', MImages.decorAnimation);
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re verify auth email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          MFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          MFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }

      /// First re-authenticate user
    } catch (e) {
      MFullScreenLoader.stopLoading();
      MLoaders.warningSnackBar(title: 'On snap!', message: e.toString());
    }
  }

  /// -- Re-Authentication before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      MFullScreenLoader.openLoadingDialog(
          'Processing..!', MImages.decorAnimation);

      // check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        MFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateEmailAndPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      MFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      MFullScreenLoader.stopLoading();
      MLoaders.warningSnackBar(title: 'onSnap!', message: e.toString());
    }
  }

  /// Upload Profile Image
  uploadUserProfilePicture() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        allowedExtensions: ["jpg", "jpeg", "png", "mp4"],
        type: FileType.custom,
      );
      if (result != null) {
        imageUploading.value = true;
        // upload Image
        final imageUrl = await userRepository.uploadImageC(result);

        // update user Image record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        MLoaders.successSnackBar(
            title: "Congratulation",
            message: "your profile image has been updated");
      }
    } catch (e) {
      MLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
    } finally {
      imageUploading.value = false;
    }
  }
}
