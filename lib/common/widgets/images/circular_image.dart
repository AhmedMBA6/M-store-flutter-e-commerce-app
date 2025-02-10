import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/shimmers/shimmer.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class MCircularImage extends StatelessWidget {
  const MCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.padding = MSizes.sm,
    this.fit = BoxFit.cover,
    this.overlayColor,
    this.backgroundColor,
    this.isNetworkImage = false,
    required this.image,
  });

  final double width, height, padding;
  final BoxFit? fit;
  final Color? overlayColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final String image;

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (dark ? MColors.black : MColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: image,
                  fit: fit,
                  color: overlayColor,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const MShimmerEffect(
                    width: 55,
                    height: 55,
                    radius: 55,
                  ),
                  errorWidget: (context, url, downloadProgress) =>
                      const Icon(Icons.error),
                )
              : Image(
                  image: AssetImage(image),
                  color: overlayColor,
                ),
        ),
      ),
    );
  }
}
