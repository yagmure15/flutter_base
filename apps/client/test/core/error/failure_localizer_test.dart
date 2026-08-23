import 'package:flutter_base/core/error/failure_localizer.dart';
import 'package:flutter_base/core/translations/strings.g.dart';
import 'package:flutter_base_core/flutter_base_core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FailureLocalization', () {
    test('maps technical failures to generic localized messages', () {
      expect(
        const Failure.network('socket closed').localizedMessage,
        t.errors.network,
      );
      expect(
        const Failure.server('stack trace...', 500).localizedMessage,
        t.errors.server,
      );
      expect(
        const Failure.unauthorized('jwt expired').localizedMessage,
        t.errors.unauthorized,
      );
      expect(const Failure.unknown('?').localizedMessage, t.errors.unknown);
    });

    test('shows backend validation messages, falling back when empty', () {
      expect(
        const Failure.validation('Email is already taken').localizedMessage,
        'Email is already taken',
      );
      expect(
        const Failure.validation('').localizedMessage,
        t.errors.validation,
      );
    });

    test('uses the active locale', () async {
      await LocaleSettings.setLocale(AppLocale.tr);
      addTearDown(() => LocaleSettings.setLocale(AppLocale.en));

      expect(
        const Failure.network('x').localizedMessage,
        'İnternet bağlantınızı kontrol edip tekrar deneyin.',
      );
    });
  });
}
