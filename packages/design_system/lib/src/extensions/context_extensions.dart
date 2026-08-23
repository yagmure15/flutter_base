import 'package:design_system/src/spacing/app_spacing.dart';
import 'package:flutter/material.dart';

/// BuildContext extension'ları - Design system'e kolay erişim.
///
/// Bu extension'lar sayesinde design system değerlerine
/// context üzerinden ergonomik bir şekilde erişebilirsiniz.

/// Renklere erişim için extension.
///
/// Kullanım:
/// ```dart
/// Container(color: context.colors.primary);
/// Text('Başlık', style: TextStyle(color: context.colors.onSurface));
/// ```
extension AppColorsExtension on BuildContext {
  /// Mevcut tema renk şemasına erişim
  ColorScheme get colors => Theme.of(this).colorScheme;

  /// Tema brightness kontrolü
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}

/// Typography'ye erişim için extension.
///
/// Kullanım:
/// ```dart
/// Text('Başlık', style: context.typography.headlineLarge);
/// Text('İçerik', style: context.typography.bodyMedium);
/// ```
extension AppTypographyExtension on BuildContext {
  /// Mevcut tema text theme'ine erişim
  TextTheme get typography => Theme.of(this).textTheme;

  /// Text stili üzerine renk uygulamak için yardımcı
  TextStyle? headlineLarge({Color? color}) =>
      typography.headlineLarge?.copyWith(color: color);

  TextStyle? headlineMedium({Color? color}) =>
      typography.headlineMedium?.copyWith(color: color);

  TextStyle? headlineSmall({Color? color}) =>
      typography.headlineSmall?.copyWith(color: color);

  TextStyle? titleLarge({Color? color}) =>
      typography.titleLarge?.copyWith(color: color);

  TextStyle? titleMedium({Color? color}) =>
      typography.titleMedium?.copyWith(color: color);

  TextStyle? bodyLarge({Color? color}) =>
      typography.bodyLarge?.copyWith(color: color);

  TextStyle? bodyMedium({Color? color}) =>
      typography.bodyMedium?.copyWith(color: color);

  TextStyle? bodySmall({Color? color}) =>
      typography.bodySmall?.copyWith(color: color);

  TextStyle? labelLarge({Color? color}) =>
      typography.labelLarge?.copyWith(color: color);
}

/// Spacing değerlerine erişim için extension.
///
/// Kullanım:
/// ```dart
/// SizedBox(height: context.spacing.md);
/// Padding(padding: context.insets.allLg);
/// ```
extension AppSpacingExtension on BuildContext {
  /// Spacing sabitlerine erişim
  AppSpacingHelper get spacing => const AppSpacingHelper();

  /// EdgeInsets sabitlerine erişim
  AppInsetsHelper get insets => const AppInsetsHelper();
}

/// Spacing değerlerini context üzerinden erişilebilir yapan helper.
class AppSpacingHelper {
  const AppSpacingHelper();

  double get xs => AppSpacing.xs;
  double get sm => AppSpacing.sm;
  double get md => AppSpacing.md;
  double get lg => AppSpacing.lg;
  double get xl => AppSpacing.xl;
  double get xxl => AppSpacing.xxl;
}

/// EdgeInsets değerlerini context üzerinden erişilebilir yapan helper.
class AppInsetsHelper {
  const AppInsetsHelper();

  // All sides
  EdgeInsets get allXs => AppInsets.allXs;
  EdgeInsets get allSm => AppInsets.allSm;
  EdgeInsets get allMd => AppInsets.allMd;
  EdgeInsets get allLg => AppInsets.allLg;
  EdgeInsets get allXl => AppInsets.allXl;

  // Horizontal
  EdgeInsets get horizontalXs => AppInsets.horizontalXs;
  EdgeInsets get horizontalSm => AppInsets.horizontalSm;
  EdgeInsets get horizontalMd => AppInsets.horizontalMd;
  EdgeInsets get horizontalLg => AppInsets.horizontalLg;
  EdgeInsets get horizontalXl => AppInsets.horizontalXl;

  // Vertical
  EdgeInsets get verticalXs => AppInsets.verticalXs;
  EdgeInsets get verticalSm => AppInsets.verticalSm;
  EdgeInsets get verticalMd => AppInsets.verticalMd;
  EdgeInsets get verticalLg => AppInsets.verticalLg;
  EdgeInsets get verticalXl => AppInsets.verticalXl;
}

/// MediaQuery yardımcıları için extension.
///
/// Kullanım:
/// ```dart
/// if (context.isMobile) { ... }
/// final width = context.screenWidth;
/// ```
extension AppMediaQueryExtension on BuildContext {
  /// Ekran genişliği
  double get screenWidth => MediaQuery.sizeOf(this).width;

  /// Ekran yüksekliği
  double get screenHeight => MediaQuery.sizeOf(this).height;

  /// Mobil cihaz mı? (< 600px)
  bool get isMobile => screenWidth < 600;

  /// Tablet mi? (>= 600px ve < 1200px)
  bool get isTablet => screenWidth >= 600 && screenWidth < 1200;

  /// Desktop mu? (>= 1200px)
  bool get isDesktop => screenWidth >= 1200;

  /// Cihaz orientation'ı
  Orientation get orientation => MediaQuery.orientationOf(this);

  /// Portrait mu?
  bool get isPortrait => orientation == Orientation.portrait;

  /// Landscape mi?
  bool get isLandscape => orientation == Orientation.landscape;
}
