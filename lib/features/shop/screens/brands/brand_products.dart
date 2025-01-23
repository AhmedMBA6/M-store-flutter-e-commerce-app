import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/appbar/appbar.dart';
import 'package:flutter_splash_test1/common/widgets/brands/brand_card.dart';
import 'package:flutter_splash_test1/common/widgets/products/soartable/sortable_products.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MAppbar(
        title: Text("M"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Detail
              MBrandCard(showBorder: true),
              SizedBox(
                height: MSizes.spaceBetweenSections,
              ),

              MSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
