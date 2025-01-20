import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_splash_test1/common/widgets/products/rating/rating_indecator.dart';
import 'package:flutter_splash_test1/utils/constants/image_strings.dart';
import 'package:flutter_splash_test1/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard(
      {super.key,
      required this.userName,
      required this.userComment,
      required this.companyName,
      required this.companyComment});

  final String userName, userComment, companyName, companyComment;

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(MImages.userProfileImage1),
                ),
                const SizedBox(
                  width: MSizes.spaceBetweenItems,
                ),
                Text(userName, style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(
          height: MSizes.spaceBetweenItems,
        ),

        /// Review
        Row(
          children: [
            const MRatingBarIndicator(rating: 4),
            const SizedBox(
              width: MSizes.spaceBetweenItems,
            ),
            Text(
              '02 Jun , 2025',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: MSizes.spaceBetweenItems,
        ),
        ReadMoreText(
          userComment,
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimCollapsedText: "Show more..",
          trimExpandedText: "Show less",
          moreStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: MColors.primary),
          lessStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: MColors.primary),
        ),
        const SizedBox(
          height: MSizes.spaceBetweenItems,
        ),

        /// -- Store Review
        MRoundedContainer(
          backgroundColor: dark ? MColors.darkerGrey : MColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(MSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      companyName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "02 Jun, 2025",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(
                  height: MSizes.spaceBetweenItems,
                ),
                ReadMoreText(
                  companyComment,
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: "Show more..",
                  trimExpandedText: "Show less",
                  moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: MColors.primary),
                  lessStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: MColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: MSizes.spaceBetweenSections,
        ),
      ],
    );
  }
}
