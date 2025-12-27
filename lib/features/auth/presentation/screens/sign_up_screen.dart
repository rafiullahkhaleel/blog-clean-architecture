import 'package:blog_clean_architecture/core/extension/context_size_box_extension.dart';
import 'package:blog_clean_architecture/features/auth/presentation/widgets/auth_button.dart';
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
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: .all(10),
          child: Center(
            child: SingleChildScrollView(
              physics: ScrollPhysics(
                parent: BouncingScrollPhysics()
              ),
              child: Column(
                spacing: 10,
                children: [
                  Text(
                    'Sign up',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: AppPallete.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  context.vSpace(5),
                  AuthField(hintText: 'Name'),
                  AuthField(hintText: 'Email'),
                  AuthField(hintText: 'Password'),
                  context.vSpace(5),
                  AuthButton(),
                  context.vSpace(5),
                  RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppPallete.whiteColor,
                        fontWeight: FontWeight.normal,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign in',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: AppPallete.gradient1,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
