import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/texts/section_heading.dart';
import 'package:flutter_splash_test1/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:flutter_splash_test1/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import 'widgets/product_detail_image_slider.dart';
import 'widgets/rating_share_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Product Image slider
            const MProductImageSlider(),

            /// -- Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: MSizes.defaultSpace,
                  left: MSizes.defaultSpace,
                  bottom: MSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Rating & Share
                  const MRatingAndShare(),

                  /// -- Price, Title, Stock, & Brand
                  const MProductMetaData(),

                  /// -- Attributes
                  const MProductAttributes(),
                  const SizedBox(
                    height: MSizes.spaceBetweenSections,
                  ),

                  /// -- Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Checkout")),
                  ),
                  const SizedBox(
                    height: MSizes.spaceBetweenSections,
                  ),

                  /// -- Description
                  const MSectionHeading(
                    title: "Description",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: MSizes.spaceBetweenItems,
                  ),
                  const ReadMoreText(
                    "this is a product description for the M-store sweet shirt winter wear, There are more things will be added soon",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "Show more",
                    trimExpandedText: 'Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// -- Reviews
                  const Divider(),
                  const SizedBox(
                    height: MSizes.spaceBetweenItems,
                  ),
                  Row(
                    children: [
                      const MSectionHeading(
                        title: "Reviews(200)",
                        showActionButton: false,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Iconsax.arrow_right3,
                            size: 18,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: MSizes.spaceBetweenSections,
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
