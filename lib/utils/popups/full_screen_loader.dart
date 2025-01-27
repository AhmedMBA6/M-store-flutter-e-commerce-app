import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/loaders/animation_loader.dart';
import 'package:flutter_splash_test1/utils/constants/colors.dart';
import 'package:flutter_splash_test1/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

/// A utility class for managing a full-screen loading dialog.
class MFullScreenLoader {
  /// open a full screen loading dialog with a given text and animation
  /// this method does not return anything

  /// Parameters
  ///  - text
  /// - animation
  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context:
            Get.overlayContext!, // Use Get.overlayContext for overlay dialogs
        barrierDismissible:
            false, // The dialog can not be dismissed by tapping outside it
        builder: (_) => PopScope(
            canPop: false, //  Disable popping with the back button
            child: Container(
              color: MHelperFunctions.isDarkMode(Get.context!)
                  ? MColors.dark
                  : MColors.light,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    height: 250,
                  ), // Adjust the spacing as needed
                  MAnimationLoaderWidget(text: text, animation: animation),
                ],
              ),
            )));
  }

  /// Stop the currently open loading dialog
  /// This method doesn't return anything
  static stopLoading() {
    Navigator.of(Get.overlayContext!)
        .pop(); // Close the dialog using the Navigator
  }
}
