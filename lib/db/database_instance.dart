import 'dart:io';
import 'package:json_to_list_flutter/post/model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseInstance {
  final _databaseName = 'sqflite.db';
  final int _databaseVersion = 1;

  // Product Table
  final String table = 'orders';
  final String id = 'id';
  final String customer = 'customer';
  final String total = 'total';
  final String date = 'date';

  Database? _database;

  Future<Database> database() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        '''CREATE TABLE $table ($id INTEGER PRIMARY KEY,  $customer TEXT, $total TEXT,$date TEXT NULL)''');
  }

  Future<List<OrderModel>> all() async {
    if (_database == null) {
      _database = await database();
    }
    final data = await _database!.query(table);
    List<OrderModel> result = data.map((e) => OrderModel.fromJson(e)).toList();
    print(result);
    return result;
  }

  Future<int> insert(Map<String, dynamic> row) async {
    final query = _database!.insert(table, row);
    return query;
  }

  Future<int> update(int idParam, Map<String, dynamic> row) async {
    final query =
        _database!.update(table, row, where: '${id} = ?', whereArgs: [idParam]);
    return query;
  }

  Future delete(int idParam) async {
    await _database!.delete(table, where: '$id = ?', whereArgs: [idParam]);
  }
}