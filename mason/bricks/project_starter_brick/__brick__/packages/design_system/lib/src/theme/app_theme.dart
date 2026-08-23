import 'package:design_system/src/colors/app_colors.dart';
import 'package:design_system/src/typography/app_typography.dart';
import 'package:flutter/material.dart';

class AppTheme {
  /// Uygulama için TextTheme tanımlaması
  static TextTheme get _textTheme => const TextTheme(
    displayLarge: AppTypography.displayLarge,
    displayMedium: AppTypography.displayMedium,
    displaySmall: AppTypography.displaySmall,
    headlineLarge: AppTypography.headlineLarge,
    headlineMedium: AppTypography.headlineMedium,
    headlineSmall: AppTypography.headlineSmall,
    titleLarge: AppTypography.titleLarge,
    titleMedium: AppTypography.titleMedium,
    titleSmall: AppTypography.titleSmall,
    bodyLarge: AppTypography.bodyLarge,
    bodyMedium: AppTypography.bodyMedium,
    bodySmall: AppTypography.bodySmall,
    labelLarge: AppTypography.labelLarge,
    labelMedium: AppTypography.labelMedium,
    labelSmall: AppTypography.labelSmall,
  );

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: _textTheme,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        error: AppColors.error,
        surface: AppColors.surface,
        onPrimary: AppColors.onPrimary,
        onSecondary: AppColors.onSecondary,
        onError: AppColors.onError,
        onSurface: AppColors.onSurface,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        iconTheme: IconThemeData(color: AppColors.onPrimary),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      textTheme: _textTheme.apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryVariant,
        secondary: AppColors.secondary,
        error: AppColors.error,
        surface: AppColors.grey900,
        onPrimary: AppColors.onPrimary,
        onSecondary: AppColors.onSecondary,
        onError: AppColors.onError,
        onSurface: AppColors.grey50,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.grey900,
        iconTheme: IconThemeData(color: AppColors.grey50),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryVariant,
          foregroundColor: AppColors.onPrimary,
        ),
      ),
    );
  }
}
