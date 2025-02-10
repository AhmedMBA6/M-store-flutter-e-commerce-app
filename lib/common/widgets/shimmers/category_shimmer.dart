import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/shimmers/shimmer.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';

class MCategoryShimmer extends StatelessWidget {
  const MCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, __) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Image
                MShimmerEffect(
                  width: 55,
                  height: 55,
                  radius: 55,
                ),
                SizedBox(
                  height: MSizes.spaceBetweenItems / 2,
                ),

                /// Text
                MShimmerEffect(width: 55, height: 8),
              ],
            );
          },
          separatorBuilder: (_, __) => const SizedBox(
                width: MSizes.spaceBetweenItems,
              ),
          itemCount: itemCount),
    );
  }
}
