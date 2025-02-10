import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/features/personalization/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/circular_image.dart';
import '../shimmers/shimmer.dart';

class MUserProfileTile extends StatelessWidget {
  const MUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty ? networkImage : MImages.user;

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
                padding: 3,
                isNetworkImage: networkImage.isNotEmpty,
                backgroundColor: MColors.white,
              );
      }),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: MColors.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: MColors.white),
      ),
      trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Iconsax.edit,
            color: MColors.white,
          )),
    );
  }
}
