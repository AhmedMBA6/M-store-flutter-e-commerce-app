import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/circular_image.dart';
import '../texts/brand_title_with_verified_icon.dart';

class MBrandCard extends StatelessWidget {
  const MBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: MRoundedContainer(
        padding: const EdgeInsets.all(MSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            /// Icon
            Flexible(
              child: MCircularImage(
                isNetworkImage: false,
                image: MImages.animalIcon,
                backgroundColor: Colors.transparent,
                overlayColor: dark ? MColors.white : MColors.black,
              ),
            ),
            const SizedBox(
              width: MSizes.spaceBetweenItems / 2,
            ),

            /// -- Text
            // [Expanded] & Column [MainAxisSize.min] is important to keep the elements in the vertical center and
            // also to keep text inside the boundaries
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MBrandTitleWithVerifiedIcon(
                    title: 'M',
                    brandTextSizes: TextSizes.large,
                  ),
                  Text(
                    '250 products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
