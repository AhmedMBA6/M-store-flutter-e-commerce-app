import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

/// a widget ro displaying an animated loading indecator with optional text and action button
class MAnimationLoaderWidget extends StatelessWidget {
  /// Default constructor

  /// Parameters:
  /// - text
  /// - animation
  /// - showAction
  /// - actionText
  /// - onActionPressed
  const MAnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      this.actionText,
      this.showAction = false,
      this.onActionPressed});

  final String text;
  final String animation;
  final String? actionText;
  final bool showAction;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(animation,
            width: MediaQuery.of(context).size.width *
                0.8), // Display Lottie animation
        const SizedBox(
          height: MSizes.defaultSpace,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: MSizes.defaultSpace,
        ),
        showAction
            ? SizedBox(
                width: 250,
                child: OutlinedButton(
                    onPressed: onActionPressed,
                    style:
                        OutlinedButton.styleFrom(backgroundColor: MColors.dark),
                    child: Text(
                      actionText!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: MColors.light),
                    )),
              )
            : const SizedBox(),
      ],
    ));
  }
}
