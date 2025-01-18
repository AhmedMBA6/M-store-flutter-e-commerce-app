import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/texts/brand_title_text.dart';
import 'package:flutter_splash_test1/utils/constants/enums.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class MBrandTitleWithVerifiedIcon extends StatelessWidget {
  const MBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = MColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSizes = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSizes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: MBrandTitleText(
          title: title,
          color: textColor,
          maxLines: maxLines,
          textAlign: textAlign,
          brandTextSize: brandTextSizes,
        )),
        const SizedBox(
          width: MSizes.xs,
        ),
        const Icon(
          Iconsax.verify5,
          color: MColors.primary,
          size: MSizes.iconXs,
        ),
      ],
    );
  }
}
