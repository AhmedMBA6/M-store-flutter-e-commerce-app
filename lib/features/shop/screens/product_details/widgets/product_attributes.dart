import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/chips/choice_chip.dart';
import 'package:flutter_splash_test1/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_splash_test1/common/widgets/texts/product_price_text.dart';
import 'package:flutter_splash_test1/common/widgets/texts/product_title_text.dart';
import 'package:flutter_splash_test1/common/widgets/texts/section_heading.dart';
import 'package:flutter_splash_test1/utils/constants/colors.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';
import 'package:flutter_splash_test1/utils/helpers/helper_functions.dart';

class MProductAttributes extends StatelessWidget {
  const MProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// -- Selected Attribute Pricing & Description
        MRoundedContainer(
          padding: const EdgeInsets.all(MSizes.md),
          backgroundColor: dark ? MColors.darkerGrey : MColors.grey,
          child: Column(
            children: [
              /// Title, Price and Stock status
              Row(
                children: [
                  const MSectionHeading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: MSizes.spaceBetweenItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MProductTitleText(
                        title: 'Price: ',
                        smallSize: true,
                      ),

                      Row(
                        children: [
                          /// Actual price
                          Text(
                            "\$250",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: MSizes.spaceBetweenItems,
                          ),

                          /// Sale Price
                          const MProductPriceText(price: '175'),
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          const MProductTitleText(
                            title: 'Price: ',
                            smallSize: true,
                          ),
                          Text(
                            "Out of Stock",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),

              /// Variation description
              const MProductTitleText(
                title:
                    "This is the description of the product and it can go upto max 4 lines.",
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(
          height: MSizes.spaceBetweenItems,
        ),

        /// -- Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MSectionHeading(
              title: 'Colors',
              showActionButton: false,
            ),
            const SizedBox(
              height: MSizes.spaceBetweenItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                MChoiceChip(
                  text: "Red",
                  selected: true,
                  onSelected: (value) {},
                ),
                MChoiceChip(
                  text: "Black",
                  selected: false,
                  onSelected: (value) {},
                ),
                MChoiceChip(
                  text: "Pink",
                  selected: false,
                  onSelected: (value) {},
                ),
                MChoiceChip(
                  text: "Yellow",
                  selected: false,
                  onSelected: (value) {},
                ),
                MChoiceChip(
                  text: "Green",
                  selected: false,
                  onSelected: (value) {},
                ),
                MChoiceChip(
                  text: "Blue",
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),
        Column(
          children: [
            const MSectionHeading(
              title: 'Sizes',
              showActionButton: false,
            ),
            const SizedBox(
              height: MSizes.spaceBetweenItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                MChoiceChip(
                  text: "Eg 34",
                  selected: true,
                  onSelected: (value) {},
                ),
                MChoiceChip(
                  text: "Eg 36",
                  selected: false,
                  onSelected: (value) {},
                ),
                MChoiceChip(
                  text: "Eg 38",
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
