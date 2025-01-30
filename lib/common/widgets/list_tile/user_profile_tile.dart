import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/features/personalization/controllers/user_controller.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/circular_image.dart';

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
      leading: const MCircularImage(
        image: MImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
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
