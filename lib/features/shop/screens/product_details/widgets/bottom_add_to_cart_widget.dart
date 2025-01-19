import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/icons/circular_icon.dart';
import 'package:flutter_splash_test1/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class MBottomAddToCart extends StatelessWidget {
  const MBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: MSizes.defaultSpace, vertical: MSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? MColors.darkerGrey : MColors.light,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(MSizes.cardRadiusLg),
            topLeft: Radius.circular(MSizes.cardRadiusLg),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const MCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: MColors.darkerGrey,
                width: 40,
                height: 40,
                color: MColors.white,
              ),
              const SizedBox(
                width: MSizes.spaceBetweenItems,
              ),
              Text(
                '3',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const MCircularIcon(
                icon: Iconsax.add,
                backgroundColor: MColors.black,
                width: 40,
                height: 40,
                color: MColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(MSizes.md),
              backgroundColor: MColors.black,
              side: const BorderSide(color: MColors.black),
            ),
            child: const Text("Add to Cart"),
          ),
        ],
      ),
    );
  }
}
