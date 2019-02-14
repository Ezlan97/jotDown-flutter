import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:jot_down/models/note.dart'

class DatabaseHelper {
  static  DatabaseHelper _databaseHelper;  //singleton database helper
  static Database _database;               //singleton database

  //table and column
  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDesc = 'desc';
  String colPriority = 'priority';
  String colCreatedAt = 'created_at';


  DatabaseHelper._createInstance();

  factory DatabaseHelper() {

    _databaseHelper = DatabaseHelper._createInstance();

    return _databaseHelper;
  }

  Future<Database> get database async {

    if (_database == null) {  //check if table is existed or not, if not create it
      _database = await initializeDatabase();
    }

    return _database;
  }

  Future<Database> initializeDatabase() async {
    //get directory  path for storing data in database
    Directory directory = await getApplicationDocumentsDirectory(); //get path
    String path =  directory.path + 'notes.db'; //set path

    //open / create  the database at given path
    var noteDatabase = await openDatabase(path, version: 1, onCreate: _createDb); //create table note
    return noteDatabase;
  }

  //create function
  void _createDb(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colDesc TEXT, $colPriority INTEGER, $colCreatedAt TEXT)');
  }

  //CRUD

  //fetch data
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;

    //var result = await db.rawQuery('SELECT * FROPM $noteTable order by $colPriority ASC'); //both is same
    var result = await db.query(noteTable, orderBy: '$colPriority ASC');

    return result;
  }

  //insert data
  Future<int> insertNote(Note n) async {
    Database db = await this.database;
    var result = await db.insert(noteTable, n.toMap());
    return result;
  }

  //update data
  Future<int> noteUpdate(Note n) async {
    Database db = await this.database;
    var result = await db.update(noteTable, n.toMap(), where: '$colId = ?', whereArgs: [n.id]);
    return result;
  }

  //delete data
  Future<int> noteDelete(int id) async {
    Database db = await this.database;
    var result = await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
  }

  //search data
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $noteTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }
}