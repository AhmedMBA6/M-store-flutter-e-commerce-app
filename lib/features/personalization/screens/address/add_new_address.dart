import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/appbar/appbar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MAppbar(
        title: Text("Add New Address"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: "Name",
                  ),
                ),
                const SizedBox(
                  height: MSizes.spaceBetweenInputFields,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile),
                    labelText: "Phone Number",
                  ),
                ),
                const SizedBox(
                  height: MSizes.spaceBetweenInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building_31),
                          labelText: "Street",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: MSizes.spaceBetweenInputFields,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.code),
                          labelText: "Postal Code",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: MSizes.spaceBetweenInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building),
                          labelText: "City",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: MSizes.spaceBetweenInputFields,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.activity),
                          labelText: "State",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: MSizes.spaceBetweenInputFields,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.global),
                    labelText: "Country",
                  ),
                ),
                const SizedBox(
                  height: MSizes.defaultSpace,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Save"),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
