import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brand_card.dart';

class MBrandShowCase extends StatelessWidget {
  const MBrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return MRoundedContainer(
      showBorder: true,
      borderColor: MColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(MSizes.md),
      margin: const EdgeInsets.only(bottom: MSizes.spaceBetweenItems),
      child: Column(
        children: [
          /// Brand with Products Count
          const MBrandCard(showBorder: false),
          const SizedBox(
            height: MSizes.spaceBetweenItems,
          ),

          /// Brand Top3 Product Images
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          )
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
      child: MRoundedContainer(
    height: 100,
    padding: const EdgeInsets.all(MSizes.md),
    margin: const EdgeInsets.only(right: MSizes.sm),
    backgroundColor: MHelperFunctions.isDarkMode(context)
        ? MColors.darkerGrey
        : MColors.light,
    child: Image(fit: BoxFit.contain, image: AssetImage(image)),
  ));
}
