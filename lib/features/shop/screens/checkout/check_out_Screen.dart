import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_splash_test1/common/widgets/products/cart/coupon_widget.dart';
import 'package:flutter_splash_test1/common/widgets/success_screen/success_screen.dart';
import 'package:flutter_splash_test1/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:flutter_splash_test1/features/shop/screens/checkout/widgets/billing_address_scetion.dart';
import 'package:flutter_splash_test1/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:flutter_splash_test1/navigation_menu.dart';
import 'package:flutter_splash_test1/utils/constants/colors.dart';
import 'package:flutter_splash_test1/utils/constants/image_strings.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';
import 'package:flutter_splash_test1/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import 'widgets/billing_amount_section.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: MAppbar(
        title: Text(
          "Order Review",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Items in cart
              const MCartItems(showAddAndRemoveButtons: false),
              const SizedBox(
                height: MSizes.spaceBetweenSections,
              ),

              /// -- Coupon Textfield
              const MCouponWidget(),
              const SizedBox(
                height: MSizes.spaceBetweenSections,
              ),

              /// -- Billing Section
              MRoundedContainer(
                padding: const EdgeInsets.all(MSizes.md),
                showBorder: true,
                backgroundColor: dark ? MColors.black : MColors.white,
                child: const Column(
                  children: [
                    /// Pricing
                    MBillingAmountSection(),
                    SizedBox(
                      height: MSizes.spaceBetweenItems,
                    ),

                    /// Divider
                    Divider(),
                    SizedBox(
                      height: MSizes.spaceBetweenItems,
                    ),

                    /// Payment method
                    MBillingPaymentScetion(),
                    SizedBox(
                      height: MSizes.spaceBetweenItems,
                    ),

                    /// Address
                    MBillingAddressScetion(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /// -- Check Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(MSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessScreen(
                  image: MImages.successfulPayment,
                  title: 'Payment Success!',
                  subTitle: 'Your item will be shipped soon!',
                  onPressed: () => Get.offAll(() => const NavigationMenu()),
                )),
            child: const Text("Check Out \$1700")),
      ),
    );
  }
}
