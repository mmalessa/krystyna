import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:krystyna/providers/locale_provider.dart';
import 'package:krystyna/generated/app_localizations.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    
    return Consumer<LocaleProvider>(
      builder: (context, localeProvider, child) {
        return DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: localizations?.language ?? 'Language',
            border: const OutlineInputBorder(),
          ),
          value: localeProvider.locale.languageCode,
          items: LocaleProvider.supportedLocales.map((Locale locale) {
            return DropdownMenuItem<String>(
              value: locale.languageCode,
              child: Text(localeProvider.getLocalizedLanguageName(context, locale.languageCode)),
            );
          }).toList(),
          onChanged: (String? languageCode) {
            if (languageCode != null) {
              localeProvider.setLocale(Locale(languageCode));
            }
          },
        );
      },
    );
  }
} 