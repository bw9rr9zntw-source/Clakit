import 'package:flutter/material.dart';

/// Small helper for responsive sizing across phones/tablets.
class Responsive {
  Responsive._();

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static bool isTablet(BuildContext context) => screenWidth(context) >= 600;

  /// Height of the hero banner on the home screen.
  static double bannerHeight(BuildContext context) {
    final width = screenWidth(context);
    if (width >= 900) return 420;
    if (width >= 600) return 380;
    return 320;
  }

  /// Number of columns to use in movie grids.
  static int gridColumns(BuildContext context) {
    final width = screenWidth(context);
    if (width >= 1200) return 6;
    if (width >= 900) return 5;
    if (width >= 600) return 4;
    return 3;
  }
}
