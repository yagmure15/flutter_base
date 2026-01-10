import 'package:flutter/widgets.dart';

/// Uygulama genelinde tutarlı font ağırlıkları.
abstract class AppFontWeight {
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}

/// Uygulama genelinde tutarlı typography değerleri.
///
/// Material 3 Design System'a uyumlu TextStyle tanımlamaları.
///
/// Kullanım:
/// ```dart
/// Text('Başlık', style: AppTypography.headlineLarge);
/// Text('İçerik', style: AppTypography.bodyMedium);
/// ```
abstract class AppTypography {
  // Display styles - En büyük başlıklar için
  static const TextStyle displayLarge = TextStyle(
    fontSize: 57,
    fontWeight: AppFontWeight.regular,
    letterSpacing: -0.25,
    height: 1.12,
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: 45,
    fontWeight: AppFontWeight.regular,
    letterSpacing: 0,
    height: 1.16,
  );

  static const TextStyle displaySmall = TextStyle(
    fontSize: 36,
    fontWeight: AppFontWeight.regular,
    letterSpacing: 0,
    height: 1.22,
  );

  // Headline styles - Sayfa başlıkları için
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32,
    fontWeight: AppFontWeight.semiBold,
    letterSpacing: 0,
    height: 1.25,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 28,
    fontWeight: AppFontWeight.semiBold,
    letterSpacing: 0,
    height: 1.29,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: 24,
    fontWeight: AppFontWeight.semiBold,
    letterSpacing: 0,
    height: 1.33,
  );

  // Title styles - Bölüm başlıkları için
  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: AppFontWeight.medium,
    letterSpacing: 0,
    height: 1.27,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 16,
    fontWeight: AppFontWeight.medium,
    letterSpacing: 0.15,
    height: 1.5,
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: 14,
    fontWeight: AppFontWeight.medium,
    letterSpacing: 0.1,
    height: 1.43,
  );

  // Body styles - Genel metin içeriği için
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: AppFontWeight.regular,
    letterSpacing: 0.5,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: AppFontWeight.regular,
    letterSpacing: 0.25,
    height: 1.43,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: AppFontWeight.regular,
    letterSpacing: 0.4,
    height: 1.33,
  );

  // Label styles - Button ve küçük etiketler için
  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: AppFontWeight.medium,
    letterSpacing: 0.1,
    height: 1.43,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: AppFontWeight.medium,
    letterSpacing: 0.5,
    height: 1.33,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 11,
    fontWeight: AppFontWeight.medium,
    letterSpacing: 0.5,
    height: 1.45,
  );
}
