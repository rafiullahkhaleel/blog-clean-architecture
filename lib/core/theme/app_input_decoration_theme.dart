import 'package:flutter/material.dart';

import 'app_pallete.dart';

class AppInputDecorationTheme {
  static OutlineInputBorder _border([Color color = AppPallete.borderColor]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color, width: 2),
    );
  }

  static InputDecorationTheme inputDecorationTheme() {
    return InputDecorationTheme(
      enabledBorder: _border(),
      focusedBorder: _border(AppPallete.gradient1),
    );
  }
}
