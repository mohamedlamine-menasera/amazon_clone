import 'package:flutter/material.dart';

class ColorManager {
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color(0xFFFF9900);
  static const backgroundColor = Color(0xFFFFFFFF);
  static const Color greyBackgroundColor = Color(0xffebecee);
  static const Color selectedNavBarColor = Color(0xFF00838F);
  static const Color unselectedNavBarColor = Color(0xDD000000);
  static const Color darkGrey = Color(0x61000000); // Colors.black38
  static const Color black = Colors.black; // Colors.black38


}
