import 'package:flutter/material.dart';
import 'package:flutter_splash_test1/utils/theme/custom_themes/appbar_theme.dart';
import 'package:flutter_splash_test1/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:flutter_splash_test1/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:flutter_splash_test1/utils/theme/custom_themes/chip_theme.dart';
import 'package:flutter_splash_test1/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:flutter_splash_test1/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:flutter_splash_test1/utils/theme/custom_themes/text_field_theme.dart';
import 'package:flutter_splash_test1/utils/theme/custom_themes/text_theme.dart';

class MAppTheme {
  MAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: MTextTheme.lightTextTheme,
    elevatedButtonTheme: MElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: MAppbarTheme.lightAppBarTheme,
    inputDecorationTheme: MTextFormFieldTheme.lightInputDecorationTheme,
    outlinedButtonTheme: MOutlinedButtonTheme.lightOutlinedButtonTheme,
    checkboxTheme: MCheckboxTheme.lightCheckboxTheme,
    chipTheme: MChipTheme.lightChipTheme,
    bottomSheetTheme: MBottomSheetTheme.lightBottomSheetTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: MTextTheme.darkTextTheme,
    elevatedButtonTheme: MElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: MOutlinedButtonTheme.darkOutlinedButtonTheme,
    appBarTheme: MAppbarTheme.darkAppBarTheme,
    bottomSheetTheme: MBottomSheetTheme.darkBottomSheetTheme,
    inputDecorationTheme: MTextFormFieldTheme.darkInputDecorationTheme,
    chipTheme: MChipTheme.darkChipTheme,
    checkboxTheme: MCheckboxTheme.darkCheckboxTheme,
  );
}
