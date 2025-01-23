import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_splash_test1/common/widgets/appbar/appbar.dart';
import 'package:flutter_splash_test1/common/widgets/brands/brand_card.dart';
import 'package:flutter_splash_test1/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_splash_test1/common/widgets/texts/section_heading.dart';
import 'package:flutter_splash_test1/features/shop/screens/brands/brand_products.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MAppbar(
        title: Text("Brand"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const MSectionHeading(
                title: "Brands",
                showActionButton: false,
              ),
              const SizedBox(
                height: MSizes.spaceBetweenItems,
              ),

              /// Brands
              MGridLayout(
                itemCount: 7,
                itemBuilder: (context, index) => MBrandCard(
                  showBorder: true,
                  onTap: () => Get.to(() => const BrandProducts()),
                ),
                mainAxisExtent: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
