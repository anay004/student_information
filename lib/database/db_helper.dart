import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  //database name
  static const databaseName = "notes.db";
  //database version
  static const databaseVersion = 1;
  //table name
  static const tableNotes = 'notes';
  //column names
  static const columnId = 'id';
  static const columnName = 'name';
  static const columnPhone = 'phone';
  static const columnDepartment = 'department';
  static const columnEmail = 'email';
  static const columnAddress = 'address';

  //create a single instance of DatabaseHelper
  DatabaseHelper.privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper.privateConstructor();

  static Database? myDb;


  //for initializing the database
  Future<Database?> get database async {
    if (myDb != null) return myDb;
    myDb = await initDatabase();
    return myDb;
  }


  //for initializing the database path
  initDatabase() async {
    String path = join(await getDatabasesPath(), databaseName);
    return await openDatabase(
        path,
        version: databaseVersion,
        onCreate: createTables
    );
  }


  //for creating table in database  if not exist already
  Future createTables(Database db, int version) async {

    await db.execute("""
          CREATE TABLE $tableNotes (
            $columnId TEXT PRIMARY KEY,
            $columnName  TEXT NOT NULL,
            $columnPhone  TEXT NOT NULL,
            $columnDepartment TEXT NOT NULL,
            $columnEmail  TEXT NOT NULL,
            $columnAddress  TEXT NOT NULL
          )
          """
    );
  }

  //for insert data
  Future<int> insertData(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(tableNotes, row);
  }

  //for read data from database
  Future<List<Map<String, dynamic>>> getAllData() async {
    Database? db = await instance.database;

    return await db!.query(tableNotes, orderBy: "$columnId DESC");

    // Use rawQuery to select all notes
    // List<Map<String, dynamic>> notes = await db!.rawQuery('SELECT * FROM notes');

    //return notes;
  }


  //for update data in database
  Future<int> updateData(Map<String, dynamic> row,String id) async {
    Database? db = await instance.database;

    return await db!.update(tableNotes, row, where: '$columnId = ?', whereArgs: [id]);

    // await db.rawQuery(
    //     'SELECT * FROM notes WHERE userId = ?',
    //     [userId]);

  }

  //for delete data from database
  Future<int> deleteData(String id) async {
    Database? db = await instance.database;
    return await db!.delete(tableNotes, where: '$columnId = ?', whereArgs: [id]);
  }
}