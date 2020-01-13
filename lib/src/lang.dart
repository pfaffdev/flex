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
  String get code => '${language?.alpha2}_${country?.alpha2}';

  /// The name of this language (in English)
  final String name;

  /// Afrikaans
  static const afrikaans = Locale._(Language.afrikaans, null, 'Afrikaans');

  /// Afrikaans Namibia
  static const afrikaansNamibia = Locale._(Language.afrikaans, Country.namibia, 'Afrikaans Namibia');

  /// Afrikaans South Africa
  static const afrikaansSouthAfrica = Locale._(Language.afrikaans, Country.southAfrica, 'Afrikaans South Africa');

  /// agq
  static const agq = Locale._(null, null, 'agq');

  /// agq Cameroon
  static const agqCameroon = Locale._(null, Country.cameroon, 'agq Cameroon');

  /// Akan
  static const akan = Locale._(Language.akan, null, 'Akan');

  /// Akan Ghana
  static const akanGhana = Locale._(Language.akan, Country.ghana, 'Akan Ghana');

  /// Amharic
  static const amharic = Locale._(Language.amharic, null, 'Amharic');

  /// Amharic Ethiopia
  static const amharicEthiopia = Locale._(Language.amharic, Country.ethiopia, 'Amharic Ethiopia');

  /// Arabic
  static const arabic = Locale._(Language.arabic, null, 'Arabic');

  /// Arabic United Arab Emirates
  static const arabicUnitedArabEmirates = Locale._(Language.arabic, Country.unitedArabEmirates, 'Arabic United Arab Emirates');

  /// Arabic Bahrain
  static const arabicBahrain = Locale._(Language.arabic, Country.bahrain, 'Arabic Bahrain');

  /// Arabic Djibouti
  static const arabicDjibouti = Locale._(Language.arabic, Country.djibouti, 'Arabic Djibouti');

  /// Arabic Algeria
  static const arabicAlgeria = Locale._(Language.arabic, Country.algeria, 'Arabic Algeria');

  /// Arabic Egypt
  static const arabicEgypt = Locale._(Language.arabic, Country.egypt, 'Arabic Egypt');

  /// Arabic Western Sahara
  static const arabicWesternSahara = Locale._(Language.arabic, Country.westernSahara, 'Arabic Western Sahara');

  /// Arabic Eritrea
  static const arabicEritrea = Locale._(Language.arabic, Country.eritrea, 'Arabic Eritrea');

  /// Arabic Israel
  static const arabicIsrael = Locale._(Language.arabic, Country.israel, 'Arabic Israel');

  /// Arabic Iraq
  static const arabicIraq = Locale._(Language.arabic, Country.iraq, 'Arabic Iraq');

  /// Arabic Jordan
  static const arabicJordan = Locale._(Language.arabic, Country.jordan, 'Arabic Jordan');

  /// Arabic Comoros
  static const arabicComoros = Locale._(Language.arabic, Country.comoros, 'Arabic Comoros');

  /// Arabic Kuwait
  static const arabicKuwait = Locale._(Language.arabic, Country.kuwait, 'Arabic Kuwait');

  /// Arabic Lebanon
  static const arabicLebanon = Locale._(Language.arabic, Country.lebanon, 'Arabic Lebanon');

  /// Arabic Libya
  static const arabicLibya = Locale._(Language.arabic, Country.libya, 'Arabic Libya');

  /// Arabic Morocco
  static const arabicMorocco = Locale._(Language.arabic, Country.morocco, 'Arabic Morocco');

  /// Arabic Mauritania
  static const arabicMauritania = Locale._(Language.arabic, Country.mauritania, 'Arabic Mauritania');

  /// Arabic Oman
  static const arabicOman = Locale._(Language.arabic, Country.oman, 'Arabic Oman');

  /// Arabic State of Palestine
  static const arabicStateOfPalestine = Locale._(Language.arabic, Country.stateOfPalestine, 'Arabic State of Palestine');

  /// Arabic Qatar
  static const arabicQatar = Locale._(Language.arabic, Country.qatar, 'Arabic Qatar');

  /// Arabic Saudi Arabia
  static const arabicSaudiArabia = Locale._(Language.arabic, Country.saudiArabia, 'Arabic Saudi Arabia');

  /// Arabic Sudan
  static const arabicSudan = Locale._(Language.arabic, Country.sudan, 'Arabic Sudan');

  /// Arabic Somalia
  static const arabicSomalia = Locale._(Language.arabic, Country.somalia, 'Arabic Somalia');

  /// Arabic South Sudan
  static const arabicSouthSudan = Locale._(Language.arabic, Country.southSudan, 'Arabic South Sudan');

  /// Arabic Syrian Arab Republic
  static const arabicSyrianArabRepublic = Locale._(Language.arabic, Country.syrianArabRepublic, 'Arabic Syrian Arab Republic');

  /// Arabic Chad
  static const arabicChad = Locale._(Language.arabic, Country.chad, 'Arabic Chad');

  /// Arabic Tunisia
  static const arabicTunisia = Locale._(Language.arabic, Country.tunisia, 'Arabic Tunisia');

  /// Arabic Yemen
  static const arabicYemen = Locale._(Language.arabic, Country.yemen, 'Arabic Yemen');

  /// Assamese
  static const assamese = Locale._(Language.assamese, null, 'Assamese');

  /// Assamese India
  static const assameseIndia = Locale._(Language.assamese, Country.india, 'Assamese India');

  /// asa
  static const asa = Locale._(null, null, 'asa');

  /// asa United Republic of Tanzania
  static const asaUnitedRepublicOfTanzania = Locale._(null, Country.unitedRepublicOfTanzania, 'asa United Republic of Tanzania');

  /// Asturian; Bable; Leonese; Asturleonese
  static const asturian = Locale._(Language.asturian, null, 'Asturian; Bable; Leonese; Asturleonese');

  /// Asturian; Bable; Leonese; Asturleonese Spain
  static const asturianSpain = Locale._(Language.asturian, Country.spain, 'Asturian; Bable; Leonese; Asturleonese Spain');

  /// Azerbaijani
  static const azerbaijani = Locale._(Language.azerbaijani, null, 'Azerbaijani');

  /// Basa
  static const basa = Locale._(Language.basa, null, 'Basa');

  /// Basa Cameroon
  static const basaCameroon = Locale._(Language.basa, Country.cameroon, 'Basa Cameroon');

  /// Belarusian
  static const belarusian = Locale._(Language.belarusian, null, 'Belarusian');

  /// Belarusian Belarus
  static const belarusianBelarus = Locale._(Language.belarusian, Country.belarus, 'Belarusian Belarus');

  /// Bemba
  static const bemba = Locale._(Language.bemba, null, 'Bemba');

  /// Bemba Zambia
  static const bembaZambia = Locale._(Language.bemba, Country.zambia, 'Bemba Zambia');

  /// bez
  static const bez = Locale._(null, null, 'bez');

  /// bez United Republic of Tanzania
  static const bezUnitedRepublicOfTanzania = Locale._(null, Country.unitedRepublicOfTanzania, 'bez United Republic of Tanzania');

  /// Bulgarian
  static const bulgarian = Locale._(Language.bulgarian, null, 'Bulgarian');

  /// Bulgarian Bulgaria
  static const bulgarianBulgaria = Locale._(Language.bulgarian, Country.bulgaria, 'Bulgarian Bulgaria');

  /// Bambara
  static const bambara = Locale._(Language.bambara, null, 'Bambara');

  /// Bambara Mali
  static const bambaraMali = Locale._(Language.bambara, Country.mali, 'Bambara Mali');

  /// Bengali
  static const bengali = Locale._(Language.bengali, null, 'Bengali');

  /// Bengali Bangladesh
  static const bengaliBangladesh = Locale._(Language.bengali, Country.bangladesh, 'Bengali Bangladesh');

  /// Bengali India
  static const bengaliIndia = Locale._(Language.bengali, Country.india, 'Bengali India');

  /// Tibetan
  static const tibetan = Locale._(Language.tibetan, null, 'Tibetan');

  /// Tibetan China
  static const tibetanChina = Locale._(Language.tibetan, Country.china, 'Tibetan China');

  /// Tibetan India
  static const tibetanIndia = Locale._(Language.tibetan, Country.india, 'Tibetan India');

  /// Breton
  static const breton = Locale._(Language.breton, null, 'Breton');

  /// Breton France
  static const bretonFrance = Locale._(Language.breton, Country.france, 'Breton France');

  /// brx
  static const brx = Locale._(null, null, 'brx');

  /// brx India
  static const brxIndia = Locale._(null, Country.india, 'brx India');

  /// Bosnian
  static const bosnian = Locale._(Language.bosnian, null, 'Bosnian');

  /// Catalan; Valencian
  static const catalan = Locale._(Language.catalan, null, 'Catalan; Valencian');

  /// Catalan; Valencian Andorra
  static const catalanAndorra = Locale._(Language.catalan, Country.andorra, 'Catalan; Valencian Andorra');

  /// Catalan; Valencian Spain
  static const catalanSpain = Locale._(Language.catalan, Country.spain, 'Catalan; Valencian Spain');

  /// Catalan; Valencian France
  static const catalanFrance = Locale._(Language.catalan, Country.france, 'Catalan; Valencian France');

  /// Catalan; Valencian Italy
  static const catalanItaly = Locale._(Language.catalan, Country.italy, 'Catalan; Valencian Italy');

  /// ccp
  static const ccp = Locale._(null, null, 'ccp');

  /// ccp Bangladesh
  static const ccpBangladesh = Locale._(null, Country.bangladesh, 'ccp Bangladesh');

  /// ccp India
  static const ccpIndia = Locale._(null, Country.india, 'ccp India');

  /// Chechen
  static const chechen = Locale._(Language.chechen, null, 'Chechen');

  /// Chechen Russian Federation
  static const chechenRussianFederation = Locale._(Language.chechen, Country.russianFederation, 'Chechen Russian Federation');

  /// Cebuano
  static const cebuano = Locale._(Language.cebuano, null, 'Cebuano');

  /// Cebuano Philippines
  static const cebuanoPhilippines = Locale._(Language.cebuano, Country.philippines, 'Cebuano Philippines');

  /// cgg
  static const cgg = Locale._(null, null, 'cgg');

  /// cgg Uganda
  static const cggUganda = Locale._(null, Country.uganda, 'cgg Uganda');

  /// Cherokee
  static const cherokee = Locale._(Language.cherokee, null, 'Cherokee');

  /// Cherokee United States of America
  static const cherokeeUnitedStatesOfAmerica = Locale._(Language.cherokee, Country.unitedStates, 'Cherokee United States of America');

  /// ckb
  static const ckb = Locale._(null, null, 'ckb');

  /// ckb Iraq
  static const ckbIraq = Locale._(null, Country.iraq, 'ckb Iraq');

  /// ckb Iran
  static const ckbIran = Locale._(null, Country.iran, 'ckb Iran');

  /// Czech
  static const czech = Locale._(Language.czech, null, 'Czech');

  /// Czech Czechia
  static const czechCzechia = Locale._(Language.czech, Country.czechia, 'Czech Czechia');

  /// Old Slavonic/Old Bulgarian
  static const oldSlavonic = Locale._(Language.oldSlavonic, null, 'Old Slavonic/Old Bulgarian');

  /// Old Slavonic/Old Bulgarian Russian Federation
  static const oldSlavonicRussianFederation = Locale._(Language.oldSlavonic, Country.russianFederation, 'Old Slavonic/Old Bulgarian Russian Federation');

  /// Welsh
  static const welsh = Locale._(Language.welsh, null, 'Welsh');

  /// Welsh United Kingdom
  static const welshUnitedKingdom = Locale._(Language.welsh, Country.unitedKingdom, 'Welsh United Kingdom');

  /// Danish
  static const danish = Locale._(Language.danish, null, 'Danish');

  /// Danish Denmark
  static const danishDenmark = Locale._(Language.danish, Country.denmark, 'Danish Denmark');

  /// Danish Greenland
  static const danishGreenland = Locale._(Language.danish, Country.greenland, 'Danish Greenland');

  /// dav
  static const dav = Locale._(null, null, 'dav');

  /// dav Kenya
  static const davKenya = Locale._(null, Country.kenya, 'dav Kenya');

  /// German
  static const german = Locale._(Language.german, null, 'German');

  /// German Austria
  static const germanAustria = Locale._(Language.german, Country.austria, 'German Austria');

  /// German Belgium
  static const germanBelgium = Locale._(Language.german, Country.belgium, 'German Belgium');

  /// German Switzerland
  static const germanSwitzerland = Locale._(Language.german, Country.switzerland, 'German Switzerland');

  /// German Germany
  static const germanGermany = Locale._(Language.german, Country.germany, 'German Germany');

  /// German Italy
  static const germanItaly = Locale._(Language.german, Country.italy, 'German Italy');

  /// German Liechtenstein
  static const germanLiechtenstein = Locale._(Language.german, Country.liechtenstein, 'German Liechtenstein');

  /// German Luxembourg
  static const germanLuxembourg = Locale._(Language.german, Country.luxembourg, 'German Luxembourg');

  /// dje
  static const dje = Locale._(null, null, 'dje');

  /// dje Niger
  static const djeNiger = Locale._(null, Country.niger, 'dje Niger');

  /// Lower Sorbian
  static const lowerSorbian = Locale._(Language.lowerSorbian, null, 'Lower Sorbian');

  /// Lower Sorbian Germany
  static const lowerSorbianGermany = Locale._(Language.lowerSorbian, Country.germany, 'Lower Sorbian Germany');

  /// Duala
  static const duala = Locale._(Language.duala, null, 'Duala');

  /// Duala Cameroon
  static const dualaCameroon = Locale._(Language.duala, Country.cameroon, 'Duala Cameroon');

  /// dyo
  static const dyo = Locale._(null, null, 'dyo');

  /// dyo Senegal
  static const dyoSenegal = Locale._(null, Country.senegal, 'dyo Senegal');

  /// Dzongkha
  static const dzongkha = Locale._(Language.dzongkha, null, 'Dzongkha');

  /// Dzongkha Bhutan
  static const dzongkhaBhutan = Locale._(Language.dzongkha, Country.bhutan, 'Dzongkha Bhutan');

  /// ebu
  static const ebu = Locale._(null, null, 'ebu');

  /// ebu Kenya
  static const ebuKenya = Locale._(null, Country.kenya, 'ebu Kenya');

  /// Ewe
  static const ewe = Locale._(Language.ewe, null, 'Ewe');

  /// Ewe Ghana
  static const eweGhana = Locale._(Language.ewe, Country.ghana, 'Ewe Ghana');

  /// Ewe Togo
  static const eweTogo = Locale._(Language.ewe, Country.togo, 'Ewe Togo');

  /// Greek, Modern (1453-)
  static const greekModern1453 = Locale._(Language.greekModern1453, null, 'Greek, Modern (1453-)');

  /// Greek, Modern (1453-) Cyprus
  static const greekModern1453Cyprus = Locale._(Language.greekModern1453, Country.cyprus, 'Greek, Modern (1453-) Cyprus');

  /// Greek, Modern (1453-) Greece
  static const greekModern1453Greece = Locale._(Language.greekModern1453, Country.greece, 'Greek, Modern (1453-) Greece');

  /// English
  static const english = Locale._(Language.english, null, 'English');

  /// English United Arab Emirates
  static const englishUnitedArabEmirates = Locale._(Language.english, Country.unitedArabEmirates, 'English United Arab Emirates');

  /// English Antigua and Barbuda
  static const englishAntiguaAndBarbuda = Locale._(Language.english, Country.antiguaAndBarbuda, 'English Antigua and Barbuda');

  /// English Anguilla
  static const englishAnguilla = Locale._(Language.english, Country.anguilla, 'English Anguilla');

  /// English American Samoa
  static const englishAmericanSamoa = Locale._(Language.english, Country.americanSamoa, 'English American Samoa');

  /// English Austria
  static const englishAustria = Locale._(Language.english, Country.austria, 'English Austria');

  /// English Australia
  static const englishAustralia = Locale._(Language.english, Country.australia, 'English Australia');

  /// English Barbados
  static const englishBarbados = Locale._(Language.english, Country.barbados, 'English Barbados');

  /// English Belgium
  static const englishBelgium = Locale._(Language.english, Country.belgium, 'English Belgium');

  /// English Burundi
  static const englishBurundi = Locale._(Language.english, Country.burundi, 'English Burundi');

  /// English Bermuda
  static const englishBermuda = Locale._(Language.english, Country.bermuda, 'English Bermuda');

  /// English Bahamas
  static const englishBahamas = Locale._(Language.english, Country.bahamas, 'English Bahamas');

  /// English Botswana
  static const englishBotswana = Locale._(Language.english, Country.botswana, 'English Botswana');

  /// English Belize
  static const englishBelize = Locale._(Language.english, Country.belize, 'English Belize');

  /// English Canada
  static const englishCanada = Locale._(Language.english, Country.canada, 'English Canada');

  /// English Cocos Islands
  static const englishCocosIslands = Locale._(Language.english, Country.cocosIslands, 'English Cocos Islands');

  /// English Switzerland
  static const englishSwitzerland = Locale._(Language.english, Country.switzerland, 'English Switzerland');

  /// English Cook Islands
  static const englishCookIslands = Locale._(Language.english, Country.cookIslands, 'English Cook Islands');

  /// English Cameroon
  static const englishCameroon = Locale._(Language.english, Country.cameroon, 'English Cameroon');

  /// English Christmas Island
  static const englishChristmasIsland = Locale._(Language.english, Country.christmasIsland, 'English Christmas Island');

  /// English Cyprus
  static const englishCyprus = Locale._(Language.english, Country.cyprus, 'English Cyprus');

  /// English Germany
  static const englishGermany = Locale._(Language.english, Country.germany, 'English Germany');

  /// EnglishDG
  static const englishDG = Locale._(Language.english, null, 'EnglishDG');

  /// English Denmark
  static const englishDenmark = Locale._(Language.english, Country.denmark, 'English Denmark');

  /// English Dominica
  static const englishDominica = Locale._(Language.english, Country.dominica, 'English Dominica');

  /// English Eritrea
  static const englishEritrea = Locale._(Language.english, Country.eritrea, 'English Eritrea');

  /// English Finland
  static const englishFinland = Locale._(Language.english, Country.finland, 'English Finland');

  /// English Fiji
  static const englishFiji = Locale._(Language.english, Country.fiji, 'English Fiji');

  /// English Falkland Islands
  static const englishFalklandIslands = Locale._(Language.english, Country.falklandIslands, 'English Falkland Islands');

  /// English Federated States of Micronesia
  static const englishFederatedStatesOfMicronesia = Locale._(Language.english, Country.federatedStatesOfMicronesia, 'English Federated States of Micronesia');

  /// English United Kingdom
  static const englishUnitedKingdom = Locale._(Language.english, Country.unitedKingdom, 'English United Kingdom');

  /// English Grenada
  static const englishGrenada = Locale._(Language.english, Country.grenada, 'English Grenada');

  /// English Guernsey
  static const englishGuernsey = Locale._(Language.english, Country.guernsey, 'English Guernsey');

  /// English Ghana
  static const englishGhana = Locale._(Language.english, Country.ghana, 'English Ghana');

  /// English Gibraltar
  static const englishGibraltar = Locale._(Language.english, Country.gibraltar, 'English Gibraltar');

  /// English Gambia
  static const englishGambia = Locale._(Language.english, Country.gambia, 'English Gambia');

  /// English Guam
  static const englishGuam = Locale._(Language.english, Country.guam, 'English Guam');

  /// English Guyana
  static const englishGuyana = Locale._(Language.english, Country.guyana, 'English Guyana');

  /// English Hong Kong
  static const englishHongKong = Locale._(Language.english, Country.hongKong, 'English Hong Kong');

  /// English Ireland
  static const englishIreland = Locale._(Language.english, Country.ireland, 'English Ireland');

  /// English Israel
  static const englishIsrael = Locale._(Language.english, Country.israel, 'English Israel');

  /// English Isle of Man
  static const englishIsleOfMan = Locale._(Language.english, Country.isleOfMan, 'English Isle of Man');

  /// English India
  static const englishIndia = Locale._(Language.english, Country.india, 'English India');

  /// English British Indian Ocean Territory
  static const englishBritishIndianOceanTerritory = Locale._(Language.english, Country.britishIndianOceanTerritory, 'English British Indian Ocean Territory');

  /// English Jersey
  static const englishJersey = Locale._(Language.english, Country.jersey, 'English Jersey');

  /// English Jamaica
  static const englishJamaica = Locale._(Language.english, Country.jamaica, 'English Jamaica');

  /// English Kenya
  static const englishKenya = Locale._(Language.english, Country.kenya, 'English Kenya');

  /// English Kiribati
  static const englishKiribati = Locale._(Language.english, Country.kiribati, 'English Kiribati');

  /// English Saint Kitts and Nevis
  static const englishSaintKittsAndNevis = Locale._(Language.english, Country.saintKittsAndNevis, 'English Saint Kitts and Nevis');

  /// English Cayman Islands
  static const englishCaymanIslands = Locale._(Language.english, Country.caymanIslands, 'English Cayman Islands');

  /// English Saint Lucia
  static const englishSaintLucia = Locale._(Language.english, Country.saintLucia, 'English Saint Lucia');

  /// English Liberia
  static const englishLiberia = Locale._(Language.english, Country.liberia, 'English Liberia');

  /// English Lesotho
  static const englishLesotho = Locale._(Language.english, Country.lesotho, 'English Lesotho');

  /// English Madagascar
  static const englishMadagascar = Locale._(Language.english, Country.madagascar, 'English Madagascar');

  /// English Marshall Islands
  static const englishMarshallIslands = Locale._(Language.english, Country.marshallIslands, 'English Marshall Islands');

  /// English Macao
  static const englishMacao = Locale._(Language.english, Country.macao, 'English Macao');

  /// English Northern Mariana Islands
  static const englishNorthernMarianaIslands = Locale._(Language.english, Country.northernMarianaIslands, 'English Northern Mariana Islands');

  /// English Montserrat
  static const englishMontserrat = Locale._(Language.english, Country.montserrat, 'English Montserrat');

  /// English Malta
  static const englishMalta = Locale._(Language.english, Country.malta, 'English Malta');

  /// English Mauritius
  static const englishMauritius = Locale._(Language.english, Country.mauritius, 'English Mauritius');

  /// English Malawi
  static const englishMalawi = Locale._(Language.english, Country.malawi, 'English Malawi');

  /// English Malaysia
  static const englishMalaysia = Locale._(Language.english, Country.malaysia, 'English Malaysia');

  /// English Namibia
  static const englishNamibia = Locale._(Language.english, Country.namibia, 'English Namibia');

  /// English Norfolk Island
  static const englishNorfolkIsland = Locale._(Language.english, Country.norfolkIsland, 'English Norfolk Island');

  /// English Nigeria
  static const englishNigeria = Locale._(Language.english, Country.nigeria, 'English Nigeria');

  /// English Netherlands
  static const englishNetherlands = Locale._(Language.english, Country.netherlands, 'English Netherlands');

  /// English Nauru
  static const englishNauru = Locale._(Language.english, Country.nauru, 'English Nauru');

  /// English Niue
  static const englishNiue = Locale._(Language.english, Country.niue, 'English Niue');

  /// English New Zealand
  static const englishNewZealand = Locale._(Language.english, Country.newZealand, 'English New Zealand');

  /// English Papua New Guinea
  static const englishPapuaNewGuinea = Locale._(Language.english, Country.papuaNewGuinea, 'English Papua New Guinea');

  /// English Philippines
  static const englishPhilippines = Locale._(Language.english, Country.philippines, 'English Philippines');

  /// English Pakistan
  static const englishPakistan = Locale._(Language.english, Country.pakistan, 'English Pakistan');

  /// English Pitcairn
  static const englishPitcairn = Locale._(Language.english, Country.pitcairn, 'English Pitcairn');

  /// English Puerto Rico
  static const englishPuertoRico = Locale._(Language.english, Country.puertoRico, 'English Puerto Rico');

  /// English Palau
  static const englishPalau = Locale._(Language.english, Country.palau, 'English Palau');

  /// English Rwanda
  static const englishRwanda = Locale._(Language.english, Country.rwanda, 'English Rwanda');

  /// English Solomon Islands
  static const englishSolomonIslands = Locale._(Language.english, Country.solomonIslands, 'English Solomon Islands');

  /// English Seychelles
  static const englishSeychelles = Locale._(Language.english, Country.seychelles, 'English Seychelles');

  /// English Sudan
  static const englishSudan = Locale._(Language.english, Country.sudan, 'English Sudan');

  /// English Sweden
  static const englishSweden = Locale._(Language.english, Country.sweden, 'English Sweden');

  /// English Singapore
  static const englishSingapore = Locale._(Language.english, Country.singapore, 'English Singapore');

  /// English Saint Helena, Ascension and Tristan da Cunha
  static const englishSaintHelenaAscensionAndTristanDaCunha = Locale._(Language.english, Country.saintHelenaAscensionAndTristanDaCunha, 'English Saint Helena, Ascension and Tristan da Cunha');

  /// English Slovenia
  static const englishSlovenia = Locale._(Language.english, Country.slovenia, 'English Slovenia');

  /// English Sierra Leone
  static const englishSierraLeone = Locale._(Language.english, Country.sierraLeone, 'English Sierra Leone');

  /// English South Sudan
  static const englishSouthSudan = Locale._(Language.english, Country.southSudan, 'English South Sudan');

  /// English Sint Maarten
  static const englishSintMaarten = Locale._(Language.english, Country.sintMaarten, 'English Sint Maarten');

  /// English Eswatini
  static const englishEswatini = Locale._(Language.english, Country.eswatini, 'English Eswatini');

  /// English Turks and Caicos Islands
  static const englishTurksAndCaicosIslands = Locale._(Language.english, Country.turksAndCaicosIslands, 'English Turks and Caicos Islands');

  /// English Tokelau
  static const englishTokelau = Locale._(Language.english, Country.tokelau, 'English Tokelau');

  /// English Tonga
  static const englishTonga = Locale._(Language.english, Country.tonga, 'English Tonga');

  /// English Trinidad and Tobago
  static const englishTrinidadAndTobago = Locale._(Language.english, Country.trinidadAndTobago, 'English Trinidad and Tobago');

  /// English Tuvalu
  static const englishTuvalu = Locale._(Language.english, Country.tuvalu, 'English Tuvalu');

  /// English United Republic of Tanzania
  static const englishUnitedRepublicOfTanzania = Locale._(Language.english, Country.unitedRepublicOfTanzania, 'English United Republic of Tanzania');

  /// English Uganda
  static const englishUganda = Locale._(Language.english, Country.uganda, 'English Uganda');

  /// English United States Minor Outlying Islands
  static const englishUnitedStatesMinorOutlyingIslands = Locale._(Language.english, Country.unitedStatesMinorOutlyingIslands, 'English United States Minor Outlying Islands');

  /// English United States of America
  static const englishUnitedStatesOfAmerica = Locale._(Language.english, Country.unitedStates, 'English United States of America');

  /// English Saint Vincent and the Grenadines
  static const englishSaintVincentAndTheGrenadines = Locale._(Language.english, Country.saintVincentAndTheGrenadines, 'English Saint Vincent and the Grenadines');

  /// English Virgin Islands (British)
  static const englishVirginIslandsBritish = Locale._(Language.english, Country.virginIslandsBritish, 'English Virgin Islands (British)');

  /// English Virgin Islands (U.S.)
  static const englishVirginIslandsUS = Locale._(Language.english, Country.virginIslandsUS, 'English Virgin Islands (U.S.)');

  /// English Vanuatu
  static const englishVanuatu = Locale._(Language.english, Country.vanuatu, 'English Vanuatu');

  /// English Samoa
  static const englishSamoa = Locale._(Language.english, Country.samoa, 'English Samoa');

  /// English South Africa
  static const englishSouthAfrica = Locale._(Language.english, Country.southAfrica, 'English South Africa');

  /// English Zambia
  static const englishZambia = Locale._(Language.english, Country.zambia, 'English Zambia');

  /// English Zimbabwe
  static const englishZimbabwe = Locale._(Language.english, Country.zimbabwe, 'English Zimbabwe');

  /// Esperanto
  static const esperanto = Locale._(Language.esperanto, null, 'Esperanto');

  /// Spanish
  static const spanish = Locale._(Language.spanish, null, 'Spanish');

  /// Spanish Argentina
  static const spanishArgentina = Locale._(Language.spanish, Country.argentina, 'Spanish Argentina');

  /// Spanish Plurinational State of Bolivia
  static const spanishPlurinationalStateOfBolivia = Locale._(Language.spanish, Country.plurinationalStateOfBolivia, 'Spanish Plurinational State of Bolivia');

  /// Spanish Brazil
  static const spanishBrazil = Locale._(Language.spanish, Country.brazil, 'Spanish Brazil');

  /// Spanish Belize
  static const spanishBelize = Locale._(Language.spanish, Country.belize, 'Spanish Belize');

  /// Spanish Chile
  static const spanishChile = Locale._(Language.spanish, Country.chile, 'Spanish Chile');

  /// Spanish Colombia
  static const spanishColombia = Locale._(Language.spanish, Country.colombia, 'Spanish Colombia');

  /// Spanish Costa Rica
  static const spanishCostaRica = Locale._(Language.spanish, Country.costaRica, 'Spanish Costa Rica');

  /// Spanish Cuba
  static const spanishCuba = Locale._(Language.spanish, Country.cuba, 'Spanish Cuba');

  /// Spanish Dominican Republic
  static const spanishDominicanRepublic = Locale._(Language.spanish, Country.dominicanRepublic, 'Spanish Dominican Republic');

  /// SpanishEA
  static const spanishEA = Locale._(Language.spanish, null, 'SpanishEA');

  /// Spanish Ecuador
  static const spanishEcuador = Locale._(Language.spanish, Country.ecuador, 'Spanish Ecuador');

  /// Spanish Spain
  static const spanishSpain = Locale._(Language.spanish, Country.spain, 'Spanish Spain');

  /// Spanish Equatorial Guinea
  static const spanishEquatorialGuinea = Locale._(Language.spanish, Country.equatorialGuinea, 'Spanish Equatorial Guinea');

  /// Spanish Guatemala
  static const spanishGuatemala = Locale._(Language.spanish, Country.guatemala, 'Spanish Guatemala');

  /// Spanish Honduras
  static const spanishHonduras = Locale._(Language.spanish, Country.honduras, 'Spanish Honduras');

  /// SpanishIC
  static const spanishIC = Locale._(Language.spanish, null, 'SpanishIC');

  /// Spanish Mexico
  static const spanishMexico = Locale._(Language.spanish, Country.mexico, 'Spanish Mexico');

  /// Spanish Nicaragua
  static const spanishNicaragua = Locale._(Language.spanish, Country.nicaragua, 'Spanish Nicaragua');

  /// Spanish Panama
  static const spanishPanama = Locale._(Language.spanish, Country.panama, 'Spanish Panama');

  /// Spanish Peru
  static const spanishPeru = Locale._(Language.spanish, Country.peru, 'Spanish Peru');

  /// Spanish Philippines
  static const spanishPhilippines = Locale._(Language.spanish, Country.philippines, 'Spanish Philippines');

  /// Spanish Puerto Rico
  static const spanishPuertoRico = Locale._(Language.spanish, Country.puertoRico, 'Spanish Puerto Rico');

  /// Spanish Paraguay
  static const spanishParaguay = Locale._(Language.spanish, Country.paraguay, 'Spanish Paraguay');

  /// Spanish El Salvador
  static const spanishElSalvador = Locale._(Language.spanish, Country.elSalvador, 'Spanish El Salvador');

  /// Spanish United States of America
  static const spanishUnitedStatesOfAmerica = Locale._(Language.spanish, Country.unitedStates, 'Spanish United States of America');

  /// Spanish Uruguay
  static const spanishUruguay = Locale._(Language.spanish, Country.uruguay, 'Spanish Uruguay');

  /// Spanish Bolivarian Republic of Venezuela
  static const spanishBolivarianRepublicOfVenezuela = Locale._(Language.spanish, Country.bolivarianRepublicOfVenezuela, 'Spanish Bolivarian Republic of Venezuela');

  /// Estonian
  static const estonian = Locale._(Language.estonian, null, 'Estonian');

  /// Estonian Estonia
  static const estonianEstonia = Locale._(Language.estonian, Country.estonia, 'Estonian Estonia');

  /// Basque
  static const basque = Locale._(Language.basque, null, 'Basque');

  /// Basque Spain
  static const basqueSpain = Locale._(Language.basque, Country.spain, 'Basque Spain');

  /// Ewondo
  static const ewondo = Locale._(Language.ewondo, null, 'Ewondo');

  /// Ewondo Cameroon
  static const ewondoCameroon = Locale._(Language.ewondo, Country.cameroon, 'Ewondo Cameroon');

  /// Persian
  static const persian = Locale._(Language.persian, null, 'Persian');

  /// Persian Afghanistan
  static const persianAfghanistan = Locale._(Language.persian, Country.afghanistan, 'Persian Afghanistan');

  /// Persian Iran
  static const persianIran = Locale._(Language.persian, Country.iran, 'Persian Iran');

  /// Fulah
  static const fulah = Locale._(Language.fulah, null, 'Fulah');

  /// Finnish
  static const finnish = Locale._(Language.finnish, null, 'Finnish');

  /// Finnish Finland
  static const finnishFinland = Locale._(Language.finnish, Country.finland, 'Finnish Finland');

  /// Filipino; Pilipino
  static const filipino = Locale._(Language.filipino, null, 'Filipino; Pilipino');

  /// Filipino; Pilipino Philippines
  static const filipinoPhilippines = Locale._(Language.filipino, Country.philippines, 'Filipino; Pilipino Philippines');

  /// Faroese
  static const faroese = Locale._(Language.faroese, null, 'Faroese');

  /// Faroese Denmark
  static const faroeseDenmark = Locale._(Language.faroese, Country.denmark, 'Faroese Denmark');

  /// Faroese Faroe Islands
  static const faroeseFaroeIslands = Locale._(Language.faroese, Country.faroeIslands, 'Faroese Faroe Islands');

  /// French
  static const french = Locale._(Language.french, null, 'French');

  /// French Belgium
  static const frenchBelgium = Locale._(Language.french, Country.belgium, 'French Belgium');

  /// French Burkina Faso
  static const frenchBurkinaFaso = Locale._(Language.french, Country.burkinaFaso, 'French Burkina Faso');

  /// French Burundi
  static const frenchBurundi = Locale._(Language.french, Country.burundi, 'French Burundi');

  /// French Benin
  static const frenchBenin = Locale._(Language.french, Country.benin, 'French Benin');

  /// French Saint Barthélemy
  static const frenchSaintBarthelemy = Locale._(Language.french, Country.saintBarthelemy, 'French Saint Barthélemy');

  /// French Canada
  static const frenchCanada = Locale._(Language.french, Country.canada, 'French Canada');

  /// French Democratic Republic of the Congo
  static const frenchDemocraticRepublicOfTheCongo = Locale._(Language.french, Country.democraticRepublicOfTheCongo, 'French Democratic Republic of the Congo');

  /// French Central African Republic
  static const frenchCentralAfricanRepublic = Locale._(Language.french, Country.centralAfricanRepublic, 'French Central African Republic');

  /// French Congo
  static const frenchCongo = Locale._(Language.french, Country.congo, 'French Congo');

  /// French Switzerland
  static const frenchSwitzerland = Locale._(Language.french, Country.switzerland, 'French Switzerland');

  /// French Côte d'Ivoire
  static const frenchCoteDIvoire = Locale._(Language.french, Country.coteDIvoire, 'French Côte d\'Ivoire');

  /// French Cameroon
  static const frenchCameroon = Locale._(Language.french, Country.cameroon, 'French Cameroon');

  /// French Djibouti
  static const frenchDjibouti = Locale._(Language.french, Country.djibouti, 'French Djibouti');

  /// French Algeria
  static const frenchAlgeria = Locale._(Language.french, Country.algeria, 'French Algeria');

  /// French France
  static const frenchFrance = Locale._(Language.french, Country.france, 'French France');

  /// French Gabon
  static const frenchGabon = Locale._(Language.french, Country.gabon, 'French Gabon');

  /// French French Guiana
  static const frenchFrenchGuiana = Locale._(Language.french, Country.frenchGuiana, 'French French Guiana');

  /// French Guinea
  static const frenchGuinea = Locale._(Language.french, Country.guinea, 'French Guinea');

  /// French Guadeloupe
  static const frenchGuadeloupe = Locale._(Language.french, Country.guadeloupe, 'French Guadeloupe');

  /// French Equatorial Guinea
  static const frenchEquatorialGuinea = Locale._(Language.french, Country.equatorialGuinea, 'French Equatorial Guinea');

  /// French Haiti
  static const frenchHaiti = Locale._(Language.french, Country.haiti, 'French Haiti');

  /// French Comoros
  static const frenchComoros = Locale._(Language.french, Country.comoros, 'French Comoros');

  /// French Luxembourg
  static const frenchLuxembourg = Locale._(Language.french, Country.luxembourg, 'French Luxembourg');

  /// French Morocco
  static const frenchMorocco = Locale._(Language.french, Country.morocco, 'French Morocco');

  /// French Monaco
  static const frenchMonaco = Locale._(Language.french, Country.monaco, 'French Monaco');

  /// French The Collectivity of Saint Martin
  static const frenchTheCollectivityOfSaintMartin = Locale._(Language.french, Country.theCollectivityOfSaintMartin, 'French The Collectivity of Saint Martin');

  /// French Madagascar
  static const frenchMadagascar = Locale._(Language.french, Country.madagascar, 'French Madagascar');

  /// French Mali
  static const frenchMali = Locale._(Language.french, Country.mali, 'French Mali');

  /// French Martinique
  static const frenchMartinique = Locale._(Language.french, Country.martinique, 'French Martinique');

  /// French Mauritania
  static const frenchMauritania = Locale._(Language.french, Country.mauritania, 'French Mauritania');

  /// French Mauritius
  static const frenchMauritius = Locale._(Language.french, Country.mauritius, 'French Mauritius');

  /// French New Caledonia
  static const frenchNewCaledonia = Locale._(Language.french, Country.newCaledonia, 'French New Caledonia');

  /// French Niger
  static const frenchNiger = Locale._(Language.french, Country.niger, 'French Niger');

  /// French French Polynesia
  static const frenchFrenchPolynesia = Locale._(Language.french, Country.frenchPolynesia, 'French French Polynesia');

  /// French Saint Pierre and Miquelon
  static const frenchSaintPierreAndMiquelon = Locale._(Language.french, Country.saintPierreAndMiquelon, 'French Saint Pierre and Miquelon');

  /// French Réunion
  static const frenchReunion = Locale._(Language.french, Country.reunion, 'French Réunion');

  /// French Rwanda
  static const frenchRwanda = Locale._(Language.french, Country.rwanda, 'French Rwanda');

  /// French Seychelles
  static const frenchSeychelles = Locale._(Language.french, Country.seychelles, 'French Seychelles');

  /// French Senegal
  static const frenchSenegal = Locale._(Language.french, Country.senegal, 'French Senegal');

  /// French Syrian Arab Republic
  static const frenchSyrianArabRepublic = Locale._(Language.french, Country.syrianArabRepublic, 'French Syrian Arab Republic');

  /// French Chad
  static const frenchChad = Locale._(Language.french, Country.chad, 'French Chad');

  /// French Togo
  static const frenchTogo = Locale._(Language.french, Country.togo, 'French Togo');

  /// French Tunisia
  static const frenchTunisia = Locale._(Language.french, Country.tunisia, 'French Tunisia');

  /// French Vanuatu
  static const frenchVanuatu = Locale._(Language.french, Country.vanuatu, 'French Vanuatu');

  /// French Wallis and Futuna
  static const frenchWallisAndFutuna = Locale._(Language.french, Country.wallisAndFutuna, 'French Wallis and Futuna');

  /// French Mayotte
  static const frenchMayotte = Locale._(Language.french, Country.mayotte, 'French Mayotte');

  /// Friulian
  static const friulian = Locale._(Language.friulian, null, 'Friulian');

  /// Friulian Italy
  static const friulianItaly = Locale._(Language.friulian, Country.italy, 'Friulian Italy');

  /// Western Frisian
  static const westernFrisian = Locale._(Language.westernFrisian, null, 'Western Frisian');

  /// Western Frisian Netherlands
  static const westernFrisianNetherlands = Locale._(Language.westernFrisian, Country.netherlands, 'Western Frisian Netherlands');

  /// Irish
  static const irish = Locale._(Language.irish, null, 'Irish');

  /// Irish United Kingdom
  static const irishUnitedKingdom = Locale._(Language.irish, Country.unitedKingdom, 'Irish United Kingdom');

  /// Irish Ireland
  static const irishIreland = Locale._(Language.irish, Country.ireland, 'Irish Ireland');

  /// Gaelic; Scottish Gaelic
  static const gaelic = Locale._(Language.gaelic, null, 'Gaelic; Scottish Gaelic');

  /// Gaelic; Scottish Gaelic United Kingdom
  static const gaelicUnitedKingdom = Locale._(Language.gaelic, Country.unitedKingdom, 'Gaelic; Scottish Gaelic United Kingdom');

  /// Galician
  static const galician = Locale._(Language.galician, null, 'Galician');

  /// Galician Spain
  static const galicianSpain = Locale._(Language.galician, Country.spain, 'Galician Spain');

  /// Swiss German; Alemannic; Alsatian
  static const swissGerman = Locale._(Language.swissGerman, null, 'Swiss German; Alemannic; Alsatian');

  /// Swiss German; Alemannic; Alsatian Switzerland
  static const swissGermanSwitzerland = Locale._(Language.swissGerman, Country.switzerland, 'Swiss German; Alemannic; Alsatian Switzerland');

  /// Swiss German; Alemannic; Alsatian France
  static const swissGermanFrance = Locale._(Language.swissGerman, Country.france, 'Swiss German; Alemannic; Alsatian France');

  /// Swiss German; Alemannic; Alsatian Liechtenstein
  static const swissGermanLiechtenstein = Locale._(Language.swissGerman, Country.liechtenstein, 'Swiss German; Alemannic; Alsatian Liechtenstein');

  /// Gujarati
  static const gujarati = Locale._(Language.gujarati, null, 'Gujarati');

  /// Gujarati India
  static const gujaratiIndia = Locale._(Language.gujarati, Country.india, 'Gujarati India');

  /// guz
  static const guz = Locale._(null, null, 'guz');

  /// guz Kenya
  static const guzKenya = Locale._(null, Country.kenya, 'guz Kenya');

  /// Manx
  static const manx = Locale._(Language.manx, null, 'Manx');

  /// Manx Isle of Man
  static const manxIsleOfMan = Locale._(Language.manx, Country.isleOfMan, 'Manx Isle of Man');

  /// Hausa
  static const hausa = Locale._(Language.hausa, null, 'Hausa');

  /// Hausa Ghana
  static const hausaGhana = Locale._(Language.hausa, Country.ghana, 'Hausa Ghana');

  /// Hausa Niger
  static const hausaNiger = Locale._(Language.hausa, Country.niger, 'Hausa Niger');

  /// Hausa Nigeria
  static const hausaNigeria = Locale._(Language.hausa, Country.nigeria, 'Hausa Nigeria');

  /// Hawaiian
  static const hawaiian = Locale._(Language.hawaiian, null, 'Hawaiian');

  /// Hawaiian United States of America
  static const hawaiianUnitedStatesOfAmerica = Locale._(Language.hawaiian, Country.unitedStates, 'Hawaiian United States of America');

  /// Hebrew
  static const hebrew = Locale._(Language.hebrew, null, 'Hebrew');

  /// Hebrew Israel
  static const hebrewIsrael = Locale._(Language.hebrew, Country.israel, 'Hebrew Israel');

  /// Hindi
  static const hindi = Locale._(Language.hindi, null, 'Hindi');

  /// Hindi India
  static const hindiIndia = Locale._(Language.hindi, Country.india, 'Hindi India');

  /// Croatian
  static const croatian = Locale._(Language.croatian, null, 'Croatian');

  /// Croatian Bosnia and Herzegovina
  static const croatianBosniaAndHerzegovina = Locale._(Language.croatian, Country.bosniaAndHerzegovina, 'Croatian Bosnia and Herzegovina');

  /// Croatian Croatia
  static const croatianCroatia = Locale._(Language.croatian, Country.croatia, 'Croatian Croatia');

  /// Upper Sorbian
  static const upperSorbian = Locale._(Language.upperSorbian, null, 'Upper Sorbian');

  /// Upper Sorbian Germany
  static const upperSorbianGermany = Locale._(Language.upperSorbian, Country.germany, 'Upper Sorbian Germany');

  /// Hungarian
  static const hungarian = Locale._(Language.hungarian, null, 'Hungarian');

  /// Hungarian Hungary
  static const hungarianHungary = Locale._(Language.hungarian, Country.hungary, 'Hungarian Hungary');

  /// Armenian
  static const armenian = Locale._(Language.armenian, null, 'Armenian');

  /// Armenian Armenia
  static const armenianArmenia = Locale._(Language.armenian, Country.armenia, 'Armenian Armenia');

  /// Interlingua (International Auxiliary Language Association)
  static const interlinguaInternationalAuxiliaryLanguageAssociation = Locale._(Language.interlinguaInternationalAuxiliaryLanguageAssociation, null, 'Interlingua (International Auxiliary Language Association)');

  /// Indonesian
  static const indonesian = Locale._(Language.indonesian, null, 'Indonesian');

  /// Indonesian Indonesia
  static const indonesianIndonesia = Locale._(Language.indonesian, Country.indonesia, 'Indonesian Indonesia');

  /// Igbo
  static const igbo = Locale._(Language.igbo, null, 'Igbo');

  /// Igbo Nigeria
  static const igboNigeria = Locale._(Language.igbo, Country.nigeria, 'Igbo Nigeria');

  /// Sichuan Yi; Nuosu
  static const sichuanYi = Locale._(Language.sichuanYi, null, 'Sichuan Yi; Nuosu');

  /// Sichuan Yi; Nuosu China
  static const sichuanYiChina = Locale._(Language.sichuanYi, Country.china, 'Sichuan Yi; Nuosu China');

  /// Icelandic
  static const icelandic = Locale._(Language.icelandic, null, 'Icelandic');

  /// Icelandic Iceland
  static const icelandicIceland = Locale._(Language.icelandic, Country.iceland, 'Icelandic Iceland');

  /// Italian
  static const italian = Locale._(Language.italian, null, 'Italian');

  /// Italian Switzerland
  static const italianSwitzerland = Locale._(Language.italian, Country.switzerland, 'Italian Switzerland');

  /// Italian Italy
  static const italianItaly = Locale._(Language.italian, Country.italy, 'Italian Italy');

  /// Italian San Marino
  static const italianSanMarino = Locale._(Language.italian, Country.sanMarino, 'Italian San Marino');

  /// Italian Holy See
  static const italianHolySee = Locale._(Language.italian, Country.holySee, 'Italian Holy See');

  /// Japanese
  static const japanese = Locale._(Language.japanese, null, 'Japanese');

  /// Japanese Japan
  static const japaneseJapan = Locale._(Language.japanese, Country.japan, 'Japanese Japan');

  /// jgo
  static const jgo = Locale._(null, null, 'jgo');

  /// jgo Cameroon
  static const jgoCameroon = Locale._(null, Country.cameroon, 'jgo Cameroon');

  /// jmc
  static const jmc = Locale._(null, null, 'jmc');

  /// jmc United Republic of Tanzania
  static const jmcUnitedRepublicOfTanzania = Locale._(null, Country.unitedRepublicOfTanzania, 'jmc United Republic of Tanzania');

  /// Javanese
  static const javanese = Locale._(Language.javanese, null, 'Javanese');

  /// Javanese Indonesia
  static const javaneseIndonesia = Locale._(Language.javanese, Country.indonesia, 'Javanese Indonesia');

  /// Georgian
  static const georgian = Locale._(Language.georgian, null, 'Georgian');

  /// Georgian Georgia
  static const georgianGeorgia = Locale._(Language.georgian, Country.georgia, 'Georgian Georgia');

  /// Kabyle
  static const kabyle = Locale._(Language.kabyle, null, 'Kabyle');

  /// Kabyle Algeria
  static const kabyleAlgeria = Locale._(Language.kabyle, Country.algeria, 'Kabyle Algeria');

  /// Kamba
  static const kamba = Locale._(Language.kamba, null, 'Kamba');

  /// Kamba Kenya
  static const kambaKenya = Locale._(Language.kamba, Country.kenya, 'Kamba Kenya');

  /// kde
  static const kde = Locale._(null, null, 'kde');

  /// kde United Republic of Tanzania
  static const kdeUnitedRepublicOfTanzania = Locale._(null, Country.unitedRepublicOfTanzania, 'kde United Republic of Tanzania');

  /// kea
  static const kea = Locale._(null, null, 'kea');

  /// kea Cabo Verde
  static const keaCaboVerde = Locale._(null, Country.caboVerde, 'kea Cabo Verde');

  /// khq
  static const khq = Locale._(null, null, 'khq');

  /// khq Mali
  static const khqMali = Locale._(null, Country.mali, 'khq Mali');

  /// Kikuyu; Gikuyu
  static const kikuyu = Locale._(Language.kikuyu, null, 'Kikuyu; Gikuyu');

  /// Kikuyu; Gikuyu Kenya
  static const kikuyuKenya = Locale._(Language.kikuyu, Country.kenya, 'Kikuyu; Gikuyu Kenya');

  /// Kazakh
  static const kazakh = Locale._(Language.kazakh, null, 'Kazakh');

  /// Kazakh Kazakhstan
  static const kazakhKazakhstan = Locale._(Language.kazakh, Country.kazakhstan, 'Kazakh Kazakhstan');

  /// kkj
  static const kkj = Locale._(null, null, 'kkj');

  /// kkj Cameroon
  static const kkjCameroon = Locale._(null, Country.cameroon, 'kkj Cameroon');

  /// Kalaallisut; Greenlandic
  static const kalaallisut = Locale._(Language.kalaallisut, null, 'Kalaallisut; Greenlandic');

  /// Kalaallisut; Greenlandic Greenland
  static const kalaallisutGreenland = Locale._(Language.kalaallisut, Country.greenland, 'Kalaallisut; Greenlandic Greenland');

  /// kln
  static const kln = Locale._(null, null, 'kln');

  /// kln Kenya
  static const klnKenya = Locale._(null, Country.kenya, 'kln Kenya');

  /// Central Khmer
  static const centralKhmer = Locale._(Language.centralKhmer, null, 'Central Khmer');

  /// Central Khmer Cambodia
  static const centralKhmerCambodia = Locale._(Language.centralKhmer, Country.cambodia, 'Central Khmer Cambodia');

  /// Kannada
  static const kannada = Locale._(Language.kannada, null, 'Kannada');

  /// Kannada India
  static const kannadaIndia = Locale._(Language.kannada, Country.india, 'Kannada India');

  /// Korean
  static const korean = Locale._(Language.korean, null, 'Korean');

  /// Korean Democratic People's Republic of Korea (North Korea)
  static const koreanDemocraticPeoplesRepublicOfKoreaNorthKorea = Locale._(Language.korean, Country.democraticPeoplesRepublicOfKoreaNorthKorea, 'Korean Democratic People\'s Republic of Korea (North Korea)');

  /// Korean Republic of Korea (South Korea)
  static const koreanRepublicOfKoreaSouthKorea = Locale._(Language.korean, Country.republicOfKoreaSouthKorea, 'Korean Republic of Korea (South Korea)');

  /// Konkani
  static const konkani = Locale._(Language.konkani, null, 'Konkani');

  /// Konkani India
  static const konkaniIndia = Locale._(Language.konkani, Country.india, 'Konkani India');

  /// Kashmiri
  static const kashmiri = Locale._(Language.kashmiri, null, 'Kashmiri');

  /// Kashmiri India
  static const kashmiriIndia = Locale._(Language.kashmiri, Country.india, 'Kashmiri India');

  /// ksb
  static const ksb = Locale._(null, null, 'ksb');

  /// ksb United Republic of Tanzania
  static const ksbUnitedRepublicOfTanzania = Locale._(null, Country.unitedRepublicOfTanzania, 'ksb United Republic of Tanzania');

  /// ksf
  static const ksf = Locale._(null, null, 'ksf');

  /// ksf Cameroon
  static const ksfCameroon = Locale._(null, Country.cameroon, 'ksf Cameroon');

  /// ksh
  static const ksh = Locale._(null, null, 'ksh');

  /// ksh Germany
  static const kshGermany = Locale._(null, Country.germany, 'ksh Germany');

  /// Kurdish
  static const kurdish = Locale._(Language.kurdish, null, 'Kurdish');

  /// Kurdish Turkey
  static const kurdishTurkey = Locale._(Language.kurdish, Country.turkey, 'Kurdish Turkey');

  /// Cornish
  static const cornish = Locale._(Language.cornish, null, 'Cornish');

  /// Cornish United Kingdom
  static const cornishUnitedKingdom = Locale._(Language.cornish, Country.unitedKingdom, 'Cornish United Kingdom');

  /// Kirghiz; Kyrgyz
  static const kirghiz = Locale._(Language.kirghiz, null, 'Kirghiz; Kyrgyz');

  /// Kirghiz; Kyrgyz Kyrgyzstan
  static const kirghizKyrgyzstan = Locale._(Language.kirghiz, Country.kyrgyzstan, 'Kirghiz; Kyrgyz Kyrgyzstan');

  /// lag
  static const lag = Locale._(null, null, 'lag');

  /// lag United Republic of Tanzania
  static const lagUnitedRepublicOfTanzania = Locale._(null, Country.unitedRepublicOfTanzania, 'lag United Republic of Tanzania');

  /// Luxembourgish; Letzeburgesch
  static const luxembourgish = Locale._(Language.luxembourgish, null, 'Luxembourgish; Letzeburgesch');

  /// Luxembourgish; Letzeburgesch Luxembourg
  static const luxembourgishLuxembourg = Locale._(Language.luxembourgish, Country.luxembourg, 'Luxembourgish; Letzeburgesch Luxembourg');

  /// Ganda
  static const ganda = Locale._(Language.ganda, null, 'Ganda');

  /// Ganda Uganda
  static const gandaUganda = Locale._(Language.ganda, Country.uganda, 'Ganda Uganda');

  /// lkt
  static const lkt = Locale._(null, null, 'lkt');

  /// lkt United States of America
  static const lktUnitedStatesOfAmerica = Locale._(null, Country.unitedStates, 'lkt United States of America');

  /// Lingala
  static const lingala = Locale._(Language.lingala, null, 'Lingala');

  /// Lingala Angola
  static const lingalaAngola = Locale._(Language.lingala, Country.angola, 'Lingala Angola');

  /// Lingala Democratic Republic of the Congo
  static const lingalaDemocraticRepublicOfTheCongo = Locale._(Language.lingala, Country.democraticRepublicOfTheCongo, 'Lingala Democratic Republic of the Congo');

  /// Lingala Central African Republic
  static const lingalaCentralAfricanRepublic = Locale._(Language.lingala, Country.centralAfricanRepublic, 'Lingala Central African Republic');

  /// Lingala Congo
  static const lingalaCongo = Locale._(Language.lingala, Country.congo, 'Lingala Congo');

  /// Lao
  static const lao = Locale._(Language.lao, null, 'Lao');

  /// Lao Lao People's Democratic Republic
  static const laoLaoPeoplesDemocraticRepublic = Locale._(Language.lao, Country.laoPeoplesDemocraticRepublic, 'Lao Lao People\'s Democratic Republic');

  /// lrc
  static const lrc = Locale._(null, null, 'lrc');

  /// lrc Iraq
  static const lrcIraq = Locale._(null, Country.iraq, 'lrc Iraq');

  /// lrc Iran
  static const lrcIran = Locale._(null, Country.iran, 'lrc Iran');

  /// Lithuanian
  static const lithuanian = Locale._(Language.lithuanian, null, 'Lithuanian');

  /// Lithuanian Lithuania
  static const lithuanianLithuania = Locale._(Language.lithuanian, Country.lithuania, 'Lithuanian Lithuania');

  /// Luba-Katanga
  static const lubaKatanga = Locale._(Language.lubaKatanga, null, 'Luba-Katanga');

  /// Luba-Katanga Democratic Republic of the Congo
  static const lubaKatangaDemocraticRepublicOfTheCongo = Locale._(Language.lubaKatanga, Country.democraticRepublicOfTheCongo, 'Luba-Katanga Democratic Republic of the Congo');

  /// Luo (Kenya and Tanzania)
  static const luoKenyaAndTanzania = Locale._(Language.luoKenyaAndTanzania, null, 'Luo (Kenya and Tanzania)');

  /// Luo (Kenya and Tanzania) Kenya
  static const luoKenyaAndTanzaniaKenya = Locale._(Language.luoKenyaAndTanzania, Country.kenya, 'Luo (Kenya and Tanzania) Kenya');

  /// luy
  static const luy = Locale._(null, null, 'luy');

  /// luy Kenya
  static const luyKenya = Locale._(null, Country.kenya, 'luy Kenya');

  /// Latvian
  static const latvian = Locale._(Language.latvian, null, 'Latvian');

  /// Latvian Latvia
  static const latvianLatvia = Locale._(Language.latvian, Country.latvia, 'Latvian Latvia');

  /// Masai
  static const masai = Locale._(Language.masai, null, 'Masai');

  /// Masai Kenya
  static const masaiKenya = Locale._(Language.masai, Country.kenya, 'Masai Kenya');

  /// Masai United Republic of Tanzania
  static const masaiUnitedRepublicOfTanzania = Locale._(Language.masai, Country.unitedRepublicOfTanzania, 'Masai United Republic of Tanzania');

  /// mer
  static const mer = Locale._(null, null, 'mer');

  /// mer Kenya
  static const merKenya = Locale._(null, Country.kenya, 'mer Kenya');

  /// mfe
  static const mfe = Locale._(null, null, 'mfe');

  /// mfe Mauritius
  static const mfeMauritius = Locale._(null, Country.mauritius, 'mfe Mauritius');

  /// Malagasy
  static const malagasy = Locale._(Language.malagasy, null, 'Malagasy');

  /// Malagasy Madagascar
  static const malagasyMadagascar = Locale._(Language.malagasy, Country.madagascar, 'Malagasy Madagascar');

  /// mgh
  static const mgh = Locale._(null, null, 'mgh');

  /// mgh Mozambique
  static const mghMozambique = Locale._(null, Country.mozambique, 'mgh Mozambique');

  /// mgo
  static const mgo = Locale._(null, null, 'mgo');

  /// mgo Cameroon
  static const mgoCameroon = Locale._(null, Country.cameroon, 'mgo Cameroon');

  /// Maori
  static const maori = Locale._(Language.maori, null, 'Maori');

  /// Maori New Zealand
  static const maoriNewZealand = Locale._(Language.maori, Country.newZealand, 'Maori New Zealand');

  /// Macedonian
  static const macedonian = Locale._(Language.macedonian, null, 'Macedonian');

  /// Macedonian North Macedonia
  static const macedonianNorthMacedonia = Locale._(Language.macedonian, Country.northMacedonia, 'Macedonian North Macedonia');

  /// Malayalam
  static const malayalam = Locale._(Language.malayalam, null, 'Malayalam');

  /// Malayalam India
  static const malayalamIndia = Locale._(Language.malayalam, Country.india, 'Malayalam India');

  /// Mongolian
  static const mongolian = Locale._(Language.mongolian, null, 'Mongolian');

  /// Mongolian Mongolia
  static const mongolianMongolia = Locale._(Language.mongolian, Country.mongolia, 'Mongolian Mongolia');

  /// Marathi
  static const marathi = Locale._(Language.marathi, null, 'Marathi');

  /// Marathi India
  static const marathiIndia = Locale._(Language.marathi, Country.india, 'Marathi India');

  /// Malay
  static const malay = Locale._(Language.malay, null, 'Malay');

  /// Malay Brunei Darussalam
  static const malayBruneiDarussalam = Locale._(Language.malay, Country.bruneiDarussalam, 'Malay Brunei Darussalam');

  /// Malay Malaysia
  static const malayMalaysia = Locale._(Language.malay, Country.malaysia, 'Malay Malaysia');

  /// Malay Singapore
  static const malaySingapore = Locale._(Language.malay, Country.singapore, 'Malay Singapore');

  /// Maltese
  static const maltese = Locale._(Language.maltese, null, 'Maltese');

  /// Maltese Malta
  static const malteseMalta = Locale._(Language.maltese, Country.malta, 'Maltese Malta');

  /// mua
  static const mua = Locale._(null, null, 'mua');

  /// mua Cameroon
  static const muaCameroon = Locale._(null, Country.cameroon, 'mua Cameroon');

  /// Burmese
  static const burmese = Locale._(Language.burmese, null, 'Burmese');

  /// Burmese Myanmar
  static const burmeseMyanmar = Locale._(Language.burmese, Country.myanmar, 'Burmese Myanmar');

  /// mzn
  static const mzn = Locale._(null, null, 'mzn');

  /// mzn Iran
  static const mznIran = Locale._(null, Country.iran, 'mzn Iran');

  /// naq
  static const naq = Locale._(null, null, 'naq');

  /// naq Namibia
  static const naqNamibia = Locale._(null, Country.namibia, 'naq Namibia');

  /// Bokmål, Norwegian; Norwegian Bokmål
  static const bokmalNorwegian = Locale._(Language.bokmalNorwegian, null, 'Bokmål, Norwegian; Norwegian Bokmål');

  /// Bokmål, Norwegian; Norwegian Bokmål Norway
  static const bokmalNorwegianNorway = Locale._(Language.bokmalNorwegian, Country.norway, 'Bokmål, Norwegian; Norwegian Bokmål Norway');

  /// Bokmål, Norwegian; Norwegian Bokmål Svalbard and Jan Mayen
  static const bokmalNorwegianSvalbardAndJanMayen = Locale._(Language.bokmalNorwegian, Country.svalbardAndJanMayen, 'Bokmål, Norwegian; Norwegian Bokmål Svalbard and Jan Mayen');

  /// Ndebele, North; North Ndebele
  static const ndebeleNorth = Locale._(Language.ndebeleNorth, null, 'Ndebele, North; North Ndebele');

  /// Ndebele, North; North Ndebele Zimbabwe
  static const ndebeleNorthZimbabwe = Locale._(Language.ndebeleNorth, Country.zimbabwe, 'Ndebele, North; North Ndebele Zimbabwe');

  /// Low German; Low Saxon; German, Low; Saxon, Low
  static const lowGerman = Locale._(Language.lowGerman, null, 'Low German; Low Saxon; German, Low; Saxon, Low');

  /// Low German; Low Saxon; German, Low; Saxon, Low Germany
  static const lowGermanGermany = Locale._(Language.lowGerman, Country.germany, 'Low German; Low Saxon; German, Low; Saxon, Low Germany');

  /// Low German; Low Saxon; German, Low; Saxon, Low Netherlands
  static const lowGermanNetherlands = Locale._(Language.lowGerman, Country.netherlands, 'Low German; Low Saxon; German, Low; Saxon, Low Netherlands');

  /// Nepali
  static const nepali = Locale._(Language.nepali, null, 'Nepali');

  /// Nepali India
  static const nepaliIndia = Locale._(Language.nepali, Country.india, 'Nepali India');

  /// Nepali Nepal
  static const nepaliNepal = Locale._(Language.nepali, Country.nepal, 'Nepali Nepal');

  /// Dutch; Flemish
  static const dutch = Locale._(Language.dutch, null, 'Dutch; Flemish');

  /// Dutch; Flemish Aruba
  static const dutchAruba = Locale._(Language.dutch, Country.aruba, 'Dutch; Flemish Aruba');

  /// Dutch; Flemish Belgium
  static const dutchBelgium = Locale._(Language.dutch, Country.belgium, 'Dutch; Flemish Belgium');

  /// Dutch; Flemish Bonaire, Sint Eustatius and Saba
  static const dutchBonaireSintEustatiusAndSaba = Locale._(Language.dutch, Country.bonaireSintEustatiusAndSaba, 'Dutch; Flemish Bonaire, Sint Eustatius and Saba');

  /// Dutch; Flemish Curaçao
  static const dutchCuracao = Locale._(Language.dutch, Country.curacao, 'Dutch; Flemish Curaçao');

  /// Dutch; Flemish Netherlands
  static const dutchNetherlands = Locale._(Language.dutch, Country.netherlands, 'Dutch; Flemish Netherlands');

  /// Dutch; Flemish Suriname
  static const dutchSuriname = Locale._(Language.dutch, Country.suriname, 'Dutch; Flemish Suriname');

  /// Dutch; Flemish Sint Maarten
  static const dutchSintMaarten = Locale._(Language.dutch, Country.sintMaarten, 'Dutch; Flemish Sint Maarten');

  /// nmg
  static const nmg = Locale._(null, null, 'nmg');

  /// nmg Cameroon
  static const nmgCameroon = Locale._(null, Country.cameroon, 'nmg Cameroon');

  /// Norwegian Nynorsk; Nynorsk, Norwegian
  static const norwegianNynorsk = Locale._(Language.norwegianNynorsk, null, 'Norwegian Nynorsk; Nynorsk, Norwegian');

  /// Norwegian Nynorsk; Nynorsk, Norwegian Norway
  static const norwegianNynorskNorway = Locale._(Language.norwegianNynorsk, Country.norway, 'Norwegian Nynorsk; Nynorsk, Norwegian Norway');

  /// nnh
  static const nnh = Locale._(null, null, 'nnh');

  /// nnh Cameroon
  static const nnhCameroon = Locale._(null, Country.cameroon, 'nnh Cameroon');

  /// nus
  static const nus = Locale._(null, null, 'nus');

  /// nus South Sudan
  static const nusSouthSudan = Locale._(null, Country.southSudan, 'nus South Sudan');

  /// Nyankole
  static const nyankole = Locale._(Language.nyankole, null, 'Nyankole');

  /// Nyankole Uganda
  static const nyankoleUganda = Locale._(Language.nyankole, Country.uganda, 'Nyankole Uganda');

  /// Oromo
  static const oromo = Locale._(Language.oromo, null, 'Oromo');

  /// Oromo Ethiopia
  static const oromoEthiopia = Locale._(Language.oromo, Country.ethiopia, 'Oromo Ethiopia');

  /// Oromo Kenya
  static const oromoKenya = Locale._(Language.oromo, Country.kenya, 'Oromo Kenya');

  /// Oriya
  static const oriya = Locale._(Language.oriya, null, 'Oriya');

  /// Oriya India
  static const oriyaIndia = Locale._(Language.oriya, Country.india, 'Oriya India');

  /// Ossetian; Ossetic
  static const ossetian = Locale._(Language.ossetian, null, 'Ossetian; Ossetic');

  /// Ossetian; Ossetic Georgia
  static const ossetianGeorgia = Locale._(Language.ossetian, Country.georgia, 'Ossetian; Ossetic Georgia');

  /// Ossetian; Ossetic Russian Federation
  static const ossetianRussianFederation = Locale._(Language.ossetian, Country.russianFederation, 'Ossetian; Ossetic Russian Federation');

  /// Panjabi; Punjabi
  static const panjabi = Locale._(Language.panjabi, null, 'Panjabi; Punjabi');

  /// Polish
  static const polish = Locale._(Language.polish, null, 'Polish');

  /// Polish Poland
  static const polishPoland = Locale._(Language.polish, Country.poland, 'Polish Poland');

  /// prg
  static const prg = Locale._(null, null, 'prg');

  /// Pushto; Pashto
  static const pushto = Locale._(Language.pushto, null, 'Pushto; Pashto');

  /// Pushto; Pashto Afghanistan
  static const pushtoAfghanistan = Locale._(Language.pushto, Country.afghanistan, 'Pushto; Pashto Afghanistan');

  /// Pushto; Pashto Pakistan
  static const pushtoPakistan = Locale._(Language.pushto, Country.pakistan, 'Pushto; Pashto Pakistan');

  /// Portuguese
  static const portuguese = Locale._(Language.portuguese, null, 'Portuguese');

  /// Portuguese Angola
  static const portugueseAngola = Locale._(Language.portuguese, Country.angola, 'Portuguese Angola');

  /// Portuguese Brazil
  static const portugueseBrazil = Locale._(Language.portuguese, Country.brazil, 'Portuguese Brazil');

  /// Portuguese Switzerland
  static const portugueseSwitzerland = Locale._(Language.portuguese, Country.switzerland, 'Portuguese Switzerland');

  /// Portuguese Cabo Verde
  static const portugueseCaboVerde = Locale._(Language.portuguese, Country.caboVerde, 'Portuguese Cabo Verde');

  /// Portuguese Equatorial Guinea
  static const portugueseEquatorialGuinea = Locale._(Language.portuguese, Country.equatorialGuinea, 'Portuguese Equatorial Guinea');

  /// Portuguese Guinea-Bissau
  static const portugueseGuineaBissau = Locale._(Language.portuguese, Country.guineaBissau, 'Portuguese Guinea-Bissau');

  /// Portuguese Luxembourg
  static const portugueseLuxembourg = Locale._(Language.portuguese, Country.luxembourg, 'Portuguese Luxembourg');

  /// Portuguese Macao
  static const portugueseMacao = Locale._(Language.portuguese, Country.macao, 'Portuguese Macao');

  /// Portuguese Mozambique
  static const portugueseMozambique = Locale._(Language.portuguese, Country.mozambique, 'Portuguese Mozambique');

  /// Portuguese Portugal
  static const portuguesePortugal = Locale._(Language.portuguese, Country.portugal, 'Portuguese Portugal');

  /// Portuguese Sao Tome and Principe
  static const portugueseSaoTomeAndPrincipe = Locale._(Language.portuguese, Country.saoTomeAndPrincipe, 'Portuguese Sao Tome and Principe');

  /// Portuguese Timor-Leste
  static const portugueseTimorLeste = Locale._(Language.portuguese, Country.timorLeste, 'Portuguese Timor-Leste');

  /// Quechua
  static const quechua = Locale._(Language.quechua, null, 'Quechua');

  /// Quechua Plurinational State of Bolivia
  static const quechuaPlurinationalStateOfBolivia = Locale._(Language.quechua, Country.plurinationalStateOfBolivia, 'Quechua Plurinational State of Bolivia');

  /// Quechua Ecuador
  static const quechuaEcuador = Locale._(Language.quechua, Country.ecuador, 'Quechua Ecuador');

  /// Quechua Peru
  static const quechuaPeru = Locale._(Language.quechua, Country.peru, 'Quechua Peru');

  /// Romansh
  static const romansh = Locale._(Language.romansh, null, 'Romansh');

  /// Romansh Switzerland
  static const romanshSwitzerland = Locale._(Language.romansh, Country.switzerland, 'Romansh Switzerland');

  /// Rundi
  static const rundi = Locale._(Language.rundi, null, 'Rundi');

  /// Rundi Burundi
  static const rundiBurundi = Locale._(Language.rundi, Country.burundi, 'Rundi Burundi');

  /// Romanian; Moldavian; Moldovan
  static const romanian = Locale._(Language.romanian, null, 'Romanian; Moldavian; Moldovan');

  /// Romanian; Moldavian; Moldovan Republic of Moldova
  static const romanianRepublicOfMoldova = Locale._(Language.romanian, Country.republicOfMoldova, 'Romanian; Moldavian; Moldovan Republic of Moldova');

  /// Romanian; Moldavian; Moldovan Romania
  static const romanianRomania = Locale._(Language.romanian, Country.romania, 'Romanian; Moldavian; Moldovan Romania');

  /// rof
  static const rof = Locale._(null, null, 'rof');

  /// rof United Republic of Tanzania
  static const rofUnitedRepublicOfTanzania = Locale._(null, Country.unitedRepublicOfTanzania, 'rof United Republic of Tanzania');

  /// root
  static const root = Locale._(null, null, 'root');

  /// Russian
  static const russian = Locale._(Language.russian, null, 'Russian');

  /// Russian Belarus
  static const russianBelarus = Locale._(Language.russian, Country.belarus, 'Russian Belarus');

  /// Russian Kyrgyzstan
  static const russianKyrgyzstan = Locale._(Language.russian, Country.kyrgyzstan, 'Russian Kyrgyzstan');

  /// Russian Kazakhstan
  static const russianKazakhstan = Locale._(Language.russian, Country.kazakhstan, 'Russian Kazakhstan');

  /// Russian Republic of Moldova
  static const russianRepublicOfMoldova = Locale._(Language.russian, Country.republicOfMoldova, 'Russian Republic of Moldova');

  /// Russian Russian Federation
  static const russianRussianFederation = Locale._(Language.russian, Country.russianFederation, 'Russian Russian Federation');

  /// Russian Ukraine
  static const russianUkraine = Locale._(Language.russian, Country.ukraine, 'Russian Ukraine');

  /// Kinyarwanda
  static const kinyarwanda = Locale._(Language.kinyarwanda, null, 'Kinyarwanda');

  /// Kinyarwanda Rwanda
  static const kinyarwandaRwanda = Locale._(Language.kinyarwanda, Country.rwanda, 'Kinyarwanda Rwanda');

  /// rwk
  static const rwk = Locale._(null, null, 'rwk');

  /// rwk United Republic of Tanzania
  static const rwkUnitedRepublicOfTanzania = Locale._(null, Country.unitedRepublicOfTanzania, 'rwk United Republic of Tanzania');

  /// Yakut
  static const yakut = Locale._(Language.yakut, null, 'Yakut');

  /// Yakut Russian Federation
  static const yakutRussianFederation = Locale._(Language.yakut, Country.russianFederation, 'Yakut Russian Federation');

  /// saq
  static const saq = Locale._(null, null, 'saq');

  /// saq Kenya
  static const saqKenya = Locale._(null, Country.kenya, 'saq Kenya');

  /// sbp
  static const sbp = Locale._(null, null, 'sbp');

  /// sbp United Republic of Tanzania
  static const sbpUnitedRepublicOfTanzania = Locale._(null, Country.unitedRepublicOfTanzania, 'sbp United Republic of Tanzania');

  /// Sindhi
  static const sindhi = Locale._(Language.sindhi, null, 'Sindhi');

  /// Sindhi Pakistan
  static const sindhiPakistan = Locale._(Language.sindhi, Country.pakistan, 'Sindhi Pakistan');

  /// Northern Sami
  static const northernSami = Locale._(Language.northernSami, null, 'Northern Sami');

  /// Northern Sami Finland
  static const northernSamiFinland = Locale._(Language.northernSami, Country.finland, 'Northern Sami Finland');

  /// Northern Sami Norway
  static const northernSamiNorway = Locale._(Language.northernSami, Country.norway, 'Northern Sami Norway');

  /// Northern Sami Sweden
  static const northernSamiSweden = Locale._(Language.northernSami, Country.sweden, 'Northern Sami Sweden');

  /// seh
  static const seh = Locale._(null, null, 'seh');

  /// seh Mozambique
  static const sehMozambique = Locale._(null, Country.mozambique, 'seh Mozambique');

  /// ses
  static const ses = Locale._(null, null, 'ses');

  /// ses Mali
  static const sesMali = Locale._(null, Country.mali, 'ses Mali');

  /// Sango
  static const sango = Locale._(Language.sango, null, 'Sango');

  /// Sango Central African Republic
  static const sangoCentralAfricanRepublic = Locale._(Language.sango, Country.centralAfricanRepublic, 'Sango Central African Republic');

  /// shi
  static const shi = Locale._(null, null, 'shi');

  /// Sinhala; Sinhalese
  static const sinhala = Locale._(Language.sinhala, null, 'Sinhala; Sinhalese');

  /// Sinhala; Sinhalese Sri Lanka
  static const sinhalaSriLanka = Locale._(Language.sinhala, Country.sriLanka, 'Sinhala; Sinhalese Sri Lanka');

  /// Slovak
  static const slovak = Locale._(Language.slovak, null, 'Slovak');

  /// Slovak Slovakia
  static const slovakSlovakia = Locale._(Language.slovak, Country.slovakia, 'Slovak Slovakia');

  /// Slovenian
  static const slovenian = Locale._(Language.slovenian, null, 'Slovenian');

  /// Slovenian Slovenia
  static const slovenianSlovenia = Locale._(Language.slovenian, Country.slovenia, 'Slovenian Slovenia');

  /// Inari Sami
  static const inariSami = Locale._(Language.inariSami, null, 'Inari Sami');

  /// Inari Sami Finland
  static const inariSamiFinland = Locale._(Language.inariSami, Country.finland, 'Inari Sami Finland');

  /// Shona
  static const shona = Locale._(Language.shona, null, 'Shona');

  /// Shona Zimbabwe
  static const shonaZimbabwe = Locale._(Language.shona, Country.zimbabwe, 'Shona Zimbabwe');

  /// Somali
  static const somali = Locale._(Language.somali, null, 'Somali');

  /// Somali Djibouti
  static const somaliDjibouti = Locale._(Language.somali, Country.djibouti, 'Somali Djibouti');

  /// Somali Ethiopia
  static const somaliEthiopia = Locale._(Language.somali, Country.ethiopia, 'Somali Ethiopia');

  /// Somali Kenya
  static const somaliKenya = Locale._(Language.somali, Country.kenya, 'Somali Kenya');

  /// Somali Somalia
  static const somaliSomalia = Locale._(Language.somali, Country.somalia, 'Somali Somalia');

  /// Albanian
  static const albanian = Locale._(Language.albanian, null, 'Albanian');

  /// Albanian Albania
  static const albanianAlbania = Locale._(Language.albanian, Country.albania, 'Albanian Albania');

  /// Albanian North Macedonia
  static const albanianNorthMacedonia = Locale._(Language.albanian, Country.northMacedonia, 'Albanian North Macedonia');

  /// AlbanianXK
  static const albanianXK = Locale._(Language.albanian, null, 'AlbanianXK');

  /// Serbian
  static const serbian = Locale._(Language.serbian, null, 'Serbian');

  /// Swedish
  static const swedish = Locale._(Language.swedish, null, 'Swedish');

  /// Swedish Åland Islands
  static const swedishAlandIslands = Locale._(Language.swedish, Country.alandIslands, 'Swedish Åland Islands');

  /// Swedish Finland
  static const swedishFinland = Locale._(Language.swedish, Country.finland, 'Swedish Finland');

  /// Swedish Sweden
  static const swedishSweden = Locale._(Language.swedish, Country.sweden, 'Swedish Sweden');

  /// Swahili
  static const swahili = Locale._(Language.swahili, null, 'Swahili');

  /// Swahili Democratic Republic of the Congo
  static const swahiliDemocraticRepublicOfTheCongo = Locale._(Language.swahili, Country.democraticRepublicOfTheCongo, 'Swahili Democratic Republic of the Congo');

  /// Swahili Kenya
  static const swahiliKenya = Locale._(Language.swahili, Country.kenya, 'Swahili Kenya');

  /// Swahili United Republic of Tanzania
  static const swahiliUnitedRepublicOfTanzania = Locale._(Language.swahili, Country.unitedRepublicOfTanzania, 'Swahili United Republic of Tanzania');

  /// Swahili Uganda
  static const swahiliUganda = Locale._(Language.swahili, Country.uganda, 'Swahili Uganda');

  /// Tamil
  static const tamil = Locale._(Language.tamil, null, 'Tamil');

  /// Tamil India
  static const tamilIndia = Locale._(Language.tamil, Country.india, 'Tamil India');

  /// Tamil Sri Lanka
  static const tamilSriLanka = Locale._(Language.tamil, Country.sriLanka, 'Tamil Sri Lanka');

  /// Tamil Malaysia
  static const tamilMalaysia = Locale._(Language.tamil, Country.malaysia, 'Tamil Malaysia');

  /// Tamil Singapore
  static const tamilSingapore = Locale._(Language.tamil, Country.singapore, 'Tamil Singapore');

  /// Telugu
  static const telugu = Locale._(Language.telugu, null, 'Telugu');

  /// Telugu India
  static const teluguIndia = Locale._(Language.telugu, Country.india, 'Telugu India');

  /// teo
  static const teo = Locale._(null, null, 'teo');

  /// teo Kenya
  static const teoKenya = Locale._(null, Country.kenya, 'teo Kenya');

  /// teo Uganda
  static const teoUganda = Locale._(null, Country.uganda, 'teo Uganda');

  /// Tajik
  static const tajik = Locale._(Language.tajik, null, 'Tajik');

  /// Tajik Tajikistan
  static const tajikTajikistan = Locale._(Language.tajik, Country.tajikistan, 'Tajik Tajikistan');

  /// Thai
  static const thai = Locale._(Language.thai, null, 'Thai');

  /// Thai Thailand
  static const thaiThailand = Locale._(Language.thai, Country.thailand, 'Thai Thailand');

  /// Tigrinya
  static const tigrinya = Locale._(Language.tigrinya, null, 'Tigrinya');

  /// Tigrinya Eritrea
  static const tigrinyaEritrea = Locale._(Language.tigrinya, Country.eritrea, 'Tigrinya Eritrea');

  /// Tigrinya Ethiopia
  static const tigrinyaEthiopia = Locale._(Language.tigrinya, Country.ethiopia, 'Tigrinya Ethiopia');

  /// Turkmen
  static const turkmen = Locale._(Language.turkmen, null, 'Turkmen');

  /// Turkmen Turkmenistan
  static const turkmenTurkmenistan = Locale._(Language.turkmen, Country.turkmenistan, 'Turkmen Turkmenistan');

  /// Tonga (Tonga Islands)
  static const tongaTongaIslands = Locale._(Language.tongaTongaIslands, null, 'Tonga (Tonga Islands)');

  /// Tonga (Tonga Islands) Tonga
  static const tongaTongaIslandsTonga = Locale._(Language.tongaTongaIslands, Country.tonga, 'Tonga (Tonga Islands) Tonga');

  /// Turkish
  static const turkish = Locale._(Language.turkish, null, 'Turkish');

  /// Turkish Cyprus
  static const turkishCyprus = Locale._(Language.turkish, Country.cyprus, 'Turkish Cyprus');

  /// Turkish Turkey
  static const turkishTurkey = Locale._(Language.turkish, Country.turkey, 'Turkish Turkey');

  /// Tatar
  static const tatar = Locale._(Language.tatar, null, 'Tatar');

  /// Tatar Russian Federation
  static const tatarRussianFederation = Locale._(Language.tatar, Country.russianFederation, 'Tatar Russian Federation');

  /// twq
  static const twq = Locale._(null, null, 'twq');

  /// twq Niger
  static const twqNiger = Locale._(null, Country.niger, 'twq Niger');

  /// tzm
  static const tzm = Locale._(null, null, 'tzm');

  /// tzm Morocco
  static const tzmMorocco = Locale._(null, Country.morocco, 'tzm Morocco');

  /// Uighur; Uyghur
  static const uighur = Locale._(Language.uighur, null, 'Uighur; Uyghur');

  /// Uighur; Uyghur China
  static const uighurChina = Locale._(Language.uighur, Country.china, 'Uighur; Uyghur China');

  /// Ukrainian
  static const ukrainian = Locale._(Language.ukrainian, null, 'Ukrainian');

  /// Ukrainian Ukraine
  static const ukrainianUkraine = Locale._(Language.ukrainian, Country.ukraine, 'Ukrainian Ukraine');

  /// Urdu
  static const urdu = Locale._(Language.urdu, null, 'Urdu');

  /// Urdu India
  static const urduIndia = Locale._(Language.urdu, Country.india, 'Urdu India');

  /// Urdu Pakistan
  static const urduPakistan = Locale._(Language.urdu, Country.pakistan, 'Urdu Pakistan');

  /// Uzbek
  static const uzbek = Locale._(Language.uzbek, null, 'Uzbek');

  /// Vai
  static const vai = Locale._(Language.vai, null, 'Vai');

  /// Vietnamese
  static const vietnamese = Locale._(Language.vietnamese, null, 'Vietnamese');

  /// Vietnamese Vietnam
  static const vietnameseVietnam = Locale._(Language.vietnamese, Country.vietnam, 'Vietnamese Vietnam');

  /// Volapük
  static const volapuk = Locale._(Language.volapuk, null, 'Volapük');

  /// vun
  static const vun = Locale._(null, null, 'vun');

  /// vun United Republic of Tanzania
  static const vunUnitedRepublicOfTanzania = Locale._(null, Country.unitedRepublicOfTanzania, 'vun United Republic of Tanzania');

  /// wae
  static const wae = Locale._(null, null, 'wae');

  /// wae Switzerland
  static const waeSwitzerland = Locale._(null, Country.switzerland, 'wae Switzerland');

  /// Wolof
  static const wolof = Locale._(Language.wolof, null, 'Wolof');

  /// Wolof Senegal
  static const wolofSenegal = Locale._(Language.wolof, Country.senegal, 'Wolof Senegal');

  /// Xhosa
  static const xhosa = Locale._(Language.xhosa, null, 'Xhosa');

  /// Xhosa South Africa
  static const xhosaSouthAfrica = Locale._(Language.xhosa, Country.southAfrica, 'Xhosa South Africa');

  /// xog
  static const xog = Locale._(null, null, 'xog');

  /// xog Uganda
  static const xogUganda = Locale._(null, Country.uganda, 'xog Uganda');

  /// yav
  static const yav = Locale._(null, null, 'yav');

  /// yav Cameroon
  static const yavCameroon = Locale._(null, Country.cameroon, 'yav Cameroon');

  /// Yiddish
  static const yiddish = Locale._(Language.yiddish, null, 'Yiddish');

  /// Yoruba
  static const yoruba = Locale._(Language.yoruba, null, 'Yoruba');

  /// Yoruba Benin
  static const yorubaBenin = Locale._(Language.yoruba, Country.benin, 'Yoruba Benin');

  /// Yoruba Nigeria
  static const yorubaNigeria = Locale._(Language.yoruba, Country.nigeria, 'Yoruba Nigeria');

  /// yue
  static const yue = Locale._(null, null, 'yue');

  /// Standard Moroccan Tamazight
  static const standardMoroccanTamazight = Locale._(Language.standardMoroccanTamazight, null, 'Standard Moroccan Tamazight');

  /// Standard Moroccan Tamazight Morocco
  static const standardMoroccanTamazightMorocco = Locale._(Language.standardMoroccanTamazight, Country.morocco, 'Standard Moroccan Tamazight Morocco');

  /// Chinese
  static const chinese = Locale._(Language.chinese, null, 'Chinese');

  /// Zulu
  static const zulu = Locale._(Language.zulu, null, 'Zulu');

  /// Zulu South Africa
  static const zuluSouthAfrica = Locale._(Language.zulu, Country.southAfrica, 'Zulu South Africa');

  /// Locales supported by Flex
  static const all = {
    afrikaans,
    afrikaansNamibia,
    afrikaansSouthAfrica,
    agq,
    agqCameroon,
    akan,
    akanGhana,
    amharic,
    amharicEthiopia,
    arabic,
    arabicUnitedArabEmirates,
    arabicBahrain,
    arabicDjibouti,
    arabicAlgeria,
    arabicEgypt,
    arabicWesternSahara,
    arabicEritrea,
    arabicIsrael,
    arabicIraq,
    arabicJordan,
    arabicComoros,
    arabicKuwait,
    arabicLebanon,
    arabicLibya,
    arabicMorocco,
    arabicMauritania,
    arabicOman,
    arabicStateOfPalestine,
    arabicQatar,
    arabicSaudiArabia,
    arabicSudan,
    arabicSomalia,
    arabicSouthSudan,
    arabicSyrianArabRepublic,
    arabicChad,
    arabicTunisia,
    arabicYemen,
    assamese,
    assameseIndia,
    asa,
    asaUnitedRepublicOfTanzania,
    asturian,
    asturianSpain,
    azerbaijani,
    basa,
    basaCameroon,
    belarusian,
    belarusianBelarus,
    bemba,
    bembaZambia,
    bez,
    bezUnitedRepublicOfTanzania,
    bulgarian,
    bulgarianBulgaria,
    bambara,
    bambaraMali,
    bengali,
    bengaliBangladesh,
    bengaliIndia,
    tibetan,
    tibetanChina,
    tibetanIndia,
    breton,
    bretonFrance,
    brx,
    brxIndia,
    bosnian,
    catalan,
    catalanAndorra,
    catalanSpain,
    catalanFrance,
    catalanItaly,
    ccp,
    ccpBangladesh,
    ccpIndia,
    chechen,
    chechenRussianFederation,
    cebuano,
    cebuanoPhilippines,
    cgg,
    cggUganda,
    cherokee,
    cherokeeUnitedStatesOfAmerica,
    ckb,
    ckbIraq,
    ckbIran,
    czech,
    czechCzechia,
    oldSlavonic,
    oldSlavonicRussianFederation,
    welsh,
    welshUnitedKingdom,
    danish,
    danishDenmark,
    danishGreenland,
    dav,
    davKenya,
    german,
    germanAustria,
    germanBelgium,
    germanSwitzerland,
    germanGermany,
    germanItaly,
    germanLiechtenstein,
    germanLuxembourg,
    dje,
    djeNiger,
    lowerSorbian,
    lowerSorbianGermany,
    duala,
    dualaCameroon,
    dyo,
    dyoSenegal,
    dzongkha,
    dzongkhaBhutan,
    ebu,
    ebuKenya,
    ewe,
    eweGhana,
    eweTogo,
    greekModern1453,
    greekModern1453Cyprus,
    greekModern1453Greece,
    english,
    englishUnitedArabEmirates,
    englishAntiguaAndBarbuda,
    englishAnguilla,
    englishAmericanSamoa,
    englishAustria,
    englishAustralia,
    englishBarbados,
    englishBelgium,
    englishBurundi,
    englishBermuda,
    englishBahamas,
    englishBotswana,
    englishBelize,
    englishCanada,
    englishCocosIslands,
    englishSwitzerland,
    englishCookIslands,
    englishCameroon,
    englishChristmasIsland,
    englishCyprus,
    englishGermany,
    englishDG,
    englishDenmark,
    englishDominica,
    englishEritrea,
    englishFinland,
    englishFiji,
    englishFalklandIslands,
    englishFederatedStatesOfMicronesia,
    englishUnitedKingdom,
    englishGrenada,
    englishGuernsey,
    englishGhana,
    englishGibraltar,
    englishGambia,
    englishGuam,
    englishGuyana,
    englishHongKong,
    englishIreland,
    englishIsrael,
    englishIsleOfMan,
    englishIndia,
    englishBritishIndianOceanTerritory,
    englishJersey,
    englishJamaica,
    englishKenya,
    englishKiribati,
    englishSaintKittsAndNevis,
    englishCaymanIslands,
    englishSaintLucia,
    englishLiberia,
    englishLesotho,
    englishMadagascar,
    englishMarshallIslands,
    englishMacao,
    englishNorthernMarianaIslands,
    englishMontserrat,
    englishMalta,
    englishMauritius,
    englishMalawi,
    englishMalaysia,
    englishNamibia,
    englishNorfolkIsland,
    englishNigeria,
    englishNetherlands,
    englishNauru,
    englishNiue,
    englishNewZealand,
    englishPapuaNewGuinea,
    englishPhilippines,
    englishPakistan,
    englishPitcairn,
    englishPuertoRico,
    englishPalau,
    englishRwanda,
    englishSolomonIslands,
    englishSeychelles,
    englishSudan,
    englishSweden,
    englishSingapore,
    englishSaintHelenaAscensionAndTristanDaCunha,
    englishSlovenia,
    englishSierraLeone,
    englishSouthSudan,
    englishSintMaarten,
    englishEswatini,
    englishTurksAndCaicosIslands,
    englishTokelau,
    englishTonga,
    englishTrinidadAndTobago,
    englishTuvalu,
    englishUnitedRepublicOfTanzania,
    englishUganda,
    englishUnitedStatesMinorOutlyingIslands,
    englishUnitedStatesOfAmerica,
    englishSaintVincentAndTheGrenadines,
    englishVirginIslandsBritish,
    englishVirginIslandsUS,
    englishVanuatu,
    englishSamoa,
    englishSouthAfrica,
    englishZambia,
    englishZimbabwe,
    esperanto,
    spanish,
    spanishArgentina,
    spanishPlurinationalStateOfBolivia,
    spanishBrazil,
    spanishBelize,
    spanishChile,
    spanishColombia,
    spanishCostaRica,
    spanishCuba,
    spanishDominicanRepublic,
    spanishEA,
    spanishEcuador,
    spanishSpain,
    spanishEquatorialGuinea,
    spanishGuatemala,
    spanishHonduras,
    spanishIC,
    spanishMexico,
    spanishNicaragua,
    spanishPanama,
    spanishPeru,
    spanishPhilippines,
    spanishPuertoRico,
    spanishParaguay,
    spanishElSalvador,
    spanishUnitedStatesOfAmerica,
    spanishUruguay,
    spanishBolivarianRepublicOfVenezuela,
    estonian,
    estonianEstonia,
    basque,
    basqueSpain,
    ewondo,
    ewondoCameroon,
    persian,
    persianAfghanistan,
    persianIran,
    fulah,
    finnish,
    finnishFinland,
    filipino,
    filipinoPhilippines,
    faroese,
    faroeseDenmark,
    faroeseFaroeIslands,
    french,
    frenchBelgium,
    frenchBurkinaFaso,
    frenchBurundi,
    frenchBenin,
    frenchSaintBarthelemy,
    frenchCanada,
    frenchDemocraticRepublicOfTheCongo,
    frenchCentralAfricanRepublic,
    frenchCongo,
    frenchSwitzerland,
    frenchCoteDIvoire,
    frenchCameroon,
    frenchDjibouti,
    frenchAlgeria,
    frenchFrance,
    frenchGabon,
    frenchFrenchGuiana,
    frenchGuinea,
    frenchGuadeloupe,
    frenchEquatorialGuinea,
    frenchHaiti,
    frenchComoros,
    frenchLuxembourg,
    frenchMorocco,
    frenchMonaco,
    frenchTheCollectivityOfSaintMartin,
    frenchMadagascar,
    frenchMali,
    frenchMartinique,
    frenchMauritania,
    frenchMauritius,
    frenchNewCaledonia,
    frenchNiger,
    frenchFrenchPolynesia,
    frenchSaintPierreAndMiquelon,
    frenchReunion,
    frenchRwanda,
    frenchSeychelles,
    frenchSenegal,
    frenchSyrianArabRepublic,
    frenchChad,
    frenchTogo,
    frenchTunisia,
    frenchVanuatu,
    frenchWallisAndFutuna,
    frenchMayotte,
    friulian,
    friulianItaly,
    westernFrisian,
    westernFrisianNetherlands,
    irish,
    irishUnitedKingdom,
    irishIreland,
    gaelic,
    gaelicUnitedKingdom,
    galician,
    galicianSpain,
    swissGerman,
    swissGermanSwitzerland,
    swissGermanFrance,
    swissGermanLiechtenstein,
    gujarati,
    gujaratiIndia,
    guz,
    guzKenya,
    manx,
    manxIsleOfMan,
    hausa,
    hausaGhana,
    hausaNiger,
    hausaNigeria,
    hawaiian,
    hawaiianUnitedStatesOfAmerica,
    hebrew,
    hebrewIsrael,
    hindi,
    hindiIndia,
    croatian,
    croatianBosniaAndHerzegovina,
    croatianCroatia,
    upperSorbian,
    upperSorbianGermany,
    hungarian,
    hungarianHungary,
    armenian,
    armenianArmenia,
    interlinguaInternationalAuxiliaryLanguageAssociation,
    indonesian,
    indonesianIndonesia,
    igbo,
    igboNigeria,
    sichuanYi,
    sichuanYiChina,
    icelandic,
    icelandicIceland,
    italian,
    italianSwitzerland,
    italianItaly,
    italianSanMarino,
    italianHolySee,
    japanese,
    japaneseJapan,
    jgo,
    jgoCameroon,
    jmc,
    jmcUnitedRepublicOfTanzania,
    javanese,
    javaneseIndonesia,
    georgian,
    georgianGeorgia,
    kabyle,
    kabyleAlgeria,
    kamba,
    kambaKenya,
    kde,
    kdeUnitedRepublicOfTanzania,
    kea,
    keaCaboVerde,
    khq,
    khqMali,
    kikuyu,
    kikuyuKenya,
    kazakh,
    kazakhKazakhstan,
    kkj,
    kkjCameroon,
    kalaallisut,
    kalaallisutGreenland,
    kln,
    klnKenya,
    centralKhmer,
    centralKhmerCambodia,
    kannada,
    kannadaIndia,
    korean,
    koreanDemocraticPeoplesRepublicOfKoreaNorthKorea,
    koreanRepublicOfKoreaSouthKorea,
    konkani,
    konkaniIndia,
    kashmiri,
    kashmiriIndia,
    ksb,
    ksbUnitedRepublicOfTanzania,
    ksf,
    ksfCameroon,
    ksh,
    kshGermany,
    kurdish,
    kurdishTurkey,
    cornish,
    cornishUnitedKingdom,
    kirghiz,
    kirghizKyrgyzstan,
    lag,
    lagUnitedRepublicOfTanzania,
    luxembourgish,
    luxembourgishLuxembourg,
    ganda,
    gandaUganda,
    lkt,
    lktUnitedStatesOfAmerica,
    lingala,
    lingalaAngola,
    lingalaDemocraticRepublicOfTheCongo,
    lingalaCentralAfricanRepublic,
    lingalaCongo,
    lao,
    laoLaoPeoplesDemocraticRepublic,
    lrc,
    lrcIraq,
    lrcIran,
    lithuanian,
    lithuanianLithuania,
    lubaKatanga,
    lubaKatangaDemocraticRepublicOfTheCongo,
    luoKenyaAndTanzania,
    luoKenyaAndTanzaniaKenya,
    luy,
    luyKenya,
    latvian,
    latvianLatvia,
    masai,
    masaiKenya,
    masaiUnitedRepublicOfTanzania,
    mer,
    merKenya,
    mfe,
    mfeMauritius,
    malagasy,
    malagasyMadagascar,
    mgh,
    mghMozambique,
    mgo,
    mgoCameroon,
    maori,
    maoriNewZealand,
    macedonian,
    macedonianNorthMacedonia,
    malayalam,
    malayalamIndia,
    mongolian,
    mongolianMongolia,
    marathi,
    marathiIndia,
    malay,
    malayBruneiDarussalam,
    malayMalaysia,
    malaySingapore,
    maltese,
    malteseMalta,
    mua,
    muaCameroon,
    burmese,
    burmeseMyanmar,
    mzn,
    mznIran,
    naq,
    naqNamibia,
    bokmalNorwegian,
    bokmalNorwegianNorway,
    bokmalNorwegianSvalbardAndJanMayen,
    ndebeleNorth,
    ndebeleNorthZimbabwe,
    lowGerman,
    lowGermanGermany,
    lowGermanNetherlands,
    nepali,
    nepaliIndia,
    nepaliNepal,
    dutch,
    dutchAruba,
    dutchBelgium,
    dutchBonaireSintEustatiusAndSaba,
    dutchCuracao,
    dutchNetherlands,
    dutchSuriname,
    dutchSintMaarten,
    nmg,
    nmgCameroon,
    norwegianNynorsk,
    norwegianNynorskNorway,
    nnh,
    nnhCameroon,
    nus,
    nusSouthSudan,
    nyankole,
    nyankoleUganda,
    oromo,
    oromoEthiopia,
    oromoKenya,
    oriya,
    oriyaIndia,
    ossetian,
    ossetianGeorgia,
    ossetianRussianFederation,
    panjabi,
    polish,
    polishPoland,
    prg,
    pushto,
    pushtoAfghanistan,
    pushtoPakistan,
    portuguese,
    portugueseAngola,
    portugueseBrazil,
    portugueseSwitzerland,
    portugueseCaboVerde,
    portugueseEquatorialGuinea,
    portugueseGuineaBissau,
    portugueseLuxembourg,
    portugueseMacao,
    portugueseMozambique,
    portuguesePortugal,
    portugueseSaoTomeAndPrincipe,
    portugueseTimorLeste,
    quechua,
    quechuaPlurinationalStateOfBolivia,
    quechuaEcuador,
    quechuaPeru,
    romansh,
    romanshSwitzerland,
    rundi,
    rundiBurundi,
    romanian,
    romanianRepublicOfMoldova,
    romanianRomania,
    rof,
    rofUnitedRepublicOfTanzania,
    root,
    russian,
    russianBelarus,
    russianKyrgyzstan,
    russianKazakhstan,
    russianRepublicOfMoldova,
    russianRussianFederation,
    russianUkraine,
    kinyarwanda,
    kinyarwandaRwanda,
    rwk,
    rwkUnitedRepublicOfTanzania,
    yakut,
    yakutRussianFederation,
    saq,
    saqKenya,
    sbp,
    sbpUnitedRepublicOfTanzania,
    sindhi,
    sindhiPakistan,
    northernSami,
    northernSamiFinland,
    northernSamiNorway,
    northernSamiSweden,
    seh,
    sehMozambique,
    ses,
    sesMali,
    sango,
    sangoCentralAfricanRepublic,
    shi,
    sinhala,
    sinhalaSriLanka,
    slovak,
    slovakSlovakia,
    slovenian,
    slovenianSlovenia,
    inariSami,
    inariSamiFinland,
    shona,
    shonaZimbabwe,
    somali,
    somaliDjibouti,
    somaliEthiopia,
    somaliKenya,
    somaliSomalia,
    albanian,
    albanianAlbania,
    albanianNorthMacedonia,
    albanianXK,
    serbian,
    swedish,
    swedishAlandIslands,
    swedishFinland,
    swedishSweden,
    swahili,
    swahiliDemocraticRepublicOfTheCongo,
    swahiliKenya,
    swahiliUnitedRepublicOfTanzania,
    swahiliUganda,
    tamil,
    tamilIndia,
    tamilSriLanka,
    tamilMalaysia,
    tamilSingapore,
    telugu,
    teluguIndia,
    teo,
    teoKenya,
    teoUganda,
    tajik,
    tajikTajikistan,
    thai,
    thaiThailand,
    tigrinya,
    tigrinyaEritrea,
    tigrinyaEthiopia,
    turkmen,
    turkmenTurkmenistan,
    tongaTongaIslands,
    tongaTongaIslandsTonga,
    turkish,
    turkishCyprus,
    turkishTurkey,
    tatar,
    tatarRussianFederation,
    twq,
    twqNiger,
    tzm,
    tzmMorocco,
    uighur,
    uighurChina,
    ukrainian,
    ukrainianUkraine,
    urdu,
    urduIndia,
    urduPakistan,
    uzbek,
    vai,
    vietnamese,
    vietnameseVietnam,
    volapuk,
    vun,
    vunUnitedRepublicOfTanzania,
    wae,
    waeSwitzerland,
    wolof,
    wolofSenegal,
    xhosa,
    xhosaSouthAfrica,
    xog,
    xogUganda,
    yav,
    yavCameroon,
    yiddish,
    yoruba,
    yorubaBenin,
    yorubaNigeria,
    yue,
    standardMoroccanTamazight,
    standardMoroccanTamazightMorocco,
    chinese,
    zulu,
    zuluSouthAfrica,
  };
}

