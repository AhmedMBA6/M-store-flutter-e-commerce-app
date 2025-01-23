import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_splash_test1/common/widgets/images/rounded_images.dart';
import 'package:flutter_splash_test1/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:flutter_splash_test1/common/widgets/texts/product_price_text.dart';
import 'package:flutter_splash_test1/common/widgets/texts/product_title_text.dart';
import 'package:flutter_splash_test1/utils/constants/image_strings.dart';
import 'package:flutter_splash_test1/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../icons/circular_icon.dart';

class MProductCardHorizontal extends StatelessWidget {
  const MProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MSizes.productImageRaduis),
          color: dark ? MColors.darkerGrey : MColors.softGrey),
      child: Row(
        children: [
          /// Thumnail
          MRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(MSizes.sm),
            backgroundColor: dark ? MColors.dark : MColors.light,
            child: Stack(
              children: [
                /// -- Thummnail Image
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: MRoundedImage(
                    imageUrl: MImages.productImage3,
                    applyImageRadius: true,
                  ),
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

          /// Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: MSizes.sm, left: MSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MProductTitleText(
                        title: "sweet wear from the international brands",
                        smallSize: true,
                      ),
                      SizedBox(
                        height: MSizes.spaceBetweenItems / 2,
                      ),
                      MBrandTitleWithVerifiedIcon(
                        title: "M",
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Pricing
                      const Flexible(child: MProductPriceText(price: "150")),

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
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
