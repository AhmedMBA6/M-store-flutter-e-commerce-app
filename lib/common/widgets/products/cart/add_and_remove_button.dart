import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/circular_icon.dart';

class MProductQuantityWithAddAndRemoveButtons extends StatelessWidget {
  const MProductQuantityWithAddAndRemoveButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        MCircularIcon(
          icon: Iconsax.minus,
          size: MSizes.md,
          width: 32,
          height: 32,
          color: dark ? MColors.white : MColors.black,
          backgroundColor: dark ? MColors.darkerGrey : MColors.light,
        ),
        const SizedBox(
          width: MSizes.spaceBetweenItems,
        ),
        const Text("1"),
        const SizedBox(
          width: MSizes.spaceBetweenItems,
        ),
        const MCircularIcon(
          icon: Iconsax.add,
          size: MSizes.md,
          width: 32,
          height: 32,
          color: MColors.white,
          backgroundColor: MColors.primary,
        ),
      ],
    );
  }
}
