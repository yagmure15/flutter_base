///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final Translations$common$en common = Translations$common$en._(_root);
	late final Translations$errors$en errors = Translations$errors$en._(_root);
	late final Translations$home$en home = Translations$home$en._(_root);
}

// Path: common
class Translations$common$en {
	Translations$common$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Error'
	String get error => 'Error';
}

// Path: errors
class Translations$errors$en {
	Translations$errors$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Please check your internet connection and try again.'
	String get network => 'Please check your internet connection and try again.';

	/// en: 'Something went wrong on our side. Please try again later.'
	String get server => 'Something went wrong on our side. Please try again later.';

	/// en: 'Your session has expired. Please sign in again.'
	String get unauthorized => 'Your session has expired. Please sign in again.';

	/// en: 'You don't have permission to perform this action.'
	String get forbidden => 'You don\'t have permission to perform this action.';

	/// en: 'The requested resource could not be found.'
	String get notFound => 'The requested resource could not be found.';

	/// en: 'Please check your input and try again.'
	String get validation => 'Please check your input and try again.';

	/// en: 'Local data could not be read. Please try again.'
	String get cache => 'Local data could not be read. Please try again.';

	/// en: 'The request was canceled.'
	String get canceled => 'The request was canceled.';

	/// en: 'An unexpected error occurred. Please try again.'
	String get unknown => 'An unexpected error occurred. Please try again.';
}

// Path: home
class Translations$home$en {
	Translations$home$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Hello $name'
	String hello({required Object name}) => 'Hello ${name}';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.error' => 'Error',
			'errors.network' => 'Please check your internet connection and try again.',
			'errors.server' => 'Something went wrong on our side. Please try again later.',
			'errors.unauthorized' => 'Your session has expired. Please sign in again.',
			'errors.forbidden' => 'You don\'t have permission to perform this action.',
			'errors.notFound' => 'The requested resource could not be found.',
			'errors.validation' => 'Please check your input and try again.',
			'errors.cache' => 'Local data could not be read. Please try again.',
			'errors.canceled' => 'The request was canceled.',
			'errors.unknown' => 'An unexpected error occurred. Please try again.',
			'home.hello' => ({required Object name}) => 'Hello ${name}',
			_ => null,
		};
	}
}
