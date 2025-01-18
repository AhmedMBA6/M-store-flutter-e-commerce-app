import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/appbar/appbar.dart';
import 'package:flutter_splash_test1/common/widgets/images/circular_image.dart';
import 'package:flutter_splash_test1/common/widgets/texts/section_heading.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/image_strings.dart';
import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MAppbar(
        showBackArrow: true,
        title: Text("Profile"),
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
                    const MCircularImage(
                      image: MImages.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                        onPressed: () {},
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
                value: 'Ahmed Muhammed',
                onPressed: () {},
              ),
              MProfileMenu(
                title: 'Username',
                value: 'Ahmed_bauiomy3',
                onPressed: () {},
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
                value: '1',
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              MProfileMenu(
                title: 'E-mail',
                value: 'ahmed.bauiomy17@gmail.com',
                onPressed: () {},
              ),
              MProfileMenu(
                title: 'Phone Number',
                value: '01025860162',
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
                    onPressed: () {},
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
