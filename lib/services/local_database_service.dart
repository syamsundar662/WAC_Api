import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:web_and_craft/model/model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  factory DatabaseHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'app_data.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE data (
        id INTEGER PRIMARY KEY,
        json TEXT
      )
    ''');
  }

  Future<void> insertData(String json) async {
    Database db = await database;
    await db.insert(
      'data',
      {'json': json},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Model>> fetchData() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('data');

    if (maps.isNotEmpty) {
      return welcomeFromJson(maps.first['json']);
    } else {
      return [];
    }
  }
}
