import 'dart:async';
import 'package:path/path.dart';
import 'package:sample_demo/model/single_user_model.dart';
import 'package:sample_demo/model/user_details.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static const dbName = 'myDataBase.db';
  static const dbVersion = 1;

  DataBaseHelper._privateConstructor();

  static final DataBaseHelper instance = DataBaseHelper._privateConstructor();

  static Database? dataBase;

  // Method to initialize database
  Future<Database> get database async {
    if (dataBase != null) return dataBase!;
    dataBase = await initializeDataBase();
    return dataBase!;
  }

  // method to open database
  initializeDataBase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: dbVersion, onCreate: createDB);
  }

  // method to create table in database
  FutureOr<void> createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    await db.execute('''CREATE TABLE $userTable(${UserFields.id} $idType,
    ${UserFields.name} $textType,
    ${UserFields.avatar_url} BLOB)''');
  }

  // method to save user in local database
  Future<UserDetails> create(UserDetails userDetails) async {
    final db = await instance.database;
    await db.insert(userTable, userDetails.toJson());
    return userDetails;
  }

  // method to get list of users from local database
  Future<List<SingleUserModel>> readAllUser() async {
    final db = await instance.database;
    final result = await db.query(userTable);
    List<SingleUserModel> list =
        result.map((json) => SingleUserModel.fromJson(json)).toList();
    return list;
  }

  // method to delete user
  Future<int> delete(int id) async {
    final db = await instance.database;
    var idUser = await db
        .delete(userTable, where: '${UserFields.id} = ?', whereArgs: [id]);
    return idUser;
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
