import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/appbar/appbar.dart';
import 'package:flutter_splash_test1/common/widgets/icons/circular_icon.dart';
import 'package:flutter_splash_test1/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_splash_test1/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutter_splash_test1/features/shop/screens/home/home_screen.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppbar(
        title: Text("FavouritList",
            style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          MCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              MGridLayout(
                  itemCount: 7,
                  itemBuilder: (_, index) => const MProductCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
