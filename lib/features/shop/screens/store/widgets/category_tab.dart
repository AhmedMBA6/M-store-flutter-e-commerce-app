import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_splash_test1/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutter_splash_test1/common/widgets/texts/section_heading.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';

class MCategoryTab extends StatelessWidget {
  const MCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Brands
              const MBrandShowCase(
                images: [
                  MImages.productImage1,
                  MImages.productImage2,
                  MImages.productImage3,
                ],
              ),
              const SizedBox(
                height: MSizes.spaceBetweenItems,
              ),

              /// -- Products
              MSectionHeading(
                title: 'You might like',
                showActionButton: true,
                onPressed: () {},
              ),
              const SizedBox(
                height: MSizes.spaceBetweenItems,
              ),

              MGridLayout(
                  itemCount: 5,
                  itemBuilder: (_, index) => const MProductCardVertical()),
              const SizedBox(
                height: MSizes.spaceBetweenSections,
              )
            ],
          ),
        ),
      ],
    );
  }
}
