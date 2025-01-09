import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            MPrimaryHeaderContainer(
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
          ],
        ),
      ),
    );
  }
}
