import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_and_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class MCartItems extends StatelessWidget {
  const MCartItems({
    super.key,
    this.showAddAndRemoveButtons = true,
  });

  final bool showAddAndRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: MSizes.spaceBetweenSections,
      ),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          /// Cart Item
          const MCartItem(),
          if (showAddAndRemoveButtons)
            const SizedBox(
              height: MSizes.spaceBetweenItems,
            ),

          /// Add & Remove Row with total Price
          if (showAddAndRemoveButtons)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    /// Extra Space
                    SizedBox(
                      width: 70,
                    ),

                    /// Add & Remove Buttons
                    MProductQuantityWithAddAndRemoveButtons()
                  ],
                ),

                /// Product total Price
                MProductPriceText(price: "250"),
              ],
            )
        ],
      ),
    );
  }
}