/// A representation of a language
class Language extends Locale {
  const Language._(this.alpha2, this.alpha3, String name) : super._(null, null, name);

  @override
  @Deprecated('Prefer [alpha2]')
  String get code => alpha2;

  /// The ISO 639-1 two letter representation of this language.
  final String alpha2;

  /// The ISO 639-2 three letter representation of this language.
  final String alpha3;

  /// Afar
  static const afar = Language._('aa', 'aar', 'Afar');

  /// Abkhazian
  static const abkhazian = Language._('ab', 'abk', 'Abkhazian');

  /// Achinese
  static const achinese = Language._('', 'ace', 'Achinese');

  /// Acoli
  static const acoli = Language._('', 'ach', 'Acoli');

  /// Adangme
  static const adangme = Language._('', 'ada', 'Adangme');

  /// Adyghe; Adygei
  static const adyghe = Language._('', 'ady', 'Adyghe; Adygei');

  /// Afro-Asiatic languages
  static const afroAsiaticLanguages = Language._('', 'afa', 'Afro-Asiatic languages');

  /// Afrihili
  static const afrihili = Language._('', 'afh', 'Afrihili');

  /// Afrikaans
  static const afrikaans = Language._('af', 'afr', 'Afrikaans');

  /// Ainu
  static const ainu = Language._('', 'ain', 'Ainu');

