import 'dart:convert';
import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

/// Locale Json Converter
/// Locale does not come with toJson / fromJson functions, so we
/// use these overrides to work with freezed / json_serializable
class LocaleJsonConverter implements JsonConverter<Locale, String> {
  const LocaleJsonConverter();

  @override
  Locale fromJson(String json) {
    Map<String, dynamic> jsonLocale = jsonDecode(json);
    return Locale.fromSubtags(languageCode: jsonLocale['languageCode']!, countryCode: jsonLocale['countryCode']);
  }

  @override
  String toJson(Locale locale) {
    return jsonEncode({'languageCode': locale.languageCode, 'countryCode': locale.countryCode});
  }
}
