import 'package:flex/expose.dart';
import 'package:flex/flex.dart';

/// A set of [Localization] for [supportedLanguages]
class Localizations extends UnmodifiableMapView<Locale, Localization> {
  /// Creates a new instance of [Localizations]
  const Localizations(this.fallbackLocale, this.supportedLanguages, this.supportedLocales, Map<Locale, Localization> localizations) : super(localizations);

  /// The locales supported by these localizations
  final Set<Locale> supportedLocales;

  /// The languages supported by these localizations
  final Set<Language> supportedLanguages;

  /// The [Locale] used if an unsupported language is used to access these localizations.
  final Locale fallbackLocale;

  /// Checks whether [locale] is supported by these localizations
  bool isLocaleSupported(Locale locale) => supportedLocales.contains(locale);

  /// Checks whether [language] is supported by these localizations
  bool isLanguageSupported(Language language) => supportedLanguages.contains(language);

  /// Prefer this to the indexing operator, which should only be used for locales that are guaranteed to exist.
  Localization operator |(Locale language) {
    if (isLocaleSupported(language)) {
      return internalMap[language];
    } else if (isLanguageSupported(language.language)) {
      return internalMap[language.language];
    } else {
      return internalMap[fallbackLocale];
    }
  }
}

/// A set of localized messages/formats/etc. for [locale]
class Localization extends UnmodifiableMapView<String, dynamic> {
  /// Creates a new instance of [Localization]
  const Localization(this.locale, Map<String, dynamic> localizations) : super(localizations);

  /// The locale of this [Localization]
  final Locale locale;

  /// Prefer this to the indexing operator, which should only be used for keys that are guaranteed to exist.
  dynamic operator |(String key) => internalMap.containsKey(key) ? internalMap[key] : key;
}

/// A representation of a locale consisting of a language and, optionally, a country.
class Locale {
  const Locale._(this.language, this.country, this.name);

  /// The language of this locale
  @nullable
  final Language language;

  /// The country of this locale
  @nullable
  final Country country;

  /// The ISO 639-1 representation of this language
  String get code => '${language?.code}_${country?.code}';

  /// The name of this language (in English)
  final String name;

  /// American English
  static const american_english = Locale._(Language.english, Country.united_states, 'American English');

  /// British English
  static const british_english = Locale._(Language.english, Country.united_kingdom, 'British English');

  /// Canadian English
  static const canadian_english = Locale._(Language.english, Country.canada, 'Canadian English');

  /// Canadian French
  static const canadian_french = Locale._(Language.french, Country.canada, 'Canadian French');

  /// French French
  static const french_french = Locale._(Language.french, Country.france, 'French French');

  /// Locales supported by Plexus
  static const locales = {
    canadian_english,
    british_english,
    american_english,
    canadian_french,
    french_french,
  };
}

/// A representation of a language
class Language extends Locale {
  const Language._(this.code, String name) : super._(null, null, name);

  @override
  final String code;

  /// Chinese
  static const chinese = Language._('zh', 'Chinese');

  /// English
  static const english = Language._('en', 'English');

  /// French
  static const french = Language._('fr', 'French');

  /// German
  static const german = Language._('de', 'German');

  /// Spanish
  static const spanish = Language._('es', 'Spanish');

  /// Languages supported by Plexus
  static const all = {
    chinese,
    english,
    french,
    german,
    spanish,
  };
}

/// A representation of a country
class Country {
  const Country._(this.code, this.label);

  /// The ISO 3166-1 representation of this country.
  final String code;

  /// The name of this country (in English).
  final String label;

  /// Australia
  static const australia = Country._('AU', 'Australia');

  /// Canada
  static const canada = Country._('CA', 'Canada');

  /// China
  static const china = Country._('CN', 'China');

  /// France
  static const france = Country._('FR', 'France');

  /// Germany
  static const germany = Country._('DE', 'Germany');

  /// India
  static const india = Country._('IN', 'India');

  /// Spain
  static const spain = Country._('ES', 'Spain');

  /// The United Kingdom
  static const united_kingdom = Country._('UK', 'United Kingdom');

  /// The United States of America
  static const united_states = Country._('US', 'United States of America');

  /// Countries supported by Plexus
  static const all = {
    australia,
    canada,
    china,
    france,
    germany,
    india,
    spain,
    united_kingdom,
    united_states,
  };
}