  /// Akan
  static const akan = Language._('ak', 'aka', 'Akan');

  /// Akkadian
  static const akkadian = Language._('', 'akk', 'Akkadian');

  /// Albanian
  static const albanian = Language._('sq', 'alb', 'Albanian');

  /// Aleut
  static const aleut = Language._('', 'ale', 'Aleut');

  /// Algonquian languages
  static const algonquianLanguages = Language._('', 'alg', 'Algonquian languages');

  /// Southern Altai
  static const southernAltai = Language._('', 'alt', 'Southern Altai');

  /// Amharic
  static const amharic = Language._('am', 'amh', 'Amharic');

  /// English, Old (ca.450-1100)
  static const englishOldCa4501100 = Language._('', 'ang', 'English, Old (ca.450-1100)');

  /// Angika
  static const angika = Language._('', 'anp', 'Angika');

  /// Apache languages
  static const apacheLanguages = Language._('', 'apa', 'Apache languages');

  /// Arabic
  static const arabic = Language._('ar', 'ara', 'Arabic');

  /// Official Aramaic (700-300 BCE); Imperial Aramaic (700-300 BCE)
  static const officialAramaic700300BCE = Language._('', 'arc', 'Official Aramaic (700-300 BCE); Imperial Aramaic (700-300 BCE)');

