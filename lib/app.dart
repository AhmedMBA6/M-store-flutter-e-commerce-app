import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/bindings/general_bindings.dart';
import 'package:flutter_splash_test1/utils/constants/colors.dart';
import 'package:flutter_splash_test1/utils/theme/theme.dart';
import 'package:get/get.dart';

/// == Use this Widget to setup themes, initial Binding, any animations and much more ==
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MAppTheme.lightTheme,
      darkTheme: MAppTheme.darkTheme,
      initialBinding: GeneralBindings(),

      /// Show Loader or circular Progress indecator meanwhile authentication repo is deciding to show relevant screen
      home: const Scaffold(
        backgroundColor: MColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
