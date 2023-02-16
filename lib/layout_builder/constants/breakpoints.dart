import 'package:flutter/material.dart';

class Breakpoints {
  static const desktop = 1060;
  static const tablet = 834;
  static const mobile = 375;

  static const twoColLayoutMinWidth = 640;
}

extension BuildContextWide on BuildContext {
  bool isWide() {
    final screenWidth = MediaQuery.of(this).size.width;
    return screenWidth > Breakpoints.tablet;
  }

  double horizontalPadding() {
    final screenWidth = MediaQuery.of(this).size.width;
    if (screenWidth > Breakpoints.desktop) {
      return 0;
    } else if (screenWidth > Breakpoints.mobile) {
      return 28;
    } else {
      return 20;
    }
  }

  double sliverHorizontalPadding() {
    final screenWidth = MediaQuery.of(this).size.width;
    if (screenWidth > Breakpoints.desktop) {
      return (screenWidth - Breakpoints.desktop) / 2;
    } else if (screenWidth > Breakpoints.mobile) {
      return 28;
    } else {
      return 20;
    }
  }

  EdgeInsets dialogHorizontalPadding() {
    final screenWidth = MediaQuery.of(this).size.width;
    if (screenWidth > Breakpoints.tablet) {
      return EdgeInsets.symmetric(
          horizontal: (screenWidth - Breakpoints.tablet) / 2);
    }
    return const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0);
  }
}
