import 'package:blog_clean_architecture/core/theme/app_theme.dart';
import 'package:blog_clean_architecture/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App',
      theme: AppTheme.darkMode,
      home: const SignUpScreen(),
    );
  }
}
