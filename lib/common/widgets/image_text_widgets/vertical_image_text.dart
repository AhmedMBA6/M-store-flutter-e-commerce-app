import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/images/circular_image.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class MVerticalImageText extends StatelessWidget {
  const MVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true,
  });

  final String image, title;
  final Color? textColor;
  final bool isNetworkImage;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: MSizes.spaceBetweenItems),
        child: Column(
          children: [
            /// Circular Icon
            MCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: MSizes.md * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: dark ? MColors.light : MColors.dark,
            ),

            const SizedBox(
              height: MSizes.spaceBetweenItems / 4,
            ),

            /// Text
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelMedium!.apply(
                    color: textColor ?? (dark ? MColors.white : MColors.black)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
