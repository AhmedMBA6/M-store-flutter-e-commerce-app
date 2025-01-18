import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/features/personalization/screens/profile/profile_screen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/circular_image.dart';

class MUserProfileTile extends StatelessWidget {
  const MUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const MCircularImage(
        image: MImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        'Ahmed Muhammed',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: MColors.white),
      ),
      subtitle: Text(
        'ahmed.bauiomy17@gmail.com',
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: MColors.white),
      ),
      trailing: IconButton(
          onPressed: () => Get.to(const ProfileScreen()),
          icon: const Icon(
            Iconsax.edit,
            color: MColors.white,
          )),
    );
  }
}