  /// Aragonese
  static const aragonese = Language._('an', 'arg', 'Aragonese');

  /// Armenian
  static const armenian = Language._('hy', 'arm', 'Armenian');

  /// Mapudungun; Mapuche
  static const mapudungun = Language._('', 'arn', 'Mapudungun; Mapuche');

  /// Arapaho
  static const arapaho = Language._('', 'arp', 'Arapaho');

  /// Artificial languages
  static const artificialLanguages = Language._('', 'art', 'Artificial languages');

  /// Arawak
  static const arawak = Language._('', 'arw', 'Arawak');

  /// Assamese
  static const assamese = Language._('as', 'asm', 'Assamese');

  /// Asturian; Bable; Leonese; Asturleonese
  static const asturian = Language._('', 'ast', 'Asturian; Bable; Leonese; Asturleonese');

  /// Athapascan languages
  static const athapascanLanguages = Language._('', 'ath', 'Athapascan languages');

  /// Australian languages
  static const australianLanguages = Language._('', 'aus', 'Australian languages');

  /// Avaric
  static const avaric = Language._('av', 'ava', 'Avaric');

  /// Avestan
  static const avestan = Language._('ae', 'ave', 'Avestan');

  /// Awadhi
  static const awadhi = Language._('', 'awa', 'Awadhi');

