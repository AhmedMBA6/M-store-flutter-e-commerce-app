import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/images/circular_image.dart';
import 'package:flutter_splash_test1/common/widgets/shimmers/shimmer.dart';
import 'package:flutter_splash_test1/common/widgets/texts/section_heading.dart';
import 'package:flutter_splash_test1/features/personalization/controllers/user_controller.dart';
import 'package:flutter_splash_test1/features/personalization/screens/profile/test_cloudinary_storage_screen.dart';
import 'package:flutter_splash_test1/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:flutter_splash_test1/navigation_menu.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';
import 'package:flutter_splash_test1/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.to(() => const NavigationMenu()),
            icon: Icon(
              Iconsax.arrow_left,
              color: dark ? MColors.white : MColors.dark,
            )),
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty ? networkImage : MImages.user;

                      return controller.imageUploading.value
                          ? const MShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 80,
                            )
                          : MCircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text("Change Profile picture"))
                  ],
                ),
              ),

              /// Details
              const SizedBox(
                height: MSizes.spaceBetweenItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: MSizes.spaceBetweenItems,
              ),
              const MSectionHeading(
                title: "Profile Information",
                showActionButton: false,
              ),
              const SizedBox(
                height: MSizes.spaceBetweenItems,
              ),

              MProfileMenu(
                title: 'Name',
                value: controller.user.value.fullName,
                onPressed: () => Get.to(() => const ChangeName()),
              ),
              MProfileMenu(
                title: 'Username',
                value: controller.user.value.userName,
                onPressed: () =>
                    Get.to(() => const TestCloudinaryStorageScreen()),
              ),

              const SizedBox(
                height: MSizes.spaceBetweenItems,
              ),
              const Divider(),
              const SizedBox(
                height: MSizes.spaceBetweenItems,
              ),

              /// Heading Personal Info
              const MSectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: MSizes.spaceBetweenItems,
              ),

              MProfileMenu(
                title: 'User ID',
                value: controller.user.value.id,
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              MProfileMenu(
                title: 'E-mail',
                value: controller.user.value.email,
                onPressed: () {},
              ),
              MProfileMenu(
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              MProfileMenu(
                title: 'Gender',
                value: 'Male',
                onPressed: () {},
              ),
              MProfileMenu(
                title: 'Date of Birth',
                value: '23 Aug, 2001',
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(
                height: MSizes.spaceBetweenItems,
              ),

              Center(
                child: TextButton(
                    onPressed: () => controller.deleteAccounteWarningPopup(),
                    child: const Text(
                      "Close Account",
                      style: TextStyle(color: Colors.red),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
