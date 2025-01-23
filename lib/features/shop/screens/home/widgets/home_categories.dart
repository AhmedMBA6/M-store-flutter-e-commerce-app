import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/features/shop/screens/sub_category/sub_categories_screen.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class MHomeCategories extends StatelessWidget {
  const MHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return MVerticalImageText(
            image: MImages.sportIcon,
            title: 'Cosmetics',
            onTap: () => Get.to(() => const SubCategoriesScreen()),
          );
        },
      ),
    );
  }
}
