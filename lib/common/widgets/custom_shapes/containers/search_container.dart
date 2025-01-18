import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class MSearchContainer extends StatelessWidget {
  const MSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.padding = const EdgeInsets.symmetric(horizontal: MSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding,
      child: Container(
        width: MDeviceUtilities.getScreenWidth(context),
        padding: const EdgeInsets.all(MSizes.md),
        decoration: BoxDecoration(
          color: showBackground
              ? dark
                  ? MColors.dark
                  : MColors.light
              : Colors.transparent,
          borderRadius: BorderRadius.circular(MSizes.cardRadiusLg),
          border: showBorder ? Border.all(color: MColors.grey) : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: MColors.darkGrey,
            ),
            const SizedBox(
              width: MSizes.spaceBetweenItems,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}