  /// Aymara
  static const aymara = Language._('ay', 'aym', 'Aymara');

  /// Azerbaijani
  static const azerbaijani = Language._('az', 'aze', 'Azerbaijani');

  /// Banda languages
  static const bandaLanguages = Language._('', 'bad', 'Banda languages');

  /// Bamileke languages
  static const bamilekeLanguages = Language._('', 'bai', 'Bamileke languages');

  /// Bashkir
  static const bashkir = Language._('ba', 'bak', 'Bashkir');

  /// Baluchi
  static const baluchi = Language._('', 'bal', 'Baluchi');

  /// Bambara
  static const bambara = Language._('bm', 'bam', 'Bambara');

  /// Balinese
  static const balinese = Language._('', 'ban', 'Balinese');

  /// Basque
  static const basque = Language._('eu', 'baq', 'Basque');

  /// Basa
  static const basa = Language._('', 'bas', 'Basa');

  /// Baltic languages
  static const balticLanguages = Language._('', 'bat', 'Baltic languages');

  /// Beja; Bedawiyet
  static const beja = Language._('', 'bej', 'Beja; Bedawiyet');

  /// Belarusian
  static const belarusian = Language._('be', 'bel', 'Belarusian');

  /// Bemba
  static const bemba = Language._('', 'bem', 'Bemba');

  /// Bengali
  static const bengali = Language._('bn', 'ben', 'Bengali');

  /// Berber languages
  static const berberLanguages = Language._('', 'ber', 'Berber languages');

  /// Bhojpuri
  static const bhojpuri = Language._('', 'bho', 'Bhojpuri');

  /// Bihari languages
  static const bihariLanguages = Language._('bh', 'bih', 'Bihari languages');

  /// Bikol
  static const bikol = Language._('', 'bik', 'Bikol');

  /// Bini; Edo
  static const bini = Language._('', 'bin', 'Bini; Edo');

  /// Bislama
  static const bislama = Language._('bi', 'bis', 'Bislama');

  /// Siksika
  static const siksika = Language._('', 'bla', 'Siksika');

  /// Bantu languages
  static const bantuLanguages = Language._('', 'bnt', 'Bantu languages');

  /// Tibetan
  static const tibetan = Language._('bo', 'tib', 'Tibetan');

  /// Bosnian
  static const bosnian = Language._('bs', 'bos', 'Bosnian');

  /// Braj
  static const braj = Language._('', 'bra', 'Braj');

  /// Breton
  static const breton = Language._('br', 'bre', 'Breton');

  /// Batak languages
  static const batakLanguages = Language._('', 'btk', 'Batak languages');

  /// Buriat
  static const buriat = Language._('', 'bua', 'Buriat');

  /// Buginese
  static const buginese = Language._('', 'bug', 'Buginese');

  /// Bulgarian
  static const bulgarian = Language._('bg', 'bul', 'Bulgarian');

  /// Burmese
  static const burmese = Language._('my', 'bur', 'Burmese');

  /// Blin; Bilin
  static const blin = Language._('', 'byn', 'Blin; Bilin');

  /// Caddo
  static const caddo = Language._('', 'cad', 'Caddo');

  /// Central American Indian languages
  static const centralAmericanIndianLanguages = Language._('', 'cai', 'Central American Indian languages');

  /// Galibi Carib
  static const galibiCarib = Language._('', 'car', 'Galibi Carib');

  /// Catalan; Valencian
  static const catalan = Language._('ca', 'cat', 'Catalan; Valencian');

  /// Caucasian languages
  static const caucasianLanguages = Language._('', 'cau', 'Caucasian languages');

  /// Cebuano
  static const cebuano = Language._('', 'ceb', 'Cebuano');

  /// Celtic languages
  static const celticLanguages = Language._('', 'cel', 'Celtic languages');

  /// Czech
  static const czech = Language._('cs', 'cze', 'Czech');

  /// Chamorro
  static const chamorro = Language._('ch', 'cha', 'Chamorro');

  /// Chibcha
  static const chibcha = Language._('', 'chb', 'Chibcha');

  /// Chechen
  static const chechen = Language._('ce', 'che', 'Chechen');

  /// Chagatai
  static const chagatai = Language._('', 'chg', 'Chagatai');

  /// Chinese
  static const chinese = Language._('zh', 'chi', 'Chinese');

  /// Chuukese
  static const chuukese = Language._('', 'chk', 'Chuukese');

  /// Mari
  static const mari = Language._('', 'chm', 'Mari');

  /// Chinook jargon
  static const chinookJargon = Language._('', 'chn', 'Chinook jargon');

  /// Choctaw
  static const choctaw = Language._('', 'cho', 'Choctaw');

  /// Chipewyan; Dene Suline
  static const chipewyan = Language._('', 'chp', 'Chipewyan; Dene Suline');

  /// Cherokee
  static const cherokee = Language._('', 'chr', 'Cherokee');

  /// Old Slavonic/Old Bulgarian
  static const oldSlavonic = Language._('cu', 'chu', 'Old Slavonic/Old Bulgarian');

  /// Chuvash
  static const chuvash = Language._('cv', 'chv', 'Chuvash');

  /// Cheyenne
  static const cheyenne = Language._('', 'chy', 'Cheyenne');

  /// Chamic languages
  static const chamicLanguages = Language._('', 'cmc', 'Chamic languages');

  /// Montenegrin
  static const montenegrin = Language._('', 'cnr', 'Montenegrin');

  /// Coptic
  static const coptic = Language._('', 'cop', 'Coptic');

  /// Cornish
  static const cornish = Language._('kw', 'cor', 'Cornish');

  /// Corsican
  static const corsican = Language._('co', 'cos', 'Corsican');

  /// Creoles and pidgins, English based
  static const creolesAndPidginsEnglishBased = Language._('', 'cpe', 'Creoles and pidgins, English based');

  /// Creoles and pidgins, French-based
  static const creolesAndPidginsFrenchBased = Language._('', 'cpf', 'Creoles and pidgins, French-based');

  /// Creoles and pidgins, Portuguese-based
  static const creolesAndPidginsPortugueseBased = Language._('', 'cpp', 'Creoles and pidgins, Portuguese-based');

  /// Cree
  static const cree = Language._('cr', 'cre', 'Cree');

  /// Crimean Tatar; Crimean Turkish
  static const crimeanTatar = Language._('', 'crh', 'Crimean Tatar; Crimean Turkish');

  /// Creoles and pidgins
  static const creolesAndPidgins = Language._('', 'crp', 'Creoles and pidgins');

  /// Kashubian
  static const kashubian = Language._('', 'csb', 'Kashubian');

  /// Cushitic languages
  static const cushiticLanguages = Language._('', 'cus', 'Cushitic languages');

  /// Welsh
  static const welsh = Language._('cy', 'wel', 'Welsh');

  /// Dakota
  static const dakota = Language._('', 'dak', 'Dakota');

  /// Danish
  static const danish = Language._('da', 'dan', 'Danish');

  /// Dargwa
  static const dargwa = Language._('', 'dar', 'Dargwa');

  /// Land Dayak languages
  static const landDayakLanguages = Language._('', 'day', 'Land Dayak languages');

  /// Delaware
  static const delaware = Language._('', 'del', 'Delaware');

  /// Slave (Athapascan)
  static const slaveAthapascan = Language._('', 'den', 'Slave (Athapascan)');

  /// German
  static const german = Language._('de', 'ger', 'German');

  /// Dogrib
  static const dogrib = Language._('', 'dgr', 'Dogrib');

  /// Dinka
  static const dinka = Language._('', 'din', 'Dinka');

  /// Divehi; Dhivehi; Maldivian
  static const divehi = Language._('dv', 'div', 'Divehi; Dhivehi; Maldivian');

  /// Dogri
  static const dogri = Language._('', 'doi', 'Dogri');

  /// Dravidian languages
  static const dravidianLanguages = Language._('', 'dra', 'Dravidian languages');

  /// Lower Sorbian
  static const lowerSorbian = Language._('', 'dsb', 'Lower Sorbian');

  /// Duala
  static const duala = Language._('', 'dua', 'Duala');

  /// Dutch, Middle (ca.1050-1350)
  static const dutchMiddleCa10501350 = Language._('', 'dum', 'Dutch, Middle (ca.1050-1350)');

  /// Dutch; Flemish
  static const dutch = Language._('nl', 'dut', 'Dutch; Flemish');

  /// Dyula
  static const dyula = Language._('', 'dyu', 'Dyula');

  /// Dzongkha
  static const dzongkha = Language._('dz', 'dzo', 'Dzongkha');

  /// Efik
  static const efik = Language._('', 'efi', 'Efik');

  /// Egyptian (Ancient)
  static const egyptianAncient = Language._('', 'egy', 'Egyptian (Ancient)');

  /// Ekajuk
  static const ekajuk = Language._('', 'eka', 'Ekajuk');

  /// Greek, Modern (1453-)
  static const greekModern1453 = Language._('el', 'gre', 'Greek, Modern (1453-)');

  /// Elamite
  static const elamite = Language._('', 'elx', 'Elamite');

  /// English
  static const english = Language._('en', 'eng', 'English');

  /// English, Middle (1100-1500)
  static const englishMiddle11001500 = Language._('', 'enm', 'English, Middle (1100-1500)');

  /// Esperanto
  static const esperanto = Language._('eo', 'epo', 'Esperanto');

  /// Estonian
  static const estonian = Language._('et', 'est', 'Estonian');

  /// Ewe
  static const ewe = Language._('ee', 'ewe', 'Ewe');

  /// Ewondo
  static const ewondo = Language._('', 'ewo', 'Ewondo');

  /// Fang
  static const fang = Language._('', 'fan', 'Fang');

  /// Faroese
  static const faroese = Language._('fo', 'fao', 'Faroese');

  /// Persian
  static const persian = Language._('fa', 'per', 'Persian');

  /// Fanti
  static const fanti = Language._('', 'fat', 'Fanti');

  /// Fijian
  static const fijian = Language._('fj', 'fij', 'Fijian');

  /// Filipino; Pilipino
  static const filipino = Language._('', 'fil', 'Filipino; Pilipino');

  /// Finnish
  static const finnish = Language._('fi', 'fin', 'Finnish');

  /// Finno-Ugrian languages
  static const finnoUgrianLanguages = Language._('', 'fiu', 'Finno-Ugrian languages');

  /// Fon
  static const fon = Language._('', 'fon', 'Fon');

  /// French
  static const french = Language._('fr', 'fre', 'French');

  /// French, Middle (ca.1400-1600)
  static const frenchMiddleCa14001600 = Language._('', 'frm', 'French, Middle (ca.1400-1600)');

  /// French, Old (842-ca.1400)
  static const frenchOld842Ca1400 = Language._('', 'fro', 'French, Old (842-ca.1400)');

  /// Northern Frisian
  static const northernFrisian = Language._('', 'frr', 'Northern Frisian');

  /// Eastern Frisian
  static const easternFrisian = Language._('', 'frs', 'Eastern Frisian');

  /// Western Frisian
  static const westernFrisian = Language._('fy', 'fry', 'Western Frisian');

  /// Fulah
  static const fulah = Language._('ff', 'ful', 'Fulah');

  /// Friulian
  static const friulian = Language._('', 'fur', 'Friulian');

  /// Ga
  static const ga = Language._('', 'gaa', 'Ga');

  /// Gayo
  static const gayo = Language._('', 'gay', 'Gayo');

  /// Gbaya
  static const gbaya = Language._('', 'gba', 'Gbaya');

  /// Germanic languages
  static const germanicLanguages = Language._('', 'gem', 'Germanic languages');

  /// Georgian
  static const georgian = Language._('ka', 'geo', 'Georgian');

  /// Geez
  static const geez = Language._('', 'gez', 'Geez');

  /// Gilbertese
  static const gilbertese = Language._('', 'gil', 'Gilbertese');

  /// Gaelic; Scottish Gaelic
  static const gaelic = Language._('gd', 'gla', 'Gaelic; Scottish Gaelic');

  /// Irish
  static const irish = Language._('ga', 'gle', 'Irish');

  /// Galician
  static const galician = Language._('gl', 'glg', 'Galician');

  /// Manx
  static const manx = Language._('gv', 'glv', 'Manx');

  /// German, Middle High (ca.1050-1500)
  static const germanMiddleHighCa10501500 = Language._('', 'gmh', 'German, Middle High (ca.1050-1500)');

  /// German, Old High (ca.750-1050)
  static const germanOldHighCa7501050 = Language._('', 'goh', 'German, Old High (ca.750-1050)');

  /// Gondi
  static const gondi = Language._('', 'gon', 'Gondi');

  /// Gorontalo
  static const gorontalo = Language._('', 'gor', 'Gorontalo');

  /// Gothic
  static const gothic = Language._('', 'got', 'Gothic');

  /// Grebo
  static const grebo = Language._('', 'grb', 'Grebo');

  /// Greek, Ancient (to 1453)
  static const greekAncientTo1453 = Language._('', 'grc', 'Greek, Ancient (to 1453)');

  /// Guarani
  static const guarani = Language._('gn', 'grn', 'Guarani');

  /// Swiss German; Alemannic; Alsatian
  static const swissGerman = Language._('', 'gsw', 'Swiss German; Alemannic; Alsatian');

  /// Gujarati
  static const gujarati = Language._('gu', 'guj', 'Gujarati');

  /// Gwich'in
  static const gwichin = Language._('', 'gwi', 'Gwich\'in');

  /// Haida
  static const haida = Language._('', 'hai', 'Haida');

  /// Haitian; Haitian Creole
  static const haitian = Language._('ht', 'hat', 'Haitian; Haitian Creole');

  /// Hausa
  static const hausa = Language._('ha', 'hau', 'Hausa');

  /// Hawaiian
  static const hawaiian = Language._('', 'haw', 'Hawaiian');

  /// Hebrew
  static const hebrew = Language._('he', 'heb', 'Hebrew');

  /// Herero
  static const herero = Language._('hz', 'her', 'Herero');

  /// Hiligaynon
  static const hiligaynon = Language._('', 'hil', 'Hiligaynon');

  /// Himachali languages; Western Pahari languages
  static const himachaliLanguages = Language._('', 'him', 'Himachali languages; Western Pahari languages');

  /// Hindi
  static const hindi = Language._('hi', 'hin', 'Hindi');

  /// Hittite
  static const hittite = Language._('', 'hit', 'Hittite');

  /// Hmong; Mong
  static const hmong = Language._('', 'hmn', 'Hmong; Mong');

  /// Hiri Motu
  static const hiriMotu = Language._('ho', 'hmo', 'Hiri Motu');

  /// Croatian
  static const croatian = Language._('hr', 'hrv', 'Croatian');

  /// Upper Sorbian
  static const upperSorbian = Language._('', 'hsb', 'Upper Sorbian');

  /// Hungarian
  static const hungarian = Language._('hu', 'hun', 'Hungarian');

  /// Hupa
  static const hupa = Language._('', 'hup', 'Hupa');

  /// Iban
  static const iban = Language._('', 'iba', 'Iban');

  /// Igbo
  static const igbo = Language._('ig', 'ibo', 'Igbo');

  /// Icelandic
  static const icelandic = Language._('is', 'ice', 'Icelandic');

  /// Ido
  static const ido = Language._('io', 'ido', 'Ido');

  /// Sichuan Yi; Nuosu
  static const sichuanYi = Language._('ii', 'iii', 'Sichuan Yi; Nuosu');

  /// Ijo languages
  static const ijoLanguages = Language._('', 'ijo', 'Ijo languages');

  /// Inuktitut
  static const inuktitut = Language._('iu', 'iku', 'Inuktitut');

  /// Interlingue; Occidental
  static const interlingue = Language._('ie', 'ile', 'Interlingue; Occidental');

  /// Iloko
  static const iloko = Language._('', 'ilo', 'Iloko');

  /// Interlingua (International Auxiliary Language Association)
  static const interlinguaInternationalAuxiliaryLanguageAssociation = Language._('ia', 'ina', 'Interlingua (International Auxiliary Language Association)');

  /// Indic languages
  static const indicLanguages = Language._('', 'inc', 'Indic languages');

  /// Indonesian
  static const indonesian = Language._('id', 'ind', 'Indonesian');

  /// Indo-European languages
  static const indoEuropeanLanguages = Language._('', 'ine', 'Indo-European languages');

