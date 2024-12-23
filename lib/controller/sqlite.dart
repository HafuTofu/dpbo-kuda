import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'user.dart';
import 'enrollment.dart';
import 'course.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  final String databaseName = "ciggapp.db";

  String userTable = '''
  CREATE TABLE user(
    id_user INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL
  )
  ''';

  String courseTable = '''
CREATE TABLE course(
  id_course INTEGER PRIMARY KEY AUTOINCREMENT,
  coursename TEXT NOT NULL,
  coursecategory TEXT NOT NULL,
  coursetype TEXT NOT NULL CHECK (coursetype IN ('Offline', 'Online')),
  coursedesc TEXT NOT NULL,
  coursephone TEXT NOT NULL,
  coursemail TEXT NOT NULL,
  coursecapacity INTEGER NOT NULL DEFAULT 1,
  courseparticipants INTEGER NOT NULL DEFAULT 0
)
''';

  String enrollmentTable = '''
CREATE TABLE enrollment(
  id_course INTEGER NOT NULL,
  id_user INTEGER NOT NULL,
  FOREIGN KEY (id_course) REFERENCES course (id_course),
  FOREIGN KEY (id_user) REFERENCES user (id_user),
  PRIMARY KEY (id_course, id_user)
)
''';

  String marketTable = '''
CREATE TABLE market(
  id_market INTEGER PRIMARY KEY AUTOINCREMENT,
  marketname TEXT NOT NULL,
  marketype TEXT NOT NULL,
  marketloc TEXT NOT NULL,
  marketdesc TEXT NOT NULL,
  marketphone TEXT NOT NULL,
  marketmail TEXT NOT NULL
)
''';

  String marketsaveTable = '''
CREATE TABLE marketsave(
  id_market INTEGER NOT NULL,
  id_user INTEGER NOT NULL,
  FOREIGN KEY (id_market) REFERENCES course (id_market),
  FOREIGN KEY (id_user) REFERENCES user (id_user),
  PRIMARY KEY (id_market, id_user)
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
        await db.execute(courseTable);
        await db.execute(enrollmentTable);
      },
    );
  }

//USER START done
  Future<List<Map<String, dynamic>>> getUserMapList() async {
    Database db = await database;
    var result = await db.query('user', orderBy: 'id_user ASC');
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
        where: 'id_user = ?', whereArgs: [user.id]);
    return result;
  }

  Future<int> deleteUser(User user) async {
    Database db = await database;
    var result =
        await db.delete('user', where: 'id_user = ?', whereArgs: [user.id]);
    return result;
  }
//USER END done

//COURSE START done
  Future<List<Map<String, dynamic>>> getCourseMapList() async {
    Database db = await database;
    var result = await db.query('course', orderBy: 'id_course ASC');
    return result;
  }

  Future<int> registerCourse(Course course) async {
    Database db = await database;
    return await db.insert('course', course.toMap());
  }

  Future<int> updateCourse(Course course) async {
    Database db = await database;
    var result = await db.update('course', course.toMap(),
        where: 'id_course = ?', whereArgs: [course.idcourse]);
    return result;
  }

  Future<int> deleteCourse(Course course) async {
    Database db = await database;
    var result = await db
        .delete('course', where: 'id_course = ?', whereArgs: [course.idcourse]);
    return result;
  }
//COURSE END done

//ENROLLMENT START
  Future<List<Map<String, dynamic>>> getEnrollmentMapList() async {
    Database db = await database;
    var result = await db.query('enrollment', orderBy: 'id_course ASC');
    return result;
  }

  Future<int> enrollmentCourse(Enrollment enrollment, Course course) async {
    Database db = await database;

    return await db.transaction((txn) async {
      course.courseparticipants += 1;

      await txn.update(
        'course',
        course.toMap(),
        where: 'id_course = ?',
        whereArgs: [course.idcourse],
      );

      return await txn.insert('enrollment', enrollment.toMap());
    });
  }

  Future<int> unenrollmentCourse(Enrollment enrollment, Course course) async {
    Database db = await database;
    return db.transaction((txn) async {
      course.courseparticipants -= 1;

      await txn.update(
        'course',
        course.toMap(),
        where: 'id_course = ?',
        whereArgs: [course.idcourse],
      );

      return await txn.delete('enrollment',
          where: 'id_course = ? AND id_user = ? ',
          whereArgs: [enrollment.idcourse, enrollment.iduser]);
    });
  }
//ENROLLMENT END undone
}
