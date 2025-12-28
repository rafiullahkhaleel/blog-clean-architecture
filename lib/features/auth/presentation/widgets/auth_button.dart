import 'package:blog_clean_architecture/core/extension/context_size_box_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  const AuthButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: context.height(7),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppPallete.gradient1,
              AppPallete.gradient2,
              AppPallete.gradient3,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: .circular(12),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
