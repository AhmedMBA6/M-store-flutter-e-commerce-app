import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_splash_test1/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class MOrdersListItems extends StatelessWidget {
  const MOrdersListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: MSizes.spaceBetweenItems,
      ),
      itemCount: 9,
      itemBuilder: (_, index) => MRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(MSizes.md),
        backgroundColor: dark ? MColors.dark : MColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// -- Row 1
            Row(
              children: [
                /// Icon
                const Icon(Iconsax.ship),
                const SizedBox(
                  width: MSizes.spaceBetweenItems / 2,
                ),

                /// Status and Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Processing",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: MColors.primary, fontWeightDelta: 1),
                      ),
                      Text(
                        "22 Jun 2025",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),

                /// Icon
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.arrow_right_34,
                      size: MSizes.iconSm,
                    )),
              ],
            ),
            const SizedBox(
              height: MSizes.spaceBetweenItems,
            ),

            /// -- Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      /// Icon
                      const Icon(Iconsax.calendar),
                      const SizedBox(
                        width: MSizes.spaceBetweenItems / 2,
                      ),

                      /// Order Number
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              "[#12t5]",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      /// Icon
                      const Icon(Iconsax.tag),
                      const SizedBox(
                        width: MSizes.spaceBetweenItems / 2,
                      ),

                      ///  Date of shipping
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Shipping Date",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              "20 Jun 2025",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
