import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/appbar/appbar.dart';
import 'package:flutter_splash_test1/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:flutter_splash_test1/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_splash_test1/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:flutter_splash_test1/common/widgets/texts/section_heading.dart';
import 'package:flutter_splash_test1/features/shop/controllers/category_controller.dart';
import 'package:flutter_splash_test1/features/shop/screens/brands/all_brands_screen.dart';
import 'package:flutter_splash_test1/features/shop/screens/store/widgets/category_tab.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';
import 'package:flutter_splash_test1/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/tab_bar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../utils/constants/colors.dart';
import '../brands/brand_products.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    final isDark = MHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: MAppbar(
            title: Text(
              'Store',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            actions: [
              MCartCounterIcon(
                onPressed: () {},
              )
            ]),
        body: NestedScrollView(

            /// -- Header
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: isDark ? MColors.black : MColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(MSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        /// --Search bar
                        const SizedBox(
                          height: MSizes.spaceBetweenItems,
                        ),
                        const MSearchContainer(
                          text: 'Search in Store',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(
                          height: MSizes.spaceBetweenSections,
                        ),

                        /// -- Featured Brands
                        MSectionHeading(
                          title: 'Featured Brand',
                          onPressed: () =>
                              Get.to(() => const AllBrandsScreen()),
                        ),
                        const SizedBox(
                          height: MSizes.spaceBetweenItems / 1.5,
                        ),

                        /// -- Brand Grid
                        MGridLayout(
                            itemCount: 4,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              return MBrandCard(
                                showBorder: true,
                                onTap: () =>
                                    Get.to(() => const BrandProducts()),
                              );
                            })
                      ],
                    ),
                  ),

                  /// -- Tabs
                  bottom: MTabBar(
                      tabs: categories
                          .map((category) => Tab(child: Text(category.name)))
                          .toList()),
                ),
              ];
            },
            body: TabBarView(
                children: categories
                    .map((category) => MCategoryTab(category: category))
                    .toList())),
      ),
    );
  }
}
