import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/appbar/appbar.dart';
import 'package:flutter_splash_test1/common/widgets/images/rounded_images.dart';
import 'package:flutter_splash_test1/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:flutter_splash_test1/common/widgets/texts/section_heading.dart';
import 'package:flutter_splash_test1/utils/constants/image_strings.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MAppbar(
        title: Text("Casual shirts"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const MRoundedImage(
                imageUrl: MImages.promoBanner2,
                width: double.infinity,
                applyImageRadius: true,
                height: null,
              ),
              const SizedBox(
                height: MSizes.spaceBetweenSections,
              ),

              /// Sub-Categories
              Column(
                children: [
                  /// Heading
                  MSectionHeading(
                    title: "Casual shirts",
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: MSizes.spaceBetweenItems / 2,
                  ),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                              width: MSizes.spaceBetweenItems,
                            ),
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            const MProductCardHorizontal()),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
