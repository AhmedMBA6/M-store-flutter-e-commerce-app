import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/stylies/spacing_styles.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: MSpacingStyles.paddingWithAppBarHeight * 2,
            child: Column(
              children: [
                /// Image
                Image(
                  width: MHelperFunctions.screenWidth() * 0.6,
                  image: AssetImage(image),
                ),
                const SizedBox(
                  height: MSizes.spaceBetweenSections,
                ),

                /// Title & subTitle
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: MSizes.spaceBetweenItems,
                ),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: MSizes.spaceBetweenSections,
                ),

                /// Buttons
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onPressed,
                      child: const Text(MTexts.mContinue),
                    )),
              ],
            )),
      ),
    );
  }
}
