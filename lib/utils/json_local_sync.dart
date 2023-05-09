import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// JSON Local Sync
/// Save and Get a Json [Map<String, dynamic>] from local persistent storage
class JsonLocalSync {
  /// Save a Json object to local persistent storage
  static Future<bool> save({required String key, required Map<String, dynamic> value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = json.encode(value);
    return await prefs.setString(key, jsonString);
  }

  /// Get a Json object from local persistent storage
  static Future<Map<String, dynamic>?> get({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(key)) {
      return null;
    }

    String? jsonString = prefs.getString(key);
    if (jsonString == null) {
      print('Unable to getString for key: "$key".');
      return null;
