import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_splash_test1/features/authentication/screens/login/login_screen.dart';
import 'package:flutter_splash_test1/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to show relevant screen
  screenRedirect() async {
    // Local Storage
    if (kDebugMode) {
      print('==================== Get Storage Next Button ===============');
      print(deviceStorage.read('isFirstTime'));
    }
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() =>
            const LoginScreen()) // Redirect to Login Screen if not the first time
        : Get.offAll(() =>
            const OnBoardingScreen()); // Redirect to onboarding if it's the first time
  }

  /* ----------------------------------------Email & Password Sign-in -------------------------------------*/

  /// [Email Authentication] - sign-in

  /// [Email Authentication] - rigister
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw 'Somthing went wrong, Please try again';
    }
  }

  /// [ ReAuthentication] - Reauthenticate User

  /// [Email verification] - MAIL Verification

  /// [Email Authentication] - Forgot Password

  /* ----------------------------------------Federated identity & social sign-in -------------------------------------*/

  /// [Google Authentication] - Google

  /// [Facebook Authentication] - Facebook

  /* ----------------------------------------end Federated identity & social sign-in -------------------------------------*/

  /// [Logout User]

  /// Delete User - Remove user auth and firestore account
}
