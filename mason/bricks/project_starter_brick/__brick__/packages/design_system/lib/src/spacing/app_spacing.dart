import 'package:flutter/widgets.dart';

/// Uygulama genelinde tutarlı spacing değerleri.
///
/// Kullanım:
/// ```dart
/// SizedBox(height: AppSpacing.md);
/// Padding(padding: EdgeInsets.all(AppSpacing.lg));
/// ```
abstract class AppSpacing {
  /// 4.0 - Çok küçük boşluklar
  static const double xs = 4;

  /// 8.0 - Küçük boşluklar
  static const double sm = 8;

  /// 16.0 - Orta boşluklar (varsayılan)
  static const double md = 16;

  /// 24.0 - Büyük boşluklar
  static const double lg = 24;

  /// 32.0 - Çok büyük boşluklar
  static const double xl = 32;

  /// 48.0 - Ekstra büyük boşluklar
  static const double xxl = 48;
}

/// Hazır EdgeInsets sabitleri.
///
/// Kullanım:
/// ```dart
/// Padding(padding: AppInsets.allMd);
/// Container(margin: AppInsets.horizontalLg);
/// ```
abstract class AppInsets {
  // All sides
  static const EdgeInsets allXs = EdgeInsets.all(AppSpacing.xs);
  static const EdgeInsets allSm = EdgeInsets.all(AppSpacing.sm);
  static const EdgeInsets allMd = EdgeInsets.all(AppSpacing.md);
  static const EdgeInsets allLg = EdgeInsets.all(AppSpacing.lg);
  static const EdgeInsets allXl = EdgeInsets.all(AppSpacing.xl);

  // Horizontal only
  static const EdgeInsets horizontalXs = EdgeInsets.symmetric(horizontal: AppSpacing.xs);
  static const EdgeInsets horizontalSm = EdgeInsets.symmetric(horizontal: AppSpacing.sm);
  static const EdgeInsets horizontalMd = EdgeInsets.symmetric(horizontal: AppSpacing.md);
  static const EdgeInsets horizontalLg = EdgeInsets.symmetric(horizontal: AppSpacing.lg);
  static const EdgeInsets horizontalXl = EdgeInsets.symmetric(horizontal: AppSpacing.xl);

  // Vertical only
  static const EdgeInsets verticalXs = EdgeInsets.symmetric(vertical: AppSpacing.xs);
  static const EdgeInsets verticalSm = EdgeInsets.symmetric(vertical: AppSpacing.sm);
  static const EdgeInsets verticalMd = EdgeInsets.symmetric(vertical: AppSpacing.md);
  static const EdgeInsets verticalLg = EdgeInsets.symmetric(vertical: AppSpacing.lg);
  static const EdgeInsets verticalXl = EdgeInsets.symmetric(vertical: AppSpacing.xl);
}

/// Boşluk widget'ı - Row ve Column içinde kullanım için.
///
/// Kullanım:
/// ```dart
/// Column(
///   children: [
///     Text('Başlık'),
///     Gap.md(),
///     Text('İçerik'),
///   ],
/// )
/// ```
class Gap extends StatelessWidget {
  const Gap._(this._size, {super.key, this.isHorizontal = false});

  final double _size;
  final bool isHorizontal;

  /// 4.0 piksel boşluk
  const factory Gap.xs({Key? key}) = _GapXs;

  /// 8.0 piksel boşluk
  const factory Gap.sm({Key? key}) = _GapSm;

  /// 16.0 piksel boşluk
  const factory Gap.md({Key? key}) = _GapMd;

  /// 24.0 piksel boşluk
  const factory Gap.lg({Key? key}) = _GapLg;

  /// 32.0 piksel boşluk
  const factory Gap.xl({Key? key}) = _GapXl;

  /// 48.0 piksel boşluk
  const factory Gap.xxl({Key? key}) = _GapXxl;

  /// Yatay boşluk için (Row içinde kullanım)
  static Widget horizontal(double size) => SizedBox(width: size);

  /// Dikey boşluk için (Column içinde kullanım)
  static Widget vertical(double size) => SizedBox(height: size);

  @override
  Widget build(BuildContext context) {
    return isHorizontal ? SizedBox(width: _size) : SizedBox(height: _size);
  }
}

class _GapXs extends Gap {
  const _GapXs({super.key}) : super._(AppSpacing.xs);
}

class _GapSm extends Gap {
  const _GapSm({super.key}) : super._(AppSpacing.sm);
}

class _GapMd extends Gap {
  const _GapMd({super.key}) : super._(AppSpacing.md);
}

class _GapLg extends Gap {
  const _GapLg({super.key}) : super._(AppSpacing.lg);
}

class _GapXl extends Gap {
  const _GapXl({super.key}) : super._(AppSpacing.xl);
}

class _GapXxl extends Gap {
  const _GapXxl({super.key}) : super._(AppSpacing.xxl);
}
