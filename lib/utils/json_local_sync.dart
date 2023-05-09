import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// JSON Local Sync
/// Save and Get a Json [Map<String, dynamic>] from local persistent storage
class JsonLocalSync {
  /// Save a Json object to local persistent storage
  static Future<bool> save({required String key, required Map<String, dynamic> value}) async {
