import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlocalization/models/locale/locale_state.dart';
import 'package:riverpodlocalization/models/locale/platform_locale/platform_locale_interface.dart';

/// Platform Locale Provider
/// Returns the locale of the Platform.localeName
final platformLocaleProvider = Provider<Locale>((_) {
  // Get the platform language using platform specific implementations
  Locale _platformLocale = PlatformLocale().getPlatformLocale();

  print("Retrieved platform locale: " + _platformLocale.toString());

  return _platformLocale;
});

/// Supported Locales Provider
/// Update this list to expand the number of supported locales in the app
final supportedLocalesProvider = Provider<List<Locale>>((_) {
  return const [
    Locale('en', 'US'),
    Locale('ja', 'JP'),
  ];
});

/// Locale Provider
/// Provides the current locale, and automatically updates when the locale changes.
final localeProvider = Provider<Locale>((ref) {
  return ref.watch(localeStateProvider).locale;
});
