import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/appbar/appbar.dart';
import 'package:flutter_splash_test1/features/personalization/controllers/update_name_controller.dart';
import 'package:flutter_splash_test1/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      /// Custom appbar
      appBar: MAppbar(
        showBackArrow: true,
        title: Text(
          "Change Name",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(MSizes.defaultSpace),
        child: Column(
          children: [
            /// Heading
            Text(
              'Use real name for easy verification, this name will appear on several pages.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: MSizes.spaceBetweenSections,
            ),

            /// Text field an button
            Form(
                key: controller.updateUserNameFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) =>
                          MValidator.validateEmptyText('First name', value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: MTexts.firstName,
                          prefixIcon: Icon(Iconsax.user)),
                    ),
                    const SizedBox(
                      height: MSizes.spaceBetweenInputFields,
                    ),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) =>
                          MValidator.validateEmptyText('Last name', value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: MTexts.lastName,
                          prefixIcon: Icon(Iconsax.user)),
                    ),
                  ],
                )),
            const SizedBox(
              height: MSizes.spaceBetweenSections,
            ),

            /// Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.updateUserName(),
                  child: const Text("Save")),
            ),
          ],
        ),
      ),
    );
  }
}
