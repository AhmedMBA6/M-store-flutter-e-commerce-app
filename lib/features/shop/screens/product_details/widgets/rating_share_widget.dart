import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class MRatingAndShare extends StatelessWidget {
  const MRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Rating
        Row(
          children: [
            const Icon(
              Iconsax.star5,
              color: Colors.amber,
              size: 24,
            ),
            const SizedBox(
              width: MSizes.spaceBetweenItems / 2,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: '5.0',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const TextSpan(text: '(200)')
            ]))
          ],
        ),

        /// Share Button
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              size: MSizes.iconMd,
            )),
      ],
    );
  }
}
