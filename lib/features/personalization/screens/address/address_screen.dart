import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/common/widgets/appbar/appbar.dart';
import 'package:flutter_splash_test1/features/personalization/screens/address/add_new_address.dart';
import 'package:flutter_splash_test1/features/personalization/screens/address/widgets/single_address.dart';
import 'package:flutter_splash_test1/utils/constants/colors.dart';
import 'package:flutter_splash_test1/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        backgroundColor: MColors.primary,
        child: const Icon(
          Iconsax.add,
          color: MColors.white,
        ),
      ),
      appBar: MAppbar(
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              MSingleAddress(selectedAdress: false),
              MSingleAddress(selectedAdress: true),
            ],
          ),
        ),
      ),
    );
  }
}
