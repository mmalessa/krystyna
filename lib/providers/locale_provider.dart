import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:krystyna/generated/app_localizations.dart';

class LocaleProvider with ChangeNotifier {
  static const String _localeKey = 'selectedLocale';
  static const Locale defaultLocale = Locale('en');
  
  Locale _locale = defaultLocale;
  
  LocaleProvider() {
    loadSavedLocale();
  }

  Locale get locale => _locale;

  static const List<Locale> supportedLocales = [
    Locale('en'), // English
    Locale('pl'), // Polish
    Locale('de'), // German
    Locale('es'), // Spanish
    Locale('fr'), // French
    Locale('uk'), // Ukrainian
    Locale('cs'), // Czech
    Locale('sk'), // Slovak
    Locale('it'), // Italian
  ];

  Future<void> loadSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final String? languageCode = prefs.getString(_localeKey);
    
    if (languageCode != null) {
      _locale = Locale(languageCode);
      notifyListeners();
    }
  }

  Future<void> setLocale(Locale locale) async {
    if (!supportedLocales.contains(locale)) return;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);
    
    _locale = locale;
    notifyListeners();
  }

  // Returns native language name (used for display in debug/fallback scenarios)
  String getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'pl':
        return 'Polski';
      case 'de':
        return 'Deutsch';
      case 'es':
        return 'Español';
      case 'fr':
        return 'Français';
      case 'uk':
        return 'Українська';
      case 'cs':
        return 'Čeština';
      case 'sk':
        return 'Slovenčina';
      case 'it':
        return 'Italiano';
      default:
        return languageCode;
    }
  }

  // Returns localized language name based on current app language
  String getLocalizedLanguageName(BuildContext context, String languageCode) {
    final localizations = AppLocalizations.of(context);
    if (localizations == null) return getLanguageName(languageCode);

    switch (languageCode) {
      case 'en':
        return localizations.english;
      case 'pl':
        return localizations.polish;
      case 'de':
        return localizations.german;
      case 'es':
        return localizations.spanish;
      case 'fr':
        return localizations.french;
      case 'uk':
        return localizations.ukrainian;
      case 'cs':
        return localizations.czech;
      case 'sk':
        return localizations.slovak;
      case 'it':
        return localizations.italian;
      default:
        return languageCode;
    }
  }
} 