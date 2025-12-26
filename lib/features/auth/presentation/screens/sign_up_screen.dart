import 'package:blog_clean_architecture/core/extension/context_size_box_extension.dart';
import 'package:blog_clean_architecture/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: .all(10),
        child: Column(
          mainAxisAlignment: .center,
          spacing: 10,
          children: [
            Text(
              'Sign in',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppPallete.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            context.sh(5),
            AuthField(hintText: 'Name'),
            AuthField(hintText: 'Email'),
            AuthField(hintText: 'Password'),
          ],
        ),
      ),
    );
  }
}
