import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/rounded_images.dart';
import '../../texts/brand_title_with_verified_icon.dart';
import '../../texts/product_title_text.dart';

class MCartItem extends StatelessWidget {
  const MCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// -- Image
        MRoundedImage(
          imageUrl: MImages.productImage1,
          width: 60,
          height: 60,
          backgroundColor: MHelperFunctions.isDarkMode(context)
              ? MColors.darkerGrey
              : MColors.light,
          padding: const EdgeInsets.all(MSizes.xs),
        ),
        const SizedBox(
          width: MSizes.spaceBetweenItems,
        ),

        /// -- Title & Price and Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MBrandTitleWithVerifiedIcon(title: 'M'),
              const Flexible(
                child: MProductTitleText(
                  title: "Sweet Wear for men",
                  maxLines: 1,
                ),
              ),

              /// -- Attributes
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Color: ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'Black ',
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text: 'Size: ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'Eg 10', style: Theme.of(context).textTheme.bodyLarge)
              ]))
            ],
          ),
        )
      ],
    );
  }
}
