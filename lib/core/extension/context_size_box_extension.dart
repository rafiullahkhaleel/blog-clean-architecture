import 'package:flutter/cupertino.dart';

extension ContextDimensionsExtension on BuildContext {
  double height(double percent) {
    final height = MediaQuery.sizeOf(this).height;
    return height * percent / 100;
  }

  double width(double percent) {
    final width = MediaQuery.sizeOf(this).width;
    return width * percent / 100;
  }

  SizedBox vSpace(double percent) {
    final height = MediaQuery.sizeOf(this).height;
    return SizedBox(height: height * percent / 100);
  }

  SizedBox hSpace(double percent) {
    final width = MediaQuery.sizeOf(this).width;
    return SizedBox(width: width * percent / 100);
  }
}
