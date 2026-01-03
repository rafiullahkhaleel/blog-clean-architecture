import 'package:blog_clean_architecture/core/extension/context_size_box_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_pallete.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final bool isLoading;
  const AuthButton({
    super.key,
    this.onTap,
    required this.title,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onTap,
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
          child: isLoading
              ? CircularProgressIndicator(color: AppPallete.whiteColor)
              : Text(
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
