import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpodlocalization/models/locale/locale_providers.dart';
import 'package:riverpodlocalization/models/persistent_state.dart';
import 'package:riverpodlocalization/utils/json_local_sync.dart';

import 'locale_json_converter.dart';

part 'locale_state.freezed.dart';
part 'locale_state.g.dart';

// Fallback Locale
const Locale fallbackLocale = Locale('en', 'US');

final localeStateProvider = StateNotifierProvider<LocaleStateNotifier, LocaleState>((ref) => LocaleStateNotifier(ref));

@freezed
class LocaleState with _$LocaleState, PersistentState<LocaleState> {
  const factory LocaleState({
    @LocaleJsonConverter() @Default(fallbackLocale) @JsonKey() Locale locale,
  }) = _LocaleState;

  // Allow custom getters / setters
  const LocaleState._();

  static const _localStorageKey = 'persistentLocale';

  /// Local Save
  /// Saves the settings to persistent storage
  @override
  Future<bool> localSave() async {
    Map<String, dynamic> value = toJson();
    try {
      return await JsonLocalSync.save(key: _localStorageKey, value: value);
    } catch (e) {
      print(e);
      return false;
    }
  }

  /// Local Delete
  /// Deletes the settings from persistent storage
  @override
  Future<bool> localDelete() async {
    try {
      return await JsonLocalSync.delete(key: _localStorageKey);
    } catch (e) {
      print(e);
      return false;
    }
  }

  /// Create the settings from Persistent Storage
  /// (Static Factory Method supports Async reading of storage)
  @override
  Future<LocaleState?> fromStorage() async {
    try {
      var _value = await JsonLocalSync.get(key: _localStorageKey);
      if (_value == null) {
        return null;
      }
      var _data = LocaleState.fromJson(_value);
      return _data;
    } catch (e) {
      rethrow;
    }
  }

  // For Riverpod integrated toJson / fromJson json_serializable code generator
  factory LocaleState.fromJson(Map<String, dynamic> json) => _$LocaleStateFromJson(json);
}

class LocaleStateNotifier extends StateNotifier<LocaleState> {
  final ProviderRefBase ref;
  LocaleStateNotifier(this.ref) : super(const LocaleState());

  /// Initialize Locale
  /// Can be run at startup to establish the initial local from storage, or the platform
  /// 1. Attempts to restore locale from storage
  /// 2. IF no locale in storage, attempts to set local from the platform settings
  Future<void> initLocale() async {
    // Attempt to restore from storage
    bool _fromStorageSuccess = await ref.read(localeStateProvider.notifier).restoreFromStorage();

    // If storage restore did not work, set from platform
    if (!_fromStorageSuccess) {
      ref.read(localeStateProvider.notifier).setLocale(ref.read(platformLocaleProvider));
    }
  }

  /// Set Locale
  /// Attempts to set the locale if it's in our list of supported locales.
  /// IF NOT: get the first locale that matches our language code and set that
  /// ELSE: do nothing.
  void setLocale(Locale locale) {
    List<Locale> _supportedLocales = ref.read(supportedLocalesProvider);

    // Set the locale if it's in our list of supported locales
    if (_supportedLocales.contains(locale)) {
      // Update state
      state = state.copyWith(locale: locale);

      // Save to persistence
      state.localSave();
      return;
    }

    // Get the closest language locale and set that instead
    Locale? _closestLocale =
        _supportedLocales.firstWhereOrNull((supportedLocale) => supportedLocale.languageCode == locale.languageCode);
    if (_closestLocale != null) {
      // Update state
      state = state.copyWith(locale: _closestLocale);

      // Save to persistence
      state.localSave();
      return;
    }

    // Otherwise, do nothing and we'll stick with the default locale
    return;
  }

  /// Restore Locale from Storage
  Future<bool> restoreFromStorage() async {
    try {
      print("Restoring LocaleState from storage.");
      // Attempt to get the user from storage
      LocaleState? _state = await state.fromStorage();

      // If user is null, there is no user to restore
      if (_state == null) {
        return false;
      }

      print("State found in storage: " + _state.toJson().toString());

      // Set state
      state = _state;

      return true;
    } catch (e, s) {
      print("Error" + e.toString());
      print(s);
      return false;
    }
  }
}
