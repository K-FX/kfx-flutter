part of 'relative_time.dart';

/// The key is the word being translated (always in english)
/// The value is a map with the language code and the translated text
/// If the language code is not available, english is used
const _texts = {
  "now": {
    "en": "now",
    "pt": "agora",
  },
  "min": {
    "en": "min",
    "pt": "min",
  },
  "hr": {
    "en": "hr",
    "pt": "hr",
  },
  "½": {
    "en": "½",
    "pt": "pt",
  },
  "1 day": {
    "en": "1 day",
    "pt": "1 dia",
  },
  "days": {
    "en": "days",
    "pt": "dias",
  },
  "a week": {
    "en": "a week",
    "pt": "1 sem",
  },
  "weeks": {
    "en": "weeks",
    "pt": "sem",
  },
  "1 month": {
    "en": "1 month",
    "pt": "1 mês",
  },
  "months": {
    "en": "months",
    "pt": "meses",
  },
  "a year": {
    "en": "a year",
    "pt": "um ano",
  },
  "years": {
    "en": "years",
    "pt": "anos",
  },
};

String _i18n(String text, [String? languageCode]) {
  if (languageCode == null) {
    if (_currentLanguageCode == null) {
      window.onLocaleChanged = _onLocaleChanged;
      _onLocaleChanged();
    }

    languageCode = _currentLanguageCode;
  }

  final textLanguages = _texts[text] ?? {"en": "{'$text' is not translated}"};

  return textLanguages[languageCode] ?? textLanguages["en"] ?? "{'$text' not translated to $languageCode}";
}

String? _currentLanguageCode;
List<String>? _availableTranslations;

void _onLocaleChanged() {
  final availableLanguages = window.locales;

  if (_availableTranslations == null) {
    _availableTranslations = [];

    for (final text in _texts.values) {
      for (final key in text.keys) {
        if (_availableTranslations!.contains(key) == false) {
          _availableTranslations!.add(key);
        }
      }
    }
  }

  for (final availableLanguage in availableLanguages) {
    if (_availableTranslations!.contains(availableLanguage.languageCode)) {
      _currentLanguageCode = availableLanguage.languageCode;
      return;
    }
  }
}
