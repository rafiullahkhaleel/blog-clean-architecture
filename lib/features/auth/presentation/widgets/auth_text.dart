import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';

class AuthText extends StatelessWidget {
  final String text;
  final String buttonText;
  final VoidCallback onTap;
  const AuthText({
    super.key,
    required this.text,
    required this.buttonText,
    required this.onTap,

  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: AppPallete.whiteColor,
          fontWeight: FontWeight.normal,
        ),
        children: [
          TextSpan(
            text: buttonText,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppPallete.gradient1,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
