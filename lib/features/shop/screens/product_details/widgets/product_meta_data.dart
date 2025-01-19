import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/images/circular_image.dart';
import 'package:flutter_splash_test1/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:flutter_splash_test1/common/widgets/texts/product_price_text.dart';
import 'package:flutter_splash_test1/common/widgets/texts/product_title_text.dart';
import 'package:flutter_splash_test1/utils/constants/enums.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class MProductMetaData extends StatelessWidget {
  const MProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// Sale Tag
            MRoundedContainer(
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
            const SizedBox(
              width: MSizes.spaceBetweenItems,
            ),

            /// Price
            Text('\$250',
                style: Theme.of(context).textTheme.titleSmall!.apply(
                      decoration: TextDecoration.lineThrough,
                    )),
            const MProductPriceText(
              price: '175',
              isLarg: true,
            ),
          ],
        ),

        /// Title
        const MProductTitleText(title: "stylish sweet shirt"),
        const SizedBox(
          height: MSizes.spaceBetweenItems / 1.5,
        ),

        /// Stock Status
        Row(
          children: [
            const MProductTitleText(title: "Status:"),
            const SizedBox(
              height: MSizes.spaceBetweenItems,
            ),
            Text(
              "Out of Stock",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(
          height: MSizes.spaceBetweenItems / 1.5,
        ),

        /// Brand
        Row(
          children: [
            MCircularImage(
              image: MImages.darkAppLogo,
              width: 32,
              height: 32,
              overlayColor: isDark ? MColors.white : MColors.black,
            ),
            const MBrandTitleWithVerifiedIcon(
              title: 'M',
              brandTextSizes: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
