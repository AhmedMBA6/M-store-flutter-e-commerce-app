import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/appbar/appbar.dart';
import 'package:flutter_splash_test1/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:flutter_splash_test1/common/widgets/texts/section_heading.dart';
import 'package:flutter_splash_test1/features/personalization/screens/settings/widgets/settings_menu_tile.dart';
import 'package:flutter_splash_test1/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/list_tile/user_profile_tile.dart';
import '../../../../utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// --Header
            MPrimaryHeaderContainer(
                child: Column(
              children: [
                MAppbar(
                  title: Text(
                    "Account",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: MColors.white),
                  ),
                ),
                const SizedBox(
                  height: MSizes.spaceBetweenSections,
                ),

                /// --User Profile Card
                const MUserProfileTile(),
                const SizedBox(
                  height: MSizes.spaceBetweenSections,
                ),
              ],
            )),

            ///  -- Body
            Padding(
              padding: const EdgeInsets.all(MSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- title
                  const MSectionHeading(
                    title: "Account Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: MSizes.spaceBetweenItems,
                  ),

                  MSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subTitle: "Set shipping delivery address",
                    onTap: () {},
                  ),
                  MSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: "add, remove products and move to checkout",
                    onTap: () {},
                  ),
                  MSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle: "In-Progress and completed Orders",
                    onTap: () {},
                  ),
                  MSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank account',
                    subTitle: "Withdraw balance to registered account",
                    onTap: () {},
                  ),
                  MSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subTitle: "List of all the discounted coupons",
                    onTap: () {},
                  ),
                  MSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subTitle: "Set any kind of notification message",
                    onTap: () {},
                  ),
                  MSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subTitle: "Manage data usage and connected accounts",
                    onTap: () {},
                  ),

                  /// -- App Settings
                  const SizedBox(
                    height: MSizes.spaceBetweenSections,
                  ),
                  const MSectionHeading(
                    title: "App Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: MSizes.spaceBetweenItems,
                  ),
                  MSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subTitle: "Upload Data to your cloud firebase",
                    onTap: () {},
                  ),
                  MSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Location',
                    subTitle: "Set recommendation based on location",
                    trailing: Switch(value: true, onChanged: (onChanged) {}),
                    onTap: () {},
                  ),
                  MSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: "Search result is safe for all ages",
                    trailing: Switch(value: false, onChanged: (onChanged) {}),
                    onTap: () {},
                  ),
                  MSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: "Set image quality to be seen",
                    trailing: Switch(value: true, onChanged: (onChanged) {}),
                    onTap: () {},
                  ),

                  /// -- LogOut Button
                  const SizedBox(height: MSizes.spaceBetweenSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {}, child: const Text('LogOut')),
                  ),
                  const SizedBox(
                    height: MSizes.spaceBetweenSections * 2,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
