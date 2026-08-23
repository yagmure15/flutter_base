///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsTr with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsTr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.tr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <tr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsTr _root = this; // ignore: unused_field

	@override 
	TranslationsTr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsTr(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$common$tr common = _Translations$common$tr._(_root);
	@override late final _Translations$errors$tr errors = _Translations$errors$tr._(_root);
	@override late final _Translations$home$tr home = _Translations$home$tr._(_root);
}

// Path: common
class _Translations$common$tr implements Translations$common$en {
	_Translations$common$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get error => 'Hata';
}

// Path: errors
class _Translations$errors$tr implements Translations$errors$en {
	_Translations$errors$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get network => 'İnternet bağlantınızı kontrol edip tekrar deneyin.';
	@override String get server => 'Sunucu tarafında bir sorun oluştu. Lütfen daha sonra tekrar deneyin.';
	@override String get unauthorized => 'Oturumunuzun süresi doldu. Lütfen tekrar giriş yapın.';
	@override String get forbidden => 'Bu işlem için yetkiniz yok.';
	@override String get notFound => 'İstenen kaynak bulunamadı.';
	@override String get validation => 'Lütfen girdiğiniz bilgileri kontrol edin.';
	@override String get cache => 'Yerel veriler okunamadı. Lütfen tekrar deneyin.';
	@override String get canceled => 'İstek iptal edildi.';
	@override String get unknown => 'Beklenmeyen bir hata oluştu. Lütfen tekrar deneyin.';
}

// Path: home
class _Translations$home$tr implements Translations$home$en {
	_Translations$home$tr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String hello({required Object name}) => 'Merhaba ${name}';
}

/// The flat map containing all translations for locale <tr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsTr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.error' => 'Hata',
			'errors.network' => 'İnternet bağlantınızı kontrol edip tekrar deneyin.',
			'errors.server' => 'Sunucu tarafında bir sorun oluştu. Lütfen daha sonra tekrar deneyin.',
			'errors.unauthorized' => 'Oturumunuzun süresi doldu. Lütfen tekrar giriş yapın.',
			'errors.forbidden' => 'Bu işlem için yetkiniz yok.',
			'errors.notFound' => 'İstenen kaynak bulunamadı.',
			'errors.validation' => 'Lütfen girdiğiniz bilgileri kontrol edin.',
			'errors.cache' => 'Yerel veriler okunamadı. Lütfen tekrar deneyin.',
			'errors.canceled' => 'İstek iptal edildi.',
			'errors.unknown' => 'Beklenmeyen bir hata oluştu. Lütfen tekrar deneyin.',
			'home.hello' => ({required Object name}) => 'Merhaba ${name}',
			_ => null,
		};
	}
}
