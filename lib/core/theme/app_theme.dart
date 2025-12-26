import 'package:blog_clean_architecture/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

import 'app_input_decoration_theme.dart';

class AppTheme {
  static final darkMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    inputDecorationTheme: AppInputDecorationTheme.inputDecorationTheme(),
  );
}
