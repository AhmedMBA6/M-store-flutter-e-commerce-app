import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/utils/constants/colors.dart';
import 'package:flutter_splash_test1/utils/device/device_utility.dart';
import 'package:flutter_splash_test1/utils/helpers/helper_functions.dart';

class MTabBar extends StatelessWidget implements PreferredSizeWidget {
  /// if you want to add the background color to tabs you have to wrap them in material widget.
  /// to do that we need [PreferredSize] Widget and that's why craeted custom class
  const MTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? MColors.black : MColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: MColors.primary,
        labelColor: dark ? MColors.white : MColors.primary,
        unselectedLabelColor: MColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MDeviceUtilities.getAppBarHeight());
}
