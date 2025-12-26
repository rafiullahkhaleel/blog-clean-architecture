import 'package:flutter/cupertino.dart';

extension ContextSizeBoxExtension on BuildContext {
  SizedBox sh(double percent) {
    final height = MediaQuery.sizeOf(this).height;
    return SizedBox(height: height * percent / 100);
  }

  SizedBox sw(double percent) {
    final width = MediaQuery.sizeOf(this).width;
    return SizedBox(width: width * percent / 100);
  }
}
