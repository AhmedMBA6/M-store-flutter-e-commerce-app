import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class MSortableProducts extends StatelessWidget {
  const MSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(icon: Icon(Iconsax.sort)),
          onChanged: (context) {},
          items: [
            "Name",
            "Higher Price",
            "Lower Price",
            "Sale",
            "Newest",
            "Populaity"
          ]
              .map((options) =>
                  DropdownMenuItem(value: options, child: Text(options)))
              .toList(),
        ),
        const SizedBox(
          height: MSizes.spaceBetweenSections,
        ),

        /// Products
        MGridLayout(
          itemCount: 9,
          itemBuilder: (_, index) => const MProductCardVertical(),
        ),
      ],
    );
  }
}
