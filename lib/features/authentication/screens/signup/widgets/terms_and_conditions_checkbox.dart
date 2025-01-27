import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/signup/signup_controller.dart';

class MTermsAndConditionCheckbox extends StatelessWidget {
  const MTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    final controller = Get.put(SignupController());
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value =
                  !controller.privacyPolicy.value,
            ),
          ),
        ),
        const SizedBox(
          width: MSizes.spaceBetweenItems,
        ),
        Expanded(
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: MTexts.iAgreeTo,
                style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: MTexts.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? MColors.white : MColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? MColors.white : MColors.primary)),
            TextSpan(
                text: ' and ', style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: MTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? MColors.white : MColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? MColors.white : MColors.primary)),
          ])),
        ),
      ],
    );
  }
}
