import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/features/personalization/controllers/user_controller.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/shimmers/shimmer.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class MHomeAppBar extends StatelessWidget {
  const MHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return MAppbar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: MColors.grey),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              // Display a shimmer loader while user profile is being loaded
              return const MShimmerEffect(
                width: 80,
                height: 15,
              );
            } else {
              return Text(
                controller.user.value.fullName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: MColors.white),
              );
            }
          }),
        ],
      ),
      actions: [
        MCartCounterIcon(
          onPressed: () {},
          iconColor: MColors.white,
        )
      ],
    );
  }
}