  /// Ingush
  static const ingush = Language._('', 'inh', 'Ingush');

  /// Inupiaq
  static const inupiaq = Language._('ik', 'ipk', 'Inupiaq');

  /// Iranian languages
  static const iranianLanguages = Language._('', 'ira', 'Iranian languages');

  /// Iroquoian languages
  static const iroquoianLanguages = Language._('', 'iro', 'Iroquoian languages');

  /// Italian
  static const italian = Language._('it', 'ita', 'Italian');

  /// Javanese
  static const javanese = Language._('jv', 'jav', 'Javanese');

  /// Lojban
  static const lojban = Language._('', 'jbo', 'Lojban');

  /// Japanese
  static const japanese = Language._('ja', 'jpn', 'Japanese');

  /// Judeo-Persian
  static const judeoPersian = Language._('', 'jpr', 'Judeo-Persian');

  /// Judeo-Arabic
  static const judeoArabic = Language._('', 'jrb', 'Judeo-Arabic');

  /// Kara-Kalpak
  static const karaKalpak = Language._('', 'kaa', 'Kara-Kalpak');

  /// Kabyle
  static const kabyle = Language._('', 'kab', 'Kabyle');

  /// Kachin; Jingpho
  static const kachin = Language._('', 'kac', 'Kachin; Jingpho');

  /// Kalaallisut; Greenlandic
  static const kalaallisut = Language._('kl', 'kal', 'Kalaallisut; Greenlandic');

  /// Kamba
  static const kamba = Language._('', 'kam', 'Kamba');

  /// Kannada
  static const kannada = Language._('kn', 'kan', 'Kannada');

  /// Karen languages
  static const karenLanguages = Language._('', 'kar', 'Karen languages');

  /// Kashmiri
  static const kashmiri = Language._('ks', 'kas', 'Kashmiri');

  /// Kanuri
  static const kanuri = Language._('kr', 'kau', 'Kanuri');

  /// Kawi
  static const kawi = Language._('', 'kaw', 'Kawi');

  /// Kazakh
  static const kazakh = Language._('kk', 'kaz', 'Kazakh');

  /// Kabardian
  static const kabardian = Language._('', 'kbd', 'Kabardian');

  /// Khasi
  static const khasi = Language._('', 'kha', 'Khasi');

  /// Khoisan languages
  static const khoisanLanguages = Language._('', 'khi', 'Khoisan languages');

  /// Central Khmer
  static const centralKhmer = Language._('km', 'khm', 'Central Khmer');

  /// Khotanese; Sakan
  static const khotanese = Language._('', 'kho', 'Khotanese; Sakan');

  /// Kikuyu; Gikuyu
  static const kikuyu = Language._('ki', 'kik', 'Kikuyu; Gikuyu');

  /// Kinyarwanda
  static const kinyarwanda = Language._('rw', 'kin', 'Kinyarwanda');

  /// Kirghiz; Kyrgyz
  static const kirghiz = Language._('ky', 'kir', 'Kirghiz; Kyrgyz');

  /// Kimbundu
  static const kimbundu = Language._('', 'kmb', 'Kimbundu');

  /// Konkani
  static const konkani = Language._('', 'kok', 'Konkani');

  /// Komi
  static const komi = Language._('kv', 'kom', 'Komi');

  /// Kongo
  static const kongo = Language._('kg', 'kon', 'Kongo');

  /// Korean
  static const korean = Language._('ko', 'kor', 'Korean');

  /// Kosraean
  static const kosraean = Language._('', 'kos', 'Kosraean');

  /// Kpelle
  static const kpelle = Language._('', 'kpe', 'Kpelle');

  /// Karachay-Balkar
  static const karachayBalkar = Language._('', 'krc', 'Karachay-Balkar');

  /// Karelian
  static const karelian = Language._('', 'krl', 'Karelian');

  /// Kru languages
  static const kruLanguages = Language._('', 'kro', 'Kru languages');

  /// Kurukh
  static const kurukh = Language._('', 'kru', 'Kurukh');

  /// Kuanyama; Kwanyama
  static const kuanyama = Language._('kj', 'kua', 'Kuanyama; Kwanyama');

  /// Kumyk
  static const kumyk = Language._('', 'kum', 'Kumyk');

  /// Kurdish
  static const kurdish = Language._('ku', 'kur', 'Kurdish');

  /// Kutenai
  static const kutenai = Language._('', 'kut', 'Kutenai');

  /// Ladino
  static const ladino = Language._('', 'lad', 'Ladino');

  /// Lahnda
  static const lahnda = Language._('', 'lah', 'Lahnda');

  /// Lamba
  static const lamba = Language._('', 'lam', 'Lamba');

  /// Lao
  static const lao = Language._('lo', 'lao', 'Lao');

  /// Latin
  static const latin = Language._('la', 'lat', 'Latin');

  /// Latvian
  static const latvian = Language._('lv', 'lav', 'Latvian');

  /// Lezghian
  static const lezghian = Language._('', 'lez', 'Lezghian');

  /// Limburgan; Limburger; Limburgish
  static const limburgan = Language._('li', 'lim', 'Limburgan; Limburger; Limburgish');

  /// Lingala
  static const lingala = Language._('ln', 'lin', 'Lingala');

  /// Lithuanian
  static const lithuanian = Language._('lt', 'lit', 'Lithuanian');

  /// Mongo
  static const mongo = Language._('', 'lol', 'Mongo');

  /// Lozi
  static const lozi = Language._('', 'loz', 'Lozi');

  /// Luxembourgish; Letzeburgesch
  static const luxembourgish = Language._('lb', 'ltz', 'Luxembourgish; Letzeburgesch');

  /// Luba-Lulua
  static const lubaLulua = Language._('', 'lua', 'Luba-Lulua');

  /// Luba-Katanga
  static const lubaKatanga = Language._('lu', 'lub', 'Luba-Katanga');

  /// Ganda
  static const ganda = Language._('lg', 'lug', 'Ganda');

  /// Luiseno
  static const luiseno = Language._('', 'lui', 'Luiseno');

  /// Lunda
  static const lunda = Language._('', 'lun', 'Lunda');

  /// Luo (Kenya and Tanzania)
  static const luoKenyaAndTanzania = Language._('', 'luo', 'Luo (Kenya and Tanzania)');

  /// Lushai
  static const lushai = Language._('', 'lus', 'Lushai');

  /// Macedonian
  static const macedonian = Language._('mk', 'mac', 'Macedonian');

  /// Madurese
  static const madurese = Language._('', 'mad', 'Madurese');

  /// Magahi
  static const magahi = Language._('', 'mag', 'Magahi');

  /// Marshallese
  static const marshallese = Language._('mh', 'mah', 'Marshallese');

  /// Maithili
  static const maithili = Language._('', 'mai', 'Maithili');

  /// Makasar
  static const makasar = Language._('', 'mak', 'Makasar');

  /// Malayalam
  static const malayalam = Language._('ml', 'mal', 'Malayalam');

  /// Mandingo
  static const mandingo = Language._('', 'man', 'Mandingo');

  /// Maori
  static const maori = Language._('mi', 'mao', 'Maori');

  /// Austronesian languages
  static const austronesianLanguages = Language._('', 'map', 'Austronesian languages');

  /// Marathi
  static const marathi = Language._('mr', 'mar', 'Marathi');

  /// Masai
  static const masai = Language._('', 'mas', 'Masai');

  /// Malay
  static const malay = Language._('ms', 'may', 'Malay');

  /// Moksha
  static const moksha = Language._('', 'mdf', 'Moksha');

  /// Mandar
  static const mandar = Language._('', 'mdr', 'Mandar');

  /// Mende
  static const mende = Language._('', 'men', 'Mende');

  /// Irish, Middle (900-1200)
  static const irishMiddle9001200 = Language._('', 'mga', 'Irish, Middle (900-1200)');

  /// Mi'kmaq; Micmac
  static const mikmaq = Language._('', 'mic', 'Mi\'kmaq; Micmac');

  /// Minangkabau
  static const minangkabau = Language._('', 'min', 'Minangkabau');

  /// Uncoded languages
  static const uncodedLanguages = Language._('', 'mis', 'Uncoded languages');

  /// Mon-Khmer languages
  static const monKhmerLanguages = Language._('', 'mkh', 'Mon-Khmer languages');

  /// Malagasy
  static const malagasy = Language._('mg', 'mlg', 'Malagasy');

  /// Maltese
  static const maltese = Language._('mt', 'mlt', 'Maltese');

  /// Manchu
  static const manchu = Language._('', 'mnc', 'Manchu');

  /// Manipuri
  static const manipuri = Language._('', 'mni', 'Manipuri');

  /// Manobo languages
  static const manoboLanguages = Language._('', 'mno', 'Manobo languages');

  /// Mohawk
  static const mohawk = Language._('', 'moh', 'Mohawk');

  /// Mongolian
  static const mongolian = Language._('mn', 'mon', 'Mongolian');

  /// Mossi
  static const mossi = Language._('', 'mos', 'Mossi');

  /// Multiple languages
  static const multipleLanguages = Language._('', 'mul', 'Multiple languages');

  /// Munda languages
  static const mundaLanguages = Language._('', 'mun', 'Munda languages');

  /// Creek
  static const creek = Language._('', 'mus', 'Creek');

  /// Mirandese
  static const mirandese = Language._('', 'mwl', 'Mirandese');

  /// Marwari
  static const marwari = Language._('', 'mwr', 'Marwari');

  /// Mayan languages
  static const mayanLanguages = Language._('', 'myn', 'Mayan languages');

  /// Erzya
  static const erzya = Language._('', 'myv', 'Erzya');

  /// Nahuatl languages
  static const nahuatlLanguages = Language._('', 'nah', 'Nahuatl languages');

  /// North American Indian languages
  static const northAmericanIndianLanguages = Language._('', 'nai', 'North American Indian languages');

  /// Neapolitan
  static const neapolitan = Language._('', 'nap', 'Neapolitan');

  /// Nauru
  static const nauru = Language._('na', 'nau', 'Nauru');

  /// Navajo; Navaho
  static const navajo = Language._('nv', 'nav', 'Navajo; Navaho');

  /// Ndebele, South; South Ndebele
  static const ndebeleSouth = Language._('nr', 'nbl', 'Ndebele, South; South Ndebele');

  /// Ndebele, North; North Ndebele
  static const ndebeleNorth = Language._('nd', 'nde', 'Ndebele, North; North Ndebele');

  /// Ndonga
  static const ndonga = Language._('ng', 'ndo', 'Ndonga');

  /// Low German; Low Saxon; German, Low; Saxon, Low
  static const lowGerman = Language._('', 'nds', 'Low German; Low Saxon; German, Low; Saxon, Low');

  /// Nepali
  static const nepali = Language._('ne', 'nep', 'Nepali');

  /// Nepal Bhasa; Newari
  static const nepalBhasa = Language._('', 'new', 'Nepal Bhasa; Newari');

  /// Nias
  static const nias = Language._('', 'nia', 'Nias');

  /// Niger-Kordofanian languages
  static const nigerKordofanianLanguages = Language._('', 'nic', 'Niger-Kordofanian languages');

  /// Niuean
  static const niuean = Language._('', 'niu', 'Niuean');

  /// Norwegian Nynorsk; Nynorsk, Norwegian
  static const norwegianNynorsk = Language._('nn', 'nno', 'Norwegian Nynorsk; Nynorsk, Norwegian');

  /// Bokmål, Norwegian; Norwegian Bokmål
  static const bokmalNorwegian = Language._('nb', 'nob', 'Bokmål, Norwegian; Norwegian Bokmål');

  /// Nogai
  static const nogai = Language._('', 'nog', 'Nogai');

  /// Norse, Old
  static const norseOld = Language._('', 'non', 'Norse, Old');

  /// Norwegian
  static const norwegian = Language._('no', 'nor', 'Norwegian');

  /// N'Ko
  static const nKo = Language._('', 'nqo', 'N\'Ko');

  /// Pedi; Sepedi; Northern Sotho
  static const pedi = Language._('', 'nso', 'Pedi; Sepedi; Northern Sotho');

  /// Nubian languages
  static const nubianLanguages = Language._('', 'nub', 'Nubian languages');

  /// Classical Newari; Old Newari; Classical Nepal Bhasa
  static const classicalNewari = Language._('', 'nwc', 'Classical Newari; Old Newari; Classical Nepal Bhasa');

  /// Chichewa; Chewa; Nyanja
  static const chichewa = Language._('ny', 'nya', 'Chichewa; Chewa; Nyanja');

  /// Nyamwezi
  static const nyamwezi = Language._('', 'nym', 'Nyamwezi');

  /// Nyankole
  static const nyankole = Language._('', 'nyn', 'Nyankole');

  /// Nyoro
  static const nyoro = Language._('', 'nyo', 'Nyoro');

  /// Nzima
  static const nzima = Language._('', 'nzi', 'Nzima');

  /// Occitan (post 1500)
  static const occitanPost1500 = Language._('oc', 'oci', 'Occitan (post 1500)');

  /// Ojibwa
  static const ojibwa = Language._('oj', 'oji', 'Ojibwa');

  /// Oriya
  static const oriya = Language._('or', 'ori', 'Oriya');

  /// Oromo
  static const oromo = Language._('om', 'orm', 'Oromo');

  /// Osage
  static const osage = Language._('', 'osa', 'Osage');

  /// Ossetian; Ossetic
  static const ossetian = Language._('os', 'oss', 'Ossetian; Ossetic');

  /// Turkish, Ottoman (1500-1928)
  static const turkishOttoman15001928 = Language._('', 'ota', 'Turkish, Ottoman (1500-1928)');

  /// Otomian languages
  static const otomianLanguages = Language._('', 'oto', 'Otomian languages');

  /// Papuan languages
  static const papuanLanguages = Language._('', 'paa', 'Papuan languages');

  /// Pangasinan
  static const pangasinan = Language._('', 'pag', 'Pangasinan');

  /// Pahlavi
  static const pahlavi = Language._('', 'pal', 'Pahlavi');

  /// Pampanga; Kapampangan
  static const pampanga = Language._('', 'pam', 'Pampanga; Kapampangan');

  /// Panjabi; Punjabi
  static const panjabi = Language._('pa', 'pan', 'Panjabi; Punjabi');

  /// Papiamento
  static const papiamento = Language._('', 'pap', 'Papiamento');

  /// Palauan
  static const palauan = Language._('', 'pau', 'Palauan');

  /// Persian, Old (ca.600-400 B.C.)
  static const persianOldCa600400BC = Language._('', 'peo', 'Persian, Old (ca.600-400 B.C.)');

  /// Philippine languages
  static const philippineLanguages = Language._('', 'phi', 'Philippine languages');

  /// Phoenician
  static const phoenician = Language._('', 'phn', 'Phoenician');

  /// Pali
  static const pali = Language._('pi', 'pli', 'Pali');

  /// Polish
  static const polish = Language._('pl', 'pol', 'Polish');

  /// Pohnpeian
  static const pohnpeian = Language._('', 'pon', 'Pohnpeian');

  /// Portuguese
  static const portuguese = Language._('pt', 'por', 'Portuguese');

  /// Prakrit languages
  static const prakritLanguages = Language._('', 'pra', 'Prakrit languages');

  /// Provençal, Old (to 1500);Occitan, Old (to 1500)
  static const provencalOldTo1500 = Language._('', 'pro', 'Provençal, Old (to 1500);Occitan, Old (to 1500)');

  /// Pushto; Pashto
  static const pushto = Language._('ps', 'pus', 'Pushto; Pashto');

  /// "Reserved for local use" according to https://www.loc.gov/standards/iso639-2/php/code_list.php
  static const qaaqtz = Language._('', 'qaa-qtz', '"Reserved for local use" according to https://www.loc.gov/standards/iso639-2/php/code_list.php');

  /// Quechua
  static const quechua = Language._('qu', 'que', 'Quechua');

  /// Rajasthani
  static const rajasthani = Language._('', 'raj', 'Rajasthani');

  /// Rapanui
  static const rapanui = Language._('', 'rap', 'Rapanui');

  /// Rarotongan; Cook Islands Maori
  static const rarotongan = Language._('', 'rar', 'Rarotongan; Cook Islands Maori');

  /// Romance languages
  static const romanceLanguages = Language._('', 'roa', 'Romance languages');

  /// Romansh
  static const romansh = Language._('rm', 'roh', 'Romansh');

  /// Romany
  static const romany = Language._('', 'rom', 'Romany');

  /// Romanian; Moldavian; Moldovan
  static const romanian = Language._('ro', 'rum', 'Romanian; Moldavian; Moldovan');

  /// Rundi
  static const rundi = Language._('rn', 'run', 'Rundi');

  /// Aromanian; Arumanian; Macedo-Romanian
  static const aromanian = Language._('', 'rup', 'Aromanian; Arumanian; Macedo-Romanian');

  /// Russian
  static const russian = Language._('ru', 'rus', 'Russian');

  /// Sandawe
  static const sandawe = Language._('', 'sad', 'Sandawe');

  /// Sango
  static const sango = Language._('sg', 'sag', 'Sango');

  /// Yakut
  static const yakut = Language._('', 'sah', 'Yakut');

  /// South American Indian languages
  static const southAmericanIndianLanguages = Language._('', 'sai', 'South American Indian languages');

  /// Salishan languages
  static const salishanLanguages = Language._('', 'sal', 'Salishan languages');

  /// Samaritan Aramaic
  static const samaritanAramaic = Language._('', 'sam', 'Samaritan Aramaic');

  /// Sanskrit
  static const sanskrit = Language._('sa', 'san', 'Sanskrit');

  /// Sasak
  static const sasak = Language._('', 'sas', 'Sasak');

  /// Santali
  static const santali = Language._('', 'sat', 'Santali');

  /// Sicilian
  static const sicilian = Language._('', 'scn', 'Sicilian');

  /// Scots
  static const scots = Language._('', 'sco', 'Scots');

  /// Selkup
  static const selkup = Language._('', 'sel', 'Selkup');

  /// Semitic languages
  static const semiticLanguages = Language._('', 'sem', 'Semitic languages');

  /// Irish, Old (to 900)
  static const irishOldTo900 = Language._('', 'sga', 'Irish, Old (to 900)');

  /// Sign Languages
  static const signLanguages = Language._('', 'sgn', 'Sign Languages');

  /// Shan
  static const shan = Language._('', 'shn', 'Shan');

  /// Sidamo
  static const sidamo = Language._('', 'sid', 'Sidamo');

  /// Sinhala; Sinhalese
  static const sinhala = Language._('si', 'sin', 'Sinhala; Sinhalese');

  /// Siouan languages
  static const siouanLanguages = Language._('', 'sio', 'Siouan languages');

  /// Sino-Tibetan languages
  static const sinoTibetanLanguages = Language._('', 'sit', 'Sino-Tibetan languages');

  /// Slavic languages
  static const slavicLanguages = Language._('', 'sla', 'Slavic languages');

  /// Slovak
  static const slovak = Language._('sk', 'slo', 'Slovak');

  /// Slovenian
  static const slovenian = Language._('sl', 'slv', 'Slovenian');

  /// Southern Sami
  static const southernSami = Language._('', 'sma', 'Southern Sami');

  /// Northern Sami
  static const northernSami = Language._('se', 'sme', 'Northern Sami');

  /// Sami languages
  static const samiLanguages = Language._('', 'smi', 'Sami languages');

  /// Lule Sami
  static const luleSami = Language._('', 'smj', 'Lule Sami');

  /// Inari Sami
  static const inariSami = Language._('', 'smn', 'Inari Sami');

  /// Samoan
  static const samoan = Language._('sm', 'smo', 'Samoan');

  /// Skolt Sami
  static const skoltSami = Language._('', 'sms', 'Skolt Sami');

  /// Shona
  static const shona = Language._('sn', 'sna', 'Shona');

  /// Sindhi
  static const sindhi = Language._('sd', 'snd', 'Sindhi');

  /// Soninke
  static const soninke = Language._('', 'snk', 'Soninke');

  /// Sogdian
  static const sogdian = Language._('', 'sog', 'Sogdian');

  /// Somali
  static const somali = Language._('so', 'som', 'Somali');

  /// Songhai languages
  static const songhaiLanguages = Language._('', 'son', 'Songhai languages');

  /// Sotho, Southern
  static const sothoSouthern = Language._('st', 'sot', 'Sotho, Southern');

  /// Spanish
  static const spanish = Language._('es', 'spa', 'Spanish');

  /// Sardinian
  static const sardinian = Language._('sc', 'srd', 'Sardinian');

  /// Sranan Tongo
  static const srananTongo = Language._('', 'srn', 'Sranan Tongo');

  /// Serbian
  static const serbian = Language._('sr', 'srp', 'Serbian');

  /// Serer
  static const serer = Language._('', 'srr', 'Serer');

  /// Nilo-Saharan languages
  static const niloSaharanLanguages = Language._('', 'ssa', 'Nilo-Saharan languages');

  /// Swati
  static const swati = Language._('ss', 'ssw', 'Swati');

  /// Sukuma
  static const sukuma = Language._('', 'suk', 'Sukuma');

  /// Sundanese
  static const sundanese = Language._('su', 'sun', 'Sundanese');

  /// Susu
  static const susu = Language._('', 'sus', 'Susu');

  /// Sumerian
  static const sumerian = Language._('', 'sux', 'Sumerian');

  /// Swahili
  static const swahili = Language._('sw', 'swa', 'Swahili');

  /// Swedish
  static const swedish = Language._('sv', 'swe', 'Swedish');

  /// Classical Syriac
  static const classicalSyriac = Language._('', 'syc', 'Classical Syriac');

  /// Syriac
  static const syriac = Language._('', 'syr', 'Syriac');

  /// Tahitian
  static const tahitian = Language._('ty', 'tah', 'Tahitian');

  /// Tai languages
  static const taiLanguages = Language._('', 'tai', 'Tai languages');

  /// Tamil
  static const tamil = Language._('ta', 'tam', 'Tamil');

  /// Tatar
  static const tatar = Language._('tt', 'tat', 'Tatar');

  /// Telugu
  static const telugu = Language._('te', 'tel', 'Telugu');

  /// Timne
  static const timne = Language._('', 'tem', 'Timne');

  /// Tereno
  static const tereno = Language._('', 'ter', 'Tereno');

  /// Tetum
  static const tetum = Language._('', 'tet', 'Tetum');

  /// Tajik
  static const tajik = Language._('tg', 'tgk', 'Tajik');

  /// Tagalog
  static const tagalog = Language._('tl', 'tgl', 'Tagalog');

  /// Thai
  static const thai = Language._('th', 'tha', 'Thai');

  /// Tigre
  static const tigre = Language._('', 'tig', 'Tigre');

  /// Tigrinya
  static const tigrinya = Language._('ti', 'tir', 'Tigrinya');

  /// Tiv
  static const tiv = Language._('', 'tiv', 'Tiv');

  /// Tokelau
  static const tokelau = Language._('', 'tkl', 'Tokelau');

  /// Klingon; tlhIngan-Hol
  static const klingon = Language._('', 'tlh', 'Klingon; tlhIngan-Hol');

  /// Tlingit
  static const tlingit = Language._('', 'tli', 'Tlingit');

  /// Tamashek
  static const tamashek = Language._('', 'tmh', 'Tamashek');

  /// Tonga (Nyasa)
  static const tongaNyasa = Language._('', 'tog', 'Tonga (Nyasa)');

  /// Tonga (Tonga Islands)
  static const tongaTongaIslands = Language._('to', 'ton', 'Tonga (Tonga Islands)');

  /// Tok Pisin
  static const tokPisin = Language._('', 'tpi', 'Tok Pisin');

  /// Tsimshian
  static const tsimshian = Language._('', 'tsi', 'Tsimshian');

  /// Tswana
  static const tswana = Language._('tn', 'tsn', 'Tswana');

  /// Tsonga
  static const tsonga = Language._('ts', 'tso', 'Tsonga');

  /// Turkmen
  static const turkmen = Language._('tk', 'tuk', 'Turkmen');

  /// Tumbuka
  static const tumbuka = Language._('', 'tum', 'Tumbuka');

  /// Tupi languages
  static const tupiLanguages = Language._('', 'tup', 'Tupi languages');

  /// Turkish
  static const turkish = Language._('tr', 'tur', 'Turkish');

  /// Altaic languages
  static const altaicLanguages = Language._('', 'tut', 'Altaic languages');

  /// Tuvalu
  static const tuvalu = Language._('', 'tvl', 'Tuvalu');

  /// Twi
  static const twi = Language._('tw', 'twi', 'Twi');

  /// Tuvinian
  static const tuvinian = Language._('', 'tyv', 'Tuvinian');

  /// Udmurt
  static const udmurt = Language._('', 'udm', 'Udmurt');

  /// Ugaritic
  static const ugaritic = Language._('', 'uga', 'Ugaritic');

