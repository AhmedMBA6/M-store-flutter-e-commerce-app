import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/stylies/shadows.dart';
import 'package:flutter_splash_test1/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_splash_test1/common/widgets/images/rounded_images.dart';
import 'package:flutter_splash_test1/common/widgets/texts/product_title_text.dart';
import 'package:flutter_splash_test1/utils/constants/colors.dart';
import 'package:flutter_splash_test1/utils/constants/image_strings.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';
import 'package:flutter_splash_test1/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

import '../../icons/circular_icon.dart';
import '../../texts/product_price_text.dart';

class MProductCardVertical extends StatelessWidget {
  const MProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);

    /// Container with side paddings, color, edge, radius and shadow
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [MShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(MSizes.productImageRaduis),
            color: dark ? MColors.darkGrey : MColors.white),
        child: Column(
          children: [
            /// Thumbnail, wishlist button, discount tag
            MRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(MSizes.sm),
              backgroundColor: dark ? MColors.dark : MColors.light,
              child: Stack(
                children: [
                  /// -- Thumbnail image
                  const MRoundedImage(
                    imageUrl: MImages.productImage1,
                    applyImageRadius: true,
                  ),

                  /// -- Sale tag
                  Positioned(
                    top: 12,
                    child: MRoundedContainer(
                      radius: MSizes.sm,
                      backgroundColor: MColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: MSizes.sm, vertical: MSizes.xs),
                      child: Text(
                        "25%",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: MColors.black),
                      ),
                    ),
                  ),

                  /// -- Favourite Icon Button
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: MCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: MSizes.spaceBetweenItems / 2,
            ),

            /// --Details
            Padding(
              padding: const EdgeInsets.only(left: MSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MProductTitleText(
                    title: "stylish sweet shirt",
                    smallSize: true,
                  ),
                  const SizedBox(
                    height: MSizes.spaceBetweenItems / 2,
                  ),
                  Row(
                    children: [
                      Text(
                        "M",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const Icon(
                        Iconsax.verify5,
                        color: MColors.primary,
                        size: MSizes.iconXs,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// price
                      const MProductPriceText(
                        price: '35.5',
                      ),

                      /// Add to cart button
                      Container(
                        decoration: const BoxDecoration(
                            color: MColors.dark,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(MSizes.cardRadiusMd),
                                bottomRight: Radius.circular(
                                    MSizes.productImageRaduis))),
                        child: const SizedBox(
                          width: MSizes.iconLg * 1.2,
                          height: MSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: MColors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
