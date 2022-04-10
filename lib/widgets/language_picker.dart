import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlocalization/models/locale/locale_providers.dart';
import 'package:riverpodlocalization/models/locale/locale_state.dart';
import 'package:riverpodlocalization/models/locale/locale_translate_name.dart';

class LanguagePicker extends ConsumerWidget {
  const LanguagePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Locale _currentLocale = ref.watch(localeProvider);
    List<Locale> _supportedLocales = ref.read(supportedLocalesProvider);

    return DropdownButton<Locale>(
        isDense: true,
        value: (!_supportedLocales.contains(_currentLocale)) ? null : _currentLocale,
        icon: const Icon(Icons.arrow_drop_down),
        underline: Container(
          height: 1,
          color: Colors.black26,
        ),
        onChanged: (Locale? newLocale) {
          if (newLocale == null) {
            return;
          }
          print("Selected " + newLocale.toString());

          // Set the locale (this will rebuild the app)
          ref.read(localeStateProvider.notifier).setLocale(newLocale);

          return;
        },
        // Create drop down items from our supported locales
        items: _supportedLocales
            .map<DropdownMenuItem<Locale>>(
              (locale) => DropdownMenuItem<Locale>(
                value: locale,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    translateLocaleName(locale: locale),
                  ),
                ),
              ),
            )
            .toList());
  }
}