  /// Uighur; Uyghur
  static const uighur = Language._('ug', 'uig', 'Uighur; Uyghur');

  /// Ukrainian
  static const ukrainian = Language._('uk', 'ukr', 'Ukrainian');

  /// Umbundu
  static const umbundu = Language._('', 'umb', 'Umbundu');

  /// Undetermined
  static const undetermined = Language._('', 'und', 'Undetermined');

  /// Urdu
  static const urdu = Language._('ur', 'urd', 'Urdu');

  /// Uzbek
  static const uzbek = Language._('uz', 'uzb', 'Uzbek');

  /// Vai
  static const vai = Language._('', 'vai', 'Vai');

  /// Venda
  static const venda = Language._('ve', 'ven', 'Venda');

  /// Vietnamese
  static const vietnamese = Language._('vi', 'vie', 'Vietnamese');

  /// Volapük
  static const volapuk = Language._('vo', 'vol', 'Volapük');

  /// Votic
  static const votic = Language._('', 'vot', 'Votic');

  /// Wakashan languages
  static const wakashanLanguages = Language._('', 'wak', 'Wakashan languages');

  /// Wolaitta; Wolaytta
  static const wolaitta = Language._('', 'wal', 'Wolaitta; Wolaytta');

  /// Waray
  static const waray = Language._('', 'war', 'Waray');

  /// Washo
  static const washo = Language._('', 'was', 'Washo');

  /// Sorbian languages
  static const sorbianLanguages = Language._('', 'wen', 'Sorbian languages');

  /// Walloon
  static const walloon = Language._('wa', 'wln', 'Walloon');

  /// Wolof
  static const wolof = Language._('wo', 'wol', 'Wolof');

  /// Kalmyk; Oirat
  static const kalmyk = Language._('', 'xal', 'Kalmyk; Oirat');

  /// Xhosa
  static const xhosa = Language._('xh', 'xho', 'Xhosa');

  /// Yao
  static const yao = Language._('', 'yao', 'Yao');

  /// Yapese
  static const yapese = Language._('', 'yap', 'Yapese');

  /// Yiddish
  static const yiddish = Language._('yi', 'yid', 'Yiddish');

  /// Yoruba
  static const yoruba = Language._('yo', 'yor', 'Yoruba');

  /// Yupik languages
  static const yupikLanguages = Language._('', 'ypk', 'Yupik languages');

  /// Zapotec
  static const zapotec = Language._('', 'zap', 'Zapotec');

  /// Blissymbols; Blissymbolics; Bliss
  static const blissymbols = Language._('', 'zbl', 'Blissymbols; Blissymbolics; Bliss');

  /// Zenaga
  static const zenaga = Language._('', 'zen', 'Zenaga');

  /// Standard Moroccan Tamazight
  static const standardMoroccanTamazight = Language._('', 'zgh', 'Standard Moroccan Tamazight');

  /// Zhuang; Chuang
  static const zhuang = Language._('za', 'zha', 'Zhuang; Chuang');

  /// Zande languages
  static const zandeLanguages = Language._('', 'znd', 'Zande languages');

  /// Zulu
  static const zulu = Language._('zu', 'zul', 'Zulu');

  /// Zuni
  static const zuni = Language._('', 'zun', 'Zuni');

  /// "No linguistic content; Not applicable" according to https://www.loc.gov/standards/iso639-2/php/code_list.php
  static const zxx = Language._('', 'zxx', '"No linguistic content; Not applicable" according to https://www.loc.gov/standards/iso639-2/php/code_list.php');

  /// Zaza; Dimili; Dimli; Kirdki; Kirmanjki; Zazaki
  static const zaza = Language._('', 'zza', 'Zaza; Dimili; Dimli; Kirdki; Kirmanjki; Zazaki');

  /// Languages supported by Flex
  static const all = {
    afar,
    abkhazian,
    achinese,
    acoli,
    adangme,
    adyghe,
    afroAsiaticLanguages,
    afrihili,
    afrikaans,
    ainu,
    akan,
    akkadian,
    albanian,
    aleut,
    algonquianLanguages,
    southernAltai,
    amharic,
    englishOldCa4501100,
    angika,
    apacheLanguages,
    arabic,
    officialAramaic700300BCE,
    aragonese,
    armenian,
    mapudungun,
    arapaho,
    artificialLanguages,
    arawak,
    assamese,
    asturian,
    athapascanLanguages,
    australianLanguages,
    avaric,
    avestan,
    awadhi,
    aymara,
    azerbaijani,
    bandaLanguages,
    bamilekeLanguages,
    bashkir,
    baluchi,
    bambara,
    balinese,
    basque,
    basa,
    balticLanguages,
    beja,
    belarusian,
    bemba,
    bengali,
    berberLanguages,
    bhojpuri,
    bihariLanguages,
    bikol,
    bini,
    bislama,
    siksika,
    bantuLanguages,
    tibetan,
    bosnian,
    braj,
    breton,
    batakLanguages,
    buriat,
    buginese,
    bulgarian,
    burmese,
    blin,
    caddo,
    centralAmericanIndianLanguages,
    galibiCarib,
    catalan,
    caucasianLanguages,
    cebuano,
    celticLanguages,
    czech,
    chamorro,
    chibcha,
    chechen,
    chagatai,
    chinese,
    chuukese,
    mari,
    chinookJargon,
    choctaw,
    chipewyan,
    cherokee,
    oldSlavonic,
    chuvash,
    cheyenne,
    chamicLanguages,
    montenegrin,
    coptic,
    cornish,
    corsican,
    creolesAndPidginsEnglishBased,
    creolesAndPidginsFrenchBased,
    creolesAndPidginsPortugueseBased,
    cree,
    crimeanTatar,
    creolesAndPidgins,
    kashubian,
    cushiticLanguages,
    welsh,
    dakota,
    danish,
    dargwa,
    landDayakLanguages,
    delaware,
    slaveAthapascan,
    german,
    dogrib,
    dinka,
    divehi,
    dogri,
    dravidianLanguages,
    lowerSorbian,
    duala,
    dutchMiddleCa10501350,
    dutch,
    dyula,
    dzongkha,
    efik,
    egyptianAncient,
    ekajuk,
    greekModern1453,
    elamite,
    english,
    englishMiddle11001500,
    esperanto,
    estonian,
    ewe,
    ewondo,
    fang,
    faroese,
    persian,
    fanti,
    fijian,
    filipino,
    finnish,
    finnoUgrianLanguages,
    fon,
    french,
    frenchMiddleCa14001600,
    frenchOld842Ca1400,
    northernFrisian,
    easternFrisian,
    westernFrisian,
    fulah,
    friulian,
    ga,
    gayo,
    gbaya,
    germanicLanguages,
    georgian,
    geez,
    gilbertese,
    gaelic,
    irish,
    galician,
    manx,
    germanMiddleHighCa10501500,
    germanOldHighCa7501050,
    gondi,
    gorontalo,
    gothic,
    grebo,
    greekAncientTo1453,
    guarani,
    swissGerman,
    gujarati,
    gwichin,
    haida,
    haitian,
    hausa,
    hawaiian,
    hebrew,
    herero,
    hiligaynon,
    himachaliLanguages,
    hindi,
    hittite,
    hmong,
    hiriMotu,
    croatian,
    upperSorbian,
    hungarian,
    hupa,
    iban,
    igbo,
    icelandic,
    ido,
    sichuanYi,
    ijoLanguages,
    inuktitut,
    interlingue,
    iloko,
    interlinguaInternationalAuxiliaryLanguageAssociation,
    indicLanguages,
    indonesian,
    indoEuropeanLanguages,
    ingush,
    inupiaq,
    iranianLanguages,
    iroquoianLanguages,
    italian,
    javanese,
    lojban,
    japanese,
    judeoPersian,
    judeoArabic,
    karaKalpak,
    kabyle,
    kachin,
    kalaallisut,
    kamba,
    kannada,
    karenLanguages,
    kashmiri,
    kanuri,
    kawi,
    kazakh,
    kabardian,
    khasi,
    khoisanLanguages,
    centralKhmer,
    khotanese,
    kikuyu,
    kinyarwanda,
    kirghiz,
    kimbundu,
    konkani,
    komi,
    kongo,
    korean,
    kosraean,
    kpelle,
    karachayBalkar,
    karelian,
    kruLanguages,
    kurukh,
    kuanyama,
    kumyk,
    kurdish,
    kutenai,
    ladino,
    lahnda,
    lamba,
    lao,
    latin,
    latvian,
    lezghian,
    limburgan,
    lingala,
    lithuanian,
    mongo,
    lozi,
    luxembourgish,
    lubaLulua,
    lubaKatanga,
    ganda,
    luiseno,
    lunda,
    luoKenyaAndTanzania,
    lushai,
    macedonian,
    madurese,
    magahi,
    marshallese,
    maithili,
    makasar,
    malayalam,
    mandingo,
    maori,
    austronesianLanguages,
    marathi,
    masai,
    malay,
    moksha,
    mandar,
    mende,
    irishMiddle9001200,
    mikmaq,
    minangkabau,
    uncodedLanguages,
    monKhmerLanguages,
    malagasy,
    maltese,
    manchu,
    manipuri,
    manoboLanguages,
    mohawk,
    mongolian,
    mossi,
    multipleLanguages,
    mundaLanguages,
    creek,
    mirandese,
    marwari,
    mayanLanguages,
    erzya,
    nahuatlLanguages,
    northAmericanIndianLanguages,
    neapolitan,
    nauru,
    navajo,
    ndebeleSouth,
    ndebeleNorth,
    ndonga,
    lowGerman,
    nepali,
    nepalBhasa,
    nias,
    nigerKordofanianLanguages,
    niuean,
    norwegianNynorsk,
    bokmalNorwegian,
    nogai,
    norseOld,
    norwegian,
    nKo,
    pedi,
    nubianLanguages,
    classicalNewari,
    chichewa,
    nyamwezi,
    nyankole,
    nyoro,
    nzima,
    occitanPost1500,
    ojibwa,
    oriya,
    oromo,
    osage,
    ossetian,
    turkishOttoman15001928,
    otomianLanguages,
    papuanLanguages,
    pangasinan,
    pahlavi,
    pampanga,
    panjabi,
    papiamento,
    palauan,
    persianOldCa600400BC,
    philippineLanguages,
    phoenician,
    pali,
    polish,
    pohnpeian,
    portuguese,
    prakritLanguages,
    provencalOldTo1500,
    pushto,
    qaaqtz,
    quechua,
    rajasthani,
    rapanui,
    rarotongan,
    romanceLanguages,
    romansh,
    romany,
    romanian,
    rundi,
    aromanian,
    russian,
    sandawe,
    sango,
    yakut,
    southAmericanIndianLanguages,
    salishanLanguages,
    samaritanAramaic,
    sanskrit,
    sasak,
    santali,
    sicilian,
    scots,
    selkup,
    semiticLanguages,
    irishOldTo900,
    signLanguages,
    shan,
    sidamo,
    sinhala,
    siouanLanguages,
    sinoTibetanLanguages,
    slavicLanguages,
    slovak,
    slovenian,
    southernSami,
    northernSami,
    samiLanguages,
    luleSami,
    inariSami,
    samoan,
    skoltSami,
    shona,
    sindhi,
    soninke,
    sogdian,
    somali,
    songhaiLanguages,
    sothoSouthern,
    spanish,
    sardinian,
    srananTongo,
    serbian,
    serer,
    niloSaharanLanguages,
    swati,
    sukuma,
    sundanese,
    susu,
    sumerian,
    swahili,
    swedish,
    classicalSyriac,
    syriac,
    tahitian,
    taiLanguages,
    tamil,
    tatar,
    telugu,
    timne,
    tereno,
    tetum,
    tajik,
    tagalog,
    thai,
    tigre,
    tigrinya,
    tiv,
    tokelau,
    klingon,
    tlingit,
    tamashek,
    tongaNyasa,
    tongaTongaIslands,
    tokPisin,
    tsimshian,
    tswana,
    tsonga,
    turkmen,
    tumbuka,
    tupiLanguages,
    turkish,
    altaicLanguages,
    tuvalu,
    twi,
    tuvinian,
    udmurt,
    ugaritic,
    uighur,
    ukrainian,
    umbundu,
    undetermined,
    urdu,
    uzbek,
    vai,
    venda,
    vietnamese,
    volapuk,
    votic,
    wakashanLanguages,
    wolaitta,
    waray,
    washo,
    sorbianLanguages,
    walloon,
    wolof,
    kalmyk,
    xhosa,
    yao,
    yapese,
    yiddish,
    yoruba,
    yupikLanguages,
    zapotec,
    blissymbols,
    zenaga,
    standardMoroccanTamazight,
    zhuang,
    zandeLanguages,
    zulu,
    zuni,
    zxx,
    zaza,
  };
}

/// A representation of a country
class Country {
  const Country._(this.alpha2, this.alpha3, this.numeric, this.ccTLD, this.independent, this.label);

  /// The ISO 3166-1 two letter representation of this country.
  @Deprecated('Prefer [alpha2]')
  String get code => alpha2;

  /// The ISO 3166-1 two letter representation of this country.
  final String alpha2;

  /// The ISO 3166-1 three letter representation of this country.
  final String alpha3;

  /// The ISO 3166-1 numeric representation of this country.
  final int numeric;

  /// The name of this country (in English).
  final String label;

  /// The country code top level domain of this country (excluding '.')
  final String ccTLD;

  /// Whether this is an independent country
  final bool independent;

  /// Afghanistan
  static const afghanistan = Country._('AF', 'AFG', 4, 'af', true, 'Afghanistan');

  /// Åland Islands
  static const alandIslands = Country._('AX', 'ALA', 248, 'ax', false, 'Åland Islands');

  /// Albania
  static const albania = Country._('AL', 'ALB', 8, 'al', true, 'Albania');

  /// Algeria
  static const algeria = Country._('DZ', 'DZA', 12, 'dz', true, 'Algeria');

  /// American Samoa
  static const americanSamoa = Country._('AS', 'ASM', 16, 'as', false, 'American Samoa');

  /// Andorra
  static const andorra = Country._('AD', 'AND', 20, 'ad', true, 'Andorra');

  /// Angola
  static const angola = Country._('AO', 'AGO', 24, 'ao', true, 'Angola');

  /// Anguilla
  static const anguilla = Country._('AI', 'AIA', 660, 'ai', false, 'Anguilla');

  /// Antarctica
  static const antarctica = Country._('AQ', 'ATA', 10, 'aq', false, 'Antarctica');

  /// Antigua and Barbuda
  static const antiguaAndBarbuda = Country._('AG', 'ATG', 28, 'ag', true, 'Antigua and Barbuda');

  /// Argentina
  static const argentina = Country._('AR', 'ARG', 32, 'ar', true, 'Argentina');

  /// Armenia
  static const armenia = Country._('AM', 'ARM', 51, 'am', true, 'Armenia');

  /// Aruba
  static const aruba = Country._('AW', 'ABW', 533, 'aw', false, 'Aruba');

  /// Australia
  static const australia = Country._('AU', 'AUS', 36, 'au', true, 'Australia');

  /// Austria
  static const austria = Country._('AT', 'AUT', 40, 'at', true, 'Austria');

  /// Azerbaijan
  static const azerbaijan = Country._('AZ', 'AZE', 31, 'az', true, 'Azerbaijan');

  /// Bahamas
  static const bahamas = Country._('BS', 'BHS', 44, 'bs', true, 'Bahamas');

  /// Bahrain
  static const bahrain = Country._('BH', 'BHR', 48, 'bh', true, 'Bahrain');

  /// Bangladesh
  static const bangladesh = Country._('BD', 'BGD', 50, 'bd', true, 'Bangladesh');

  /// Barbados
  static const barbados = Country._('BB', 'BRB', 52, 'bb', true, 'Barbados');

  /// Belarus
  static const belarus = Country._('BY', 'BLR', 112, 'by', true, 'Belarus');

  /// Belgium
  static const belgium = Country._('BE', 'BEL', 56, 'be', true, 'Belgium');

  /// Belize
  static const belize = Country._('BZ', 'BLZ', 84, 'bz', true, 'Belize');

  /// Benin
  static const benin = Country._('BJ', 'BEN', 204, 'bj', true, 'Benin');

  /// Bermuda
  static const bermuda = Country._('BM', 'BMU', 60, 'bm', false, 'Bermuda');

  /// Bhutan
  static const bhutan = Country._('BT', 'BTN', 64, 'bt', true, 'Bhutan');

  /// Plurinational State of Bolivia
  static const plurinationalStateOfBolivia = Country._('BO', 'BOL', 68, 'bo', true, 'Plurinational State of Bolivia');

  /// Bonaire, Sint Eustatius and Saba
  static const bonaireSintEustatiusAndSaba = Country._('BQ', 'BES', 535, 'bq', false, 'Bonaire, Sint Eustatius and Saba');

  /// Bosnia and Herzegovina
  static const bosniaAndHerzegovina = Country._('BA', 'BIH', 70, 'ba', true, 'Bosnia and Herzegovina');

  /// Botswana
  static const botswana = Country._('BW', 'BWA', 72, 'bw', true, 'Botswana');

  /// Bouvet Island
  static const bouvetIsland = Country._('BV', 'BVT', 74, 'bv', false, 'Bouvet Island');

  /// Brazil
  static const brazil = Country._('BR', 'BRA', 76, 'br', true, 'Brazil');

  /// British Indian Ocean Territory
  static const britishIndianOceanTerritory = Country._('IO', 'IOT', 86, 'io', false, 'British Indian Ocean Territory');

  /// Brunei Darussalam
  static const bruneiDarussalam = Country._('BN', 'BRN', 96, 'bn', true, 'Brunei Darussalam');

  /// Bulgaria
  static const bulgaria = Country._('BG', 'BGR', 100, 'bg', true, 'Bulgaria');

  /// Burkina Faso
  static const burkinaFaso = Country._('BF', 'BFA', 854, 'bf', true, 'Burkina Faso');

  /// Burundi
  static const burundi = Country._('BI', 'BDI', 108, 'bi', true, 'Burundi');

  /// Cabo Verde
  static const caboVerde = Country._('CV', 'CPV', 132, 'cv', true, 'Cabo Verde');

  /// Cambodia
  static const cambodia = Country._('KH', 'KHM', 116, 'kh', true, 'Cambodia');

  /// Cameroon
  static const cameroon = Country._('CM', 'CMR', 120, 'cm', true, 'Cameroon');

  /// Canada
  static const canada = Country._('CA', 'CAN', 124, 'ca', true, 'Canada');

  /// Cayman Islands
  static const caymanIslands = Country._('KY', 'CYM', 136, 'ky', false, 'Cayman Islands');

  /// Central African Republic
  static const centralAfricanRepublic = Country._('CF', 'CAF', 140, 'cf', true, 'Central African Republic');

  /// Chad
  static const chad = Country._('TD', 'TCD', 148, 'td', true, 'Chad');

  /// Chile
  static const chile = Country._('CL', 'CHL', 152, 'cl', true, 'Chile');

  /// China
  static const china = Country._('CN', 'CHN', 156, 'cn', true, 'China');

  /// Christmas Island
  static const christmasIsland = Country._('CX', 'CXR', 162, 'cx', false, 'Christmas Island');

  /// Cocos Islands
  static const cocosIslands = Country._('CC', 'CCK', 166, 'cc', false, 'Cocos Islands');

  /// Colombia
  static const colombia = Country._('CO', 'COL', 170, 'co', true, 'Colombia');

  /// Comoros
  static const comoros = Country._('KM', 'COM', 174, 'km', true, 'Comoros');

  /// Congo
  static const congo = Country._('CG', 'COG', 178, 'cg', true, 'Congo');

  /// Democratic Republic of the Congo
  static const democraticRepublicOfTheCongo = Country._('CD', 'COD', 180, 'cd', true, 'Democratic Republic of the Congo');

  /// Cook Islands
  static const cookIslands = Country._('CK', 'COK', 184, 'ck', false, 'Cook Islands');

  /// Costa Rica
  static const costaRica = Country._('CR', 'CRI', 188, 'cr', true, 'Costa Rica');

  /// Côte d'Ivoire
  static const coteDIvoire = Country._('CI', 'CIV', 384, 'ci', true, 'Côte d\'Ivoire');

  /// Croatia
  static const croatia = Country._('HR', 'HRV', 191, 'hr', true, 'Croatia');

  /// Cuba
  static const cuba = Country._('CU', 'CUB', 192, 'cu', true, 'Cuba');

  /// Curaçao
  static const curacao = Country._('CW', 'CUW', 531, 'cw', false, 'Curaçao');

  /// Cyprus
  static const cyprus = Country._('CY', 'CYP', 196, 'cy', true, 'Cyprus');

  /// Czechia
  static const czechia = Country._('CZ', 'CZE', 203, 'cz', true, 'Czechia');

  /// Denmark
  static const denmark = Country._('DK', 'DNK', 208, 'dk', true, 'Denmark');

  /// Djibouti
  static const djibouti = Country._('DJ', 'DJI', 262, 'dj', true, 'Djibouti');

  /// Dominica
  static const dominica = Country._('DM', 'DMA', 212, 'dm', true, 'Dominica');

  /// Dominican Republic
  static const dominicanRepublic = Country._('DO', 'DOM', 214, 'do', true, 'Dominican Republic');

  /// Ecuador
  static const ecuador = Country._('EC', 'ECU', 218, 'ec', true, 'Ecuador');

  /// Egypt
  static const egypt = Country._('EG', 'EGY', 818, 'eg', true, 'Egypt');

  /// El Salvador
  static const elSalvador = Country._('SV', 'SLV', 222, 'sv', true, 'El Salvador');

  /// Equatorial Guinea
  static const equatorialGuinea = Country._('GQ', 'GNQ', 226, 'gq', true, 'Equatorial Guinea');

  /// Eritrea
  static const eritrea = Country._('ER', 'ERI', 232, 'er', true, 'Eritrea');

  /// Estonia
  static const estonia = Country._('EE', 'EST', 233, 'ee', true, 'Estonia');

  /// Eswatini
  static const eswatini = Country._('SZ', 'SWZ', 748, 'sz', true, 'Eswatini');

  /// Ethiopia
  static const ethiopia = Country._('ET', 'ETH', 231, 'et', true, 'Ethiopia');

  /// Falkland Islands
  static const falklandIslands = Country._('FK', 'FLK', 238, 'fk', false, 'Falkland Islands');

  /// Faroe Islands
  static const faroeIslands = Country._('FO', 'FRO', 234, 'fo', false, 'Faroe Islands');

  /// Fiji
  static const fiji = Country._('FJ', 'FJI', 242, 'fj', true, 'Fiji');

  /// Finland
  static const finland = Country._('FI', 'FIN', 246, 'fi', true, 'Finland');

  /// France
  static const france = Country._('FR', 'FRA', 250, 'fr', true, 'France');

  /// French Guiana
  static const frenchGuiana = Country._('GF', 'GUF', 254, 'gf', false, 'French Guiana');

  /// French Polynesia
  static const frenchPolynesia = Country._('PF', 'PYF', 258, 'pf', false, 'French Polynesia');

  /// French Southern Territories
  static const frenchSouthernTerritories = Country._('TF', 'ATF', 260, 'tf', false, 'French Southern Territories');

  /// Gabon
  static const gabon = Country._('GA', 'GAB', 266, 'ga', true, 'Gabon');

  /// Gambia
  static const gambia = Country._('GM', 'GMB', 270, 'gm', true, 'Gambia');

  /// Georgia
  static const georgia = Country._('GE', 'GEO', 268, 'ge', true, 'Georgia');

  /// Germany
  static const germany = Country._('DE', 'DEU', 276, 'de', true, 'Germany');

  /// Ghana
  static const ghana = Country._('GH', 'GHA', 288, 'gh', true, 'Ghana');

  /// Gibraltar
  static const gibraltar = Country._('GI', 'GIB', 292, 'gi', false, 'Gibraltar');

  /// Greece
  static const greece = Country._('GR', 'GRC', 300, 'gr', true, 'Greece');

  /// Greenland
  static const greenland = Country._('GL', 'GRL', 304, 'gl', false, 'Greenland');

  /// Grenada
  static const grenada = Country._('GD', 'GRD', 308, 'gd', true, 'Grenada');

  /// Guadeloupe
  static const guadeloupe = Country._('GP', 'GLP', 312, 'gp', false, 'Guadeloupe');

  /// Guam
  static const guam = Country._('GU', 'GUM', 316, 'gu', false, 'Guam');

  /// Guatemala
  static const guatemala = Country._('GT', 'GTM', 320, 'gt', true, 'Guatemala');

  /// Guernsey
  static const guernsey = Country._('GG', 'GGY', 831, 'gg', false, 'Guernsey');

  /// Guinea
  static const guinea = Country._('GN', 'GIN', 324, 'gn', true, 'Guinea');

