import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/utils/theme/theme.dart';

/// == Use this Widget to setup themes, initial Binding, any animations and much more ==
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MAppTheme.lightTheme,
      darkTheme: MAppTheme.darkTheme,
      // home: const MyHomePage(),
    );
  }
}

