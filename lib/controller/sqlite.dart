import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'user.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  final String databaseName = "users.db";

  String userTable = '''
  CREATE TABLE user(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL
  )
  ''';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), databaseName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(userTable);
      },
    );
  }

  Future<List<Map<String, dynamic>>> getUserMapList() async {
    Database db = await database;
    var result = await db.query('user', orderBy: 'id ASC');
    return result;
  }

  Future<int> registerUser(User user) async {
    Database db = await database;
    return await db.insert('user', user.toMap());
  }

  Future<User?> loginUser(String username, String password) async {
    Database db = await database;
    var result = await db.query('user',
        where: 'username = ? AND password = ?',
        whereArgs: [username, password]);
    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    } else {
      return null;
    }
  }

  Future<int> updateUser(User user) async {
    Database db = await database;
    var result = await db.update('user', user.toMap(),
        where: 'id = ?', whereArgs: [user.id]);
    return result;
  }
}