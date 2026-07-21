import 'package:flutter/material.dart';

/// ─── Colors ──────────────────────────────────────────────────────────────
class AppColors {
  AppColors._();

  static const Color primary = Color(0xFFE50914);
  static const Color accent = Color(0xFFFFC107);

  // Dark theme
  static const Color darkBg = Color(0xFF0A0A0F);
  static const Color darkCard = Color(0xFF1C1C24);
  static const Color darkSurface = Color(0xFF15151B);

  // Light theme
  static const Color lightBg = Color(0xFFF5F5F7);
  static const Color lightCard = Color(0xFFFFFFFF);

  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF9E9EA7);

  static const LinearGradient cardOverlay = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      Colors.black54,
      Colors.black87,
    ],
    stops: [0.3, 0.7, 1.0],
  );
}

/// ─── Spacing ─────────────────────────────────────────────────────────────
class AppSpacing {
  AppSpacing._();

  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
}

/// ─── Radius ──────────────────────────────────────────────────────────────
class AppRadius {
  AppRadius._();

  static const double sm = 6.0;
  static const double md = 12.0;
  static const double lg = 18.0;
  static const double full = 999.0;
}

/// ─── Strings ─────────────────────────────────────────────────────────────
class AppStrings {
  AppStrings._();

  static const String appName = 'CineMax';

  static const List<String> categories = [
    'All',
    'Action',
    'Drama',
    'Comedy',
    'Sci-Fi',
    'Horror',
    'Romance',
    'Animation',
  ];
}