  /// Guinea-Bissau
  static const guineaBissau = Country._('GW', 'GNB', 624, 'gw', true, 'Guinea-Bissau');

  /// Guyana
  static const guyana = Country._('GY', 'GUY', 328, 'gy', true, 'Guyana');

  /// Haiti
  static const haiti = Country._('HT', 'HTI', 332, 'ht', true, 'Haiti');

  /// Heard Island and McDonald Islands
  static const heardIslandAndMcDonaldIslands = Country._('HM', 'HMD', 334, 'hm', false, 'Heard Island and McDonald Islands');

  /// Holy See
  static const holySee = Country._('VA', 'VAT', 336, 'va', true, 'Holy See');

  /// Honduras
  static const honduras = Country._('HN', 'HND', 340, 'hn', true, 'Honduras');

  /// Hong Kong
  static const hongKong = Country._('HK', 'HKG', 344, 'hk', false, 'Hong Kong');

  /// Hungary
  static const hungary = Country._('HU', 'HUN', 348, 'hu', true, 'Hungary');

  /// Iceland
  static const iceland = Country._('IS', 'ISL', 352, 'is', true, 'Iceland');

  /// India
  static const india = Country._('IN', 'IND', 356, 'in', true, 'India');

  /// Indonesia
  static const indonesia = Country._('ID', 'IDN', 360, 'id', true, 'Indonesia');

  /// Iran
  static const iran = Country._('IR', 'IRN', 364, 'ir', true, 'Iran');

  /// Iraq
  static const iraq = Country._('IQ', 'IRQ', 368, 'iq', true, 'Iraq');

  /// Ireland
  static const ireland = Country._('IE', 'IRL', 372, 'ie', true, 'Ireland');

  /// Isle of Man
  static const isleOfMan = Country._('IM', 'IMN', 833, 'im', false, 'Isle of Man');

  /// Israel
  static const israel = Country._('IL', 'ISR', 376, 'il', true, 'Israel');

  /// Italy
  static const italy = Country._('IT', 'ITA', 380, 'it', true, 'Italy');

  /// Jamaica
  static const jamaica = Country._('JM', 'JAM', 388, 'jm', true, 'Jamaica');

  /// Japan
  static const japan = Country._('JP', 'JPN', 392, 'jp', true, 'Japan');

  /// Jersey
  static const jersey = Country._('JE', 'JEY', 832, 'je', false, 'Jersey');

  /// Jordan
  static const jordan = Country._('JO', 'JOR', 400, 'jo', true, 'Jordan');

  /// Kazakhstan
  static const kazakhstan = Country._('KZ', 'KAZ', 398, 'kz', true, 'Kazakhstan');

  /// Kenya
  static const kenya = Country._('KE', 'KEN', 404, 'ke', true, 'Kenya');

  /// Kiribati
  static const kiribati = Country._('KI', 'KIR', 296, 'ki', true, 'Kiribati');

  /// Democratic People's Republic of Korea (North Korea)
  static const democraticPeoplesRepublicOfKoreaNorthKorea = Country._('KP', 'PRK', 408, 'kp', true, 'Democratic People\'s Republic of Korea (North Korea)');

  /// Republic of Korea (South Korea)
  static const republicOfKoreaSouthKorea = Country._('KR', 'KOR', 410, 'kr', true, 'Republic of Korea (South Korea)');

  /// Kuwait
  static const kuwait = Country._('KW', 'KWT', 414, 'kw', true, 'Kuwait');

  /// Kyrgyzstan
  static const kyrgyzstan = Country._('KG', 'KGZ', 417, 'kg', true, 'Kyrgyzstan');

  /// Lao People's Democratic Republic
  static const laoPeoplesDemocraticRepublic = Country._('LA', 'LAO', 418, 'la', true, 'Lao People\'s Democratic Republic');

  /// Latvia
  static const latvia = Country._('LV', 'LVA', 428, 'lv', true, 'Latvia');

  /// Lebanon
  static const lebanon = Country._('LB', 'LBN', 422, 'lb', true, 'Lebanon');

  /// Lesotho
  static const lesotho = Country._('LS', 'LSO', 426, 'ls', true, 'Lesotho');

  /// Liberia
  static const liberia = Country._('LR', 'LBR', 430, 'lr', true, 'Liberia');

  /// Libya
  static const libya = Country._('LY', 'LBY', 434, 'ly', true, 'Libya');

  /// Liechtenstein
  static const liechtenstein = Country._('LI', 'LIE', 438, 'li', true, 'Liechtenstein');

  /// Lithuania
  static const lithuania = Country._('LT', 'LTU', 440, 'lt', true, 'Lithuania');

  /// Luxembourg
  static const luxembourg = Country._('LU', 'LUX', 442, 'lu', true, 'Luxembourg');

  /// Macao
  static const macao = Country._('MO', 'MAC', 446, 'mo', false, 'Macao');

  /// Madagascar
  static const madagascar = Country._('MG', 'MDG', 450, 'mg', true, 'Madagascar');

  /// Malawi
  static const malawi = Country._('MW', 'MWI', 454, 'mw', true, 'Malawi');

  /// Malaysia
  static const malaysia = Country._('MY', 'MYS', 458, 'my', true, 'Malaysia');

  /// Maldives
  static const maldives = Country._('MV', 'MDV', 462, 'mv', true, 'Maldives');

  /// Mali
  static const mali = Country._('ML', 'MLI', 466, 'ml', true, 'Mali');

  /// Malta
  static const malta = Country._('MT', 'MLT', 470, 'mt', true, 'Malta');

  /// Marshall Islands
  static const marshallIslands = Country._('MH', 'MHL', 584, 'mh', true, 'Marshall Islands');

  /// Martinique
  static const martinique = Country._('MQ', 'MTQ', 474, 'mq', false, 'Martinique');

  /// Mauritania
  static const mauritania = Country._('MR', 'MRT', 478, 'mr', true, 'Mauritania');

  /// Mauritius
  static const mauritius = Country._('MU', 'MUS', 480, 'mu', true, 'Mauritius');

  /// Mayotte
  static const mayotte = Country._('YT', 'MYT', 175, 'yt', false, 'Mayotte');

  /// Mexico
  static const mexico = Country._('MX', 'MEX', 484, 'mx', true, 'Mexico');

  /// Federated States of Micronesia
  static const federatedStatesOfMicronesia = Country._('FM', 'FSM', 583, 'fm', true, 'Federated States of Micronesia');

  /// Republic of Moldova
  static const republicOfMoldova = Country._('MD', 'MDA', 498, 'md', true, 'Republic of Moldova');

  /// Monaco
  static const monaco = Country._('MC', 'MCO', 492, 'mc', true, 'Monaco');

  /// Mongolia
  static const mongolia = Country._('MN', 'MNG', 496, 'mn', true, 'Mongolia');

  /// Montenegro
  static const montenegro = Country._('ME', 'MNE', 499, 'me', true, 'Montenegro');

  /// Montserrat
  static const montserrat = Country._('MS', 'MSR', 500, 'ms', false, 'Montserrat');

  /// Morocco
  static const morocco = Country._('MA', 'MAR', 504, 'ma', true, 'Morocco');

  /// Mozambique
  static const mozambique = Country._('MZ', 'MOZ', 508, 'mz', true, 'Mozambique');

  /// Myanmar
  static const myanmar = Country._('MM', 'MMR', 104, 'mm', true, 'Myanmar');

  /// Namibia
  static const namibia = Country._('NA', 'NAM', 516, 'na', true, 'Namibia');

  /// Nauru
  static const nauru = Country._('NR', 'NRU', 520, 'nr', true, 'Nauru');

  /// Nepal
  static const nepal = Country._('NP', 'NPL', 524, 'np', true, 'Nepal');

  /// Netherlands
  static const netherlands = Country._('NL', 'NLD', 528, 'nl', true, 'Netherlands');

  /// New Caledonia
  static const newCaledonia = Country._('NC', 'NCL', 540, 'nc', false, 'New Caledonia');

  /// New Zealand
  static const newZealand = Country._('NZ', 'NZL', 554, 'nz', true, 'New Zealand');

  /// Nicaragua
  static const nicaragua = Country._('NI', 'NIC', 558, 'ni', true, 'Nicaragua');

  /// Niger
  static const niger = Country._('NE', 'NER', 562, 'ne', true, 'Niger');

  /// Nigeria
  static const nigeria = Country._('NG', 'NGA', 566, 'ng', true, 'Nigeria');

  /// Niue
  static const niue = Country._('NU', 'NIU', 570, 'nu', false, 'Niue');

  /// Norfolk Island
  static const norfolkIsland = Country._('NF', 'NFK', 574, 'nf', false, 'Norfolk Island');

  /// North Macedonia
  static const northMacedonia = Country._('MK', 'MKD', 807, 'mk', true, 'North Macedonia');

  /// Northern Mariana Islands
  static const northernMarianaIslands = Country._('MP', 'MNP', 580, 'mp', false, 'Northern Mariana Islands');

  /// Norway
  static const norway = Country._('NO', 'NOR', 578, 'no', true, 'Norway');

  /// Oman
  static const oman = Country._('OM', 'OMN', 512, 'om', true, 'Oman');

  /// Pakistan
  static const pakistan = Country._('PK', 'PAK', 586, 'pk', true, 'Pakistan');

  /// Palau
  static const palau = Country._('PW', 'PLW', 585, 'pw', true, 'Palau');

  /// State of Palestine
  static const stateOfPalestine = Country._('PS', 'PSE', 275, 'ps', false, 'State of Palestine');

  /// Panama
  static const panama = Country._('PA', 'PAN', 591, 'pa', true, 'Panama');

  /// Papua New Guinea
  static const papuaNewGuinea = Country._('PG', 'PNG', 598, 'pg', true, 'Papua New Guinea');

  /// Paraguay
  static const paraguay = Country._('PY', 'PRY', 600, 'py', true, 'Paraguay');

  /// Peru
  static const peru = Country._('PE', 'PER', 604, 'pe', true, 'Peru');

  /// Philippines
  static const philippines = Country._('PH', 'PHL', 608, 'ph', true, 'Philippines');

  /// Pitcairn
  static const pitcairn = Country._('PN', 'PCN', 612, 'pn', false, 'Pitcairn');

  /// Poland
  static const poland = Country._('PL', 'POL', 616, 'pl', true, 'Poland');

  /// Portugal
  static const portugal = Country._('PT', 'PRT', 620, 'pt', true, 'Portugal');

  /// Puerto Rico
  static const puertoRico = Country._('PR', 'PRI', 630, 'pr', false, 'Puerto Rico');

  /// Qatar
  static const qatar = Country._('QA', 'QAT', 634, 'qa', true, 'Qatar');

  /// Réunion
  static const reunion = Country._('RE', 'REU', 638, 're', false, 'Réunion');

  /// Romania
  static const romania = Country._('RO', 'ROU', 642, 'ro', true, 'Romania');

  /// Russian Federation
  static const russianFederation = Country._('RU', 'RUS', 643, 'ru', true, 'Russian Federation');

  /// Rwanda
  static const rwanda = Country._('RW', 'RWA', 646, 'rw', true, 'Rwanda');

  /// Saint Barthélemy
  static const saintBarthelemy = Country._('BL', 'BLM', 652, 'bl', false, 'Saint Barthélemy');

  /// Saint Helena, Ascension and Tristan da Cunha
  static const saintHelenaAscensionAndTristanDaCunha = Country._('SH', 'SHN', 654, 'sh', false, 'Saint Helena, Ascension and Tristan da Cunha');

  /// Saint Kitts and Nevis
  static const saintKittsAndNevis = Country._('KN', 'KNA', 659, 'kn', true, 'Saint Kitts and Nevis');

  /// Saint Lucia
  static const saintLucia = Country._('LC', 'LCA', 662, 'lc', true, 'Saint Lucia');

  /// The Collectivity of Saint Martin
  static const theCollectivityOfSaintMartin = Country._('MF', 'MAF', 663, 'mf', false, 'The Collectivity of Saint Martin');

  /// Saint Pierre and Miquelon
  static const saintPierreAndMiquelon = Country._('PM', 'SPM', 666, 'pm', false, 'Saint Pierre and Miquelon');

  /// Saint Vincent and the Grenadines
  static const saintVincentAndTheGrenadines = Country._('VC', 'VCT', 670, 'vc', true, 'Saint Vincent and the Grenadines');

  /// Samoa
  static const samoa = Country._('WS', 'WSM', 882, 'ws', true, 'Samoa');

  /// San Marino
  static const sanMarino = Country._('SM', 'SMR', 674, 'sm', true, 'San Marino');

  /// Sao Tome and Principe
  static const saoTomeAndPrincipe = Country._('ST', 'STP', 678, 'st', true, 'Sao Tome and Principe');

  /// Saudi Arabia
  static const saudiArabia = Country._('SA', 'SAU', 682, 'sa', true, 'Saudi Arabia');

  /// Senegal
  static const senegal = Country._('SN', 'SEN', 686, 'sn', true, 'Senegal');

  /// Serbia
  static const serbia = Country._('RS', 'SRB', 688, 'rs', true, 'Serbia');

  /// Seychelles
  static const seychelles = Country._('SC', 'SYC', 690, 'sc', true, 'Seychelles');

  /// Sierra Leone
  static const sierraLeone = Country._('SL', 'SLE', 694, 'sl', true, 'Sierra Leone');

  /// Singapore
  static const singapore = Country._('SG', 'SGP', 702, 'sg', true, 'Singapore');

  /// Sint Maarten
  static const sintMaarten = Country._('SX', 'SXM', 534, 'sx', false, 'Sint Maarten');

  /// Slovakia
  static const slovakia = Country._('SK', 'SVK', 703, 'sk', true, 'Slovakia');

  /// Slovenia
  static const slovenia = Country._('SI', 'SVN', 705, 'si', true, 'Slovenia');

  /// Solomon Islands
  static const solomonIslands = Country._('SB', 'SLB', 90, 'sb', true, 'Solomon Islands');

  /// Somalia
  static const somalia = Country._('SO', 'SOM', 706, 'so', true, 'Somalia');

  /// South Africa
  static const southAfrica = Country._('ZA', 'ZAF', 710, 'za', true, 'South Africa');

  /// South Georgia and the South Sandwich Islands
  static const southGeorgiaAndTheSouthSandwichIslands = Country._('GS', 'SGS', 239, 'gs', false, 'South Georgia and the South Sandwich Islands');

  /// South Sudan
  static const southSudan = Country._('SS', 'SSD', 728, 'ss', true, 'South Sudan');

  /// Spain
  static const spain = Country._('ES', 'ESP', 724, 'es', true, 'Spain');

  /// Sri Lanka
  static const sriLanka = Country._('LK', 'LKA', 144, 'lk', true, 'Sri Lanka');

  /// Sudan
  static const sudan = Country._('SD', 'SDN', 729, 'sd', true, 'Sudan');

  /// Suriname
  static const suriname = Country._('SR', 'SUR', 740, 'sr', true, 'Suriname');

  /// Svalbard and Jan Mayen
  static const svalbardAndJanMayen = Country._('SJ', 'SJM', 744, 'sj', false, 'Svalbard and Jan Mayen');

  /// Sweden
  static const sweden = Country._('SE', 'SWE', 752, 'se', true, 'Sweden');

  /// Switzerland
  static const switzerland = Country._('CH', 'CHE', 756, 'ch', true, 'Switzerland');

  /// Syrian Arab Republic
  static const syrianArabRepublic = Country._('SY', 'SYR', 760, 'sy', true, 'Syrian Arab Republic');

  /// Taiwan
  static const taiwan = Country._('TW', 'TWN', 158, 'tw', false, 'Taiwan');

  /// Tajikistan
  static const tajikistan = Country._('TJ', 'TJK', 762, 'tj', true, 'Tajikistan');

  /// United Republic of Tanzania
  static const unitedRepublicOfTanzania = Country._('TZ', 'TZA', 834, 'tz', true, 'United Republic of Tanzania');

  /// Thailand
  static const thailand = Country._('TH', 'THA', 764, 'th', true, 'Thailand');

  /// Timor-Leste
  static const timorLeste = Country._('TL', 'TLS', 626, 'tl', true, 'Timor-Leste');

  /// Togo
  static const togo = Country._('TG', 'TGO', 768, 'tg', true, 'Togo');

  /// Tokelau
  static const tokelau = Country._('TK', 'TKL', 772, 'tk', false, 'Tokelau');

  /// Tonga
  static const tonga = Country._('TO', 'TON', 776, 'to', true, 'Tonga');

  /// Trinidad and Tobago
  static const trinidadAndTobago = Country._('TT', 'TTO', 780, 'tt', true, 'Trinidad and Tobago');

  /// Tunisia
  static const tunisia = Country._('TN', 'TUN', 788, 'tn', true, 'Tunisia');

  /// Turkey
  static const turkey = Country._('TR', 'TUR', 792, 'tr', true, 'Turkey');

  /// Turkmenistan
  static const turkmenistan = Country._('TM', 'TKM', 795, 'tm', true, 'Turkmenistan');

  /// Turks and Caicos Islands
  static const turksAndCaicosIslands = Country._('TC', 'TCA', 796, 'tc', false, 'Turks and Caicos Islands');

  /// Tuvalu
  static const tuvalu = Country._('TV', 'TUV', 798, 'tv', true, 'Tuvalu');

  /// Uganda
  static const uganda = Country._('UG', 'UGA', 800, 'ug', true, 'Uganda');

  /// Ukraine
  static const ukraine = Country._('UA', 'UKR', 804, 'ua', true, 'Ukraine');

  /// United Arab Emirates
  static const unitedArabEmirates = Country._('AE', 'ARE', 784, 'ae', true, 'United Arab Emirates');

  /// United Kingdom
  static const unitedKingdom = Country._('GB', 'GBR', 826, 'uk', true, 'United Kingdom');

  /// United States of America
  static const unitedStates = Country._('US', 'USA', 840, 'us', true, 'United States of America');

  /// United States Minor Outlying Islands
  static const unitedStatesMinorOutlyingIslands = Country._('UM', 'UMI', 581, null, false, 'United States Minor Outlying Islands');

  /// Uruguay
  static const uruguay = Country._('UY', 'URY', 858, 'uy', true, 'Uruguay');

  /// Uzbekistan
  static const uzbekistan = Country._('UZ', 'UZB', 860, 'uz', true, 'Uzbekistan');

  /// Vanuatu
  static const vanuatu = Country._('VU', 'VUT', 548, 'vu', true, 'Vanuatu');

  /// Bolivarian Republic of Venezuela
  static const bolivarianRepublicOfVenezuela = Country._('VE', 'VEN', 862, 've', true, 'Bolivarian Republic of Venezuela');

  /// Vietnam
  static const vietnam = Country._('VN', 'VNM', 704, 'vn', true, 'Vietnam');

  /// Virgin Islands (British)
  static const virginIslandsBritish = Country._('VG', 'VGB', 92, 'vg', false, 'Virgin Islands (British)');

  /// Virgin Islands (U.S.)
  static const virginIslandsUS = Country._('VI', 'VIR', 850, 'vi', false, 'Virgin Islands (U.S.)');

  /// Wallis and Futuna
  static const wallisAndFutuna = Country._('WF', 'WLF', 876, 'wf', false, 'Wallis and Futuna');

  /// Western Sahara
  static const westernSahara = Country._('EH', 'ESH', 732, null, false, 'Western Sahara');

  /// Yemen
  static const yemen = Country._('YE', 'YEM', 887, 'ye', true, 'Yemen');

  /// Zambia
  static const zambia = Country._('ZM', 'ZMB', 894, 'zm', true, 'Zambia');

  /// Zimbabwe
  static const zimbabwe = Country._('ZW', 'ZWE', 716, 'zw', true, 'Zimbabwe');

  /// World (Unofficial)
  static const world = Country._('1', '1', 1, 'com', false, 'World (Unofficial)');

  /// Countries supported by Flex
  static const all = [
    afghanistan,
    alandIslands,
    albania,
    algeria,
    americanSamoa,
    andorra,
    angola,
    anguilla,
    antarctica,
    antiguaAndBarbuda,
    argentina,
    armenia,
    aruba,
    australia,
    austria,
    azerbaijan,
    bahamas,
    bahrain,
    bangladesh,
    barbados,
    belarus,
    belgium,
    belize,
    benin,
    bermuda,
    bhutan,
    plurinationalStateOfBolivia,
    bonaireSintEustatiusAndSaba,
    bosniaAndHerzegovina,
    botswana,
    bouvetIsland,
    brazil,
    britishIndianOceanTerritory,
    bruneiDarussalam,
    bulgaria,
    burkinaFaso,
    burundi,
    caboVerde,
    cambodia,
    cameroon,
    canada,
    caymanIslands,
    centralAfricanRepublic,
    chad,
    chile,
    china,
    christmasIsland,
    cocosIslands,
    colombia,
    comoros,
    congo,
    democraticRepublicOfTheCongo,
    cookIslands,
    costaRica,
    coteDIvoire,
    croatia,
    cuba,
    curacao,
    cyprus,
    czechia,
    denmark,
    djibouti,
    dominica,
    dominicanRepublic,
    ecuador,
    egypt,
    elSalvador,
    equatorialGuinea,
    eritrea,
    estonia,
    eswatini,
    ethiopia,
    falklandIslands,
    faroeIslands,
    fiji,
    finland,
    france,
    frenchGuiana,
    frenchPolynesia,
    frenchSouthernTerritories,
    gabon,
    gambia,
    georgia,
    germany,
    ghana,
    gibraltar,
    greece,
    greenland,
    grenada,
    guadeloupe,
    guam,
    guatemala,
    guernsey,
    guinea,
    guineaBissau,
    guyana,
    haiti,
    heardIslandAndMcDonaldIslands,
    holySee,
    honduras,
    hongKong,
    hungary,
    iceland,
    india,
    indonesia,
    iran,
    iraq,
    ireland,
    isleOfMan,
    israel,
    italy,
    jamaica,
    japan,
    jersey,
    jordan,
    kazakhstan,
    kenya,
    kiribati,
    democraticPeoplesRepublicOfKoreaNorthKorea,
    republicOfKoreaSouthKorea,
    kuwait,
    kyrgyzstan,
    laoPeoplesDemocraticRepublic,
    latvia,
    lebanon,
    lesotho,
    liberia,
    libya,
    liechtenstein,
    lithuania,
    luxembourg,
    macao,
    madagascar,
    malawi,
    malaysia,
    maldives,
    mali,
    malta,
    marshallIslands,
    martinique,
    mauritania,
    mauritius,
    mayotte,
    mexico,
    federatedStatesOfMicronesia,
    republicOfMoldova,
    monaco,
    mongolia,
    montenegro,
    montserrat,
    morocco,
    mozambique,
    myanmar,
    namibia,
    nauru,
    nepal,
    netherlands,
    newCaledonia,
    newZealand,
    nicaragua,
    niger,
    nigeria,
    niue,
    norfolkIsland,
    northMacedonia,
    northernMarianaIslands,
    norway,
    oman,
    pakistan,
    palau,
    stateOfPalestine,
    panama,
    papuaNewGuinea,
    paraguay,
    peru,
    philippines,
    pitcairn,
    poland,
    portugal,
    puertoRico,
    qatar,
    reunion,
    romania,
    russianFederation,
    rwanda,
    saintBarthelemy,
    saintHelenaAscensionAndTristanDaCunha,
    saintKittsAndNevis,
    saintLucia,
    theCollectivityOfSaintMartin,
    saintPierreAndMiquelon,
    saintVincentAndTheGrenadines,
    samoa,
    sanMarino,
    saoTomeAndPrincipe,
    saudiArabia,
    senegal,
    serbia,
    seychelles,
    sierraLeone,
    singapore,
    sintMaarten,
    slovakia,
    slovenia,
    solomonIslands,
    somalia,
    southAfrica,
    southGeorgiaAndTheSouthSandwichIslands,
    southSudan,
    spain,
    sriLanka,
    sudan,
    suriname,
    svalbardAndJanMayen,
    sweden,
    switzerland,
    syrianArabRepublic,
    taiwan,
    tajikistan,
    unitedRepublicOfTanzania,
    thailand,
    timorLeste,
    togo,
    tokelau,
    tonga,
    trinidadAndTobago,
    tunisia,
    turkey,
    turkmenistan,
    turksAndCaicosIslands,
    tuvalu,
    uganda,
    ukraine,
    unitedArabEmirates,
    unitedKingdom,
    unitedStates,
    unitedStatesMinorOutlyingIslands,
    uruguay,
    uzbekistan,
    vanuatu,
    bolivarianRepublicOfVenezuela,
    vietnam,
    virginIslandsBritish,
    virginIslandsUS,
    wallisAndFutuna,
    westernSahara,
    yemen,
    zambia,
    zimbabwe,
    world,
  ];
}
