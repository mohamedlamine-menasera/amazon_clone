import 'package:amazon_clone/presentation/resources/styles/text_style.dart';
import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    textTheme: TextTheme(
      titleLarge:
          getBoldStyle(color: ColorManager.black, fontSize: FontSize.s25),
      // displayMedium:
      // getMediumStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
      // displayLarge:
      // getBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
      //
      bodyLarge:
          getBoldStyle(color: ColorManager.black, fontSize: FontSize.s16),
    ),
    // InputDecoration
    inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.darkGrey)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.darkGrey))),

    // Elevated Button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getMediumStyle(
            color: ColorManager.backgroundColor, fontSize: FontSize.s16),
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: ColorManager.secondaryColor,
      ),
    ),
  );
}
