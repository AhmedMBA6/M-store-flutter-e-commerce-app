import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curver_edges_widget.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class MProductImageSlider extends StatelessWidget {
  const MProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return MCurvedEdgeWidget(
      child: Container(
        color: dark ? MColors.darkerGrey : MColors.light,
        child: Stack(
          children: [
            /// Appbar Icons
            const MAppbar(
              showBackArrow: true,
              actions: [
                MCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            ),

            /// -- Main large image
            const SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(MSizes.productImageRaduis * 2),
                  child: Center(
                      child: Image(image: AssetImage(MImages.productImage1))),
                )),

            /// Image Slider
            Positioned(
              bottom: 30,
              right: 0,
              left: MSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: 7,
                  separatorBuilder: (_, __) => const SizedBox(
                    width: MSizes.spaceBetweenItems,
                  ),
                  itemBuilder: (_, index) => MRoundedImage(
                    imageUrl: MImages.productImage10,
                    width: 80,
                    backgroundColor: dark ? MColors.dark : MColors.white,
                    border: Border.all(color: MColors.primary),
                    padding: const EdgeInsets.all(MSizes.sm),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
