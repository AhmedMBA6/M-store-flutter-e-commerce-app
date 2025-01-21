import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../custom_shapes/containers/rounded_container.dart';

class MCouponWidget extends StatelessWidget {
  const MCouponWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return MRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? MColors.dark : MColors.white,
      padding: const EdgeInsets.only(
        top: MSizes.sm,
        bottom: MSizes.sm,
        right: MSizes.sm,
        left: MSizes.md,
      ),
      child: Row(
        children: [
          /// TextField
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: "Have a promo code? Enter Here",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none),
            ),
          ),

          /// Button
          SizedBox(
              width: 70,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: dark
                        ? MColors.white.withOpacity(0.5)
                        : MColors.dark.withOpacity(0.5),
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    side: BorderSide(color: Colors.grey.withOpacity(0.1)),
                  ),
                  onPressed: () {},
                  child: const Text("Apply")))
        ],
      ),
    );
  }
}
