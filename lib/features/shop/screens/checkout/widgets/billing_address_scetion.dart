import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/texts/section_heading.dart';
import 'package:flutter_splash_test1/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/sizes.dart';

class MBillingAddressScetion extends StatelessWidget {
  const MBillingAddressScetion({super.key});

  @override
  Widget build(BuildContext context) {
    MHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MSectionHeading(
          title: "Shipping Address",
          buttonTitle: "Change",
          onPressed: () {},
        ),
        Text(
          "Ahmed Muhammed",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: MSizes.spaceBetweenItems / 2,
        ),
        Row(children: [
          const Icon(
            Icons.phone,
            color: Colors.grey,
            size: 16,
          ),
          const SizedBox(
            width: MSizes.spaceBetweenItems,
          ),
          Text(
            '(+20) 102 586 0162',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ]),
        const SizedBox(
          height: MSizes.spaceBetweenItems / 2,
        ),
        Row(
          children: [
            const Icon(
              Icons.location_history,
              color: Colors.grey,
              size: 16,
            ),
            const SizedBox(
              width: MSizes.spaceBetweenItems,
            ),
            Text(
              'Cairo El obour city',
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
            ),
          ],
        )
      ],
    );
  }
}
