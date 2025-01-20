import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_splash_test1/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class MSingleAddress extends StatelessWidget {
  const MSingleAddress({super.key, required this.selectedAdress});

  final bool selectedAdress;

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return MRoundedContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(MSizes.md),
      showBorder: true,
      backgroundColor: selectedAdress
          ? MColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAdress
          ? Colors.transparent
          : dark
              ? MColors.darkerGrey
              : MColors.grey,
      margin: const EdgeInsets.only(bottom: MSizes.spaceBetweenItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAdress ? Iconsax.tick_circle5 : null,
              color: selectedAdress
                  ? dark
                      ? MColors.light
                      : MColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ahmed Muhammed",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: MSizes.sm / 2,
              ),
              const Text(
                "(+20) 102 586 0162",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: MSizes.sm / 2,
              ),
              const Text(
                "16 Yehia salem el bana, block 16011, fifth district, El Obour City",
                softWrap: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
