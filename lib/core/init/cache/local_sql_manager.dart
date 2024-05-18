import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:haydi_express_restaurant/core/init/cache/local_keys_enums.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';

//TODO: May be unnecessary
class LocaleSqlManager {
  static LocaleSqlManager instance = LocaleSqlManager();
  late Database _instance;
  Future<void> initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = "${documentsDirectory.path}/haydi_express.db";
    _instance = sqlite3.open(path);
    debugPrint(path);
    try {
      _createTables();
    } catch (e) {
      //The tables already exist
    }
  }

  _createTables() {
    _instance.execute('''CREATE TABLE ${LocaleKeysEnums.menu.name}(
      menuId TEXT PRIMARY KEY,
      name TEXT NOT NULL,
      content TEXT NOT NULL,
      discountFinishDate TEXT,
      discountAmount INTEGER,
      isOnDiscount  INTEGER NOT NULL,
      photoUrl TEXT NOT NULL,
      price INTEGER NOT NULL,
      restaurantUid TEXT NOT NULL,
      stats TEXT NOT NULL,
      tags TEXT NOT NULL
    )''');
  }

  bool getBooleanFromInteger(int data) {
    if (data != 1 || data != 0) {
      throw Exception("Data must be 1 or 0");
    } else {
      return data == 1 ? true : false;
    }
  }

  setValue(
      {required String tableName,
      required List<String> keys,
      required List<dynamic> values}) {
    String kys = keys.join(", ");
    String valueCount = "?, " * values.length;
    final PreparedStatement query = _instance.prepare(
        "INSERT INTO $tableName ($kys) VALUES (${valueCount.substring(0, valueCount.length - 2)})");
    query.execute(values);
  }

  List<dynamic>? getTable(String tableName) {
    final query = _instance.select("SELECT * FROM $tableName");
    return query.toList();
  }

  editValue({
    required String tableName,
    required String comparedValue,
    required List<String> keys,
    required String whereParam,
    required List<dynamic> values,
  }) {
    String parsedKeys = keys.join(" = ?,");
    final PreparedStatement query = _instance.prepare(
        "UPDATE $tableName SET $parsedKeys=? WHERE $whereParam = '$comparedValue'");
    query.execute(values);
  }

  deleteValue(String tableName, String key, String comparedValue) {
    _instance.execute("DELETE FROM '$tableName' WHERE $key='$comparedValue'");
  }

  getStringValue(String tableName, String columnName, String value) {
    final query = _instance
        .select("SELECT * FROM $tableName WHERE $columnName = '$value'");
    return query.toList();
  }

  getDynamicValue(String tableName, String columnName, dynamic value) {
    final query =
        _instance.select("SELECT * FROM $tableName WHERE $columnName = $value");
    return query.toList();
  }
}
