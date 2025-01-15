import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutter_splash_test1/utils/constants/image_strings.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            const MPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- AppBar --
                  MHomeAppBar(),
                  SizedBox(
                    height: MSizes.spaceBetweenSections,
                  ),

                  /// -- SearchBar --
                  MSearchContainer(text: 'Search in Store'),
                  SizedBox(
                    height: MSizes.spaceBetweenSections,
                  ),

                  /// -- Categories --
                  Padding(
                    padding: EdgeInsets.only(left: MSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// -- Heading
                        MSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: MSizes.spaceBetweenItems,
                        ),

                        /// -- Categories
                        MHomeCategories(),
                      ],
                    ),
                  )
                ],
              ),
            ),

            /// -- Body
            Padding(
                padding: const EdgeInsets.all(MSizes.defaultSpace),
                child: Column(
                  children: [
                    /// --Promo slider
                    const MPromoSlider(
                      banners: [
                        MImages.promoBanner1,
                        MImages.promoBanner2,
                        MImages.promoBanner3,
                      ],
                    ),
                    const SizedBox(
                      height: MSizes.spaceBetweenSections,
                    ),

                    /// --Popular Products
                    MGridLayout(
                      itemCount: 5,
                      itemBuilder: (_, index) => const MProductCardVertical(),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
