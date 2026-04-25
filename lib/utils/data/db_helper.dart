// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  // Private the constructor
  DBHelper._();
  static final DBHelper getInstence = DBHelper._();

  // Global Variable for db
  Database? myDB;

  /// --- Seting our Database setup --- ///

  // Get Databse
  Future<Database> getDB() async {
    myDB ??= await openDB();
    return myDB!;
  }

  // Open Database
  /*Table name / Column name variables */
  final table_name = 'notacker';
  final column_s_no = 's_no';
  final column_title = 'title';
  final column_disc = 'title';
  Future<Database> openDB() async {
    // get path for db
    Directory appDir = await getApplicationDocumentsDirectory();
    String dirPath = join(appDir.path, "notacker.db");

    return await openDatabase(
      dirPath,
      version: 1,
      onCreate: (db, version) {
        // All Tables will create here
        db.execute('''
CREATE TABLE $table_name (
          $column_s_no INTEGER PRIMARY KEY AUTOINCREMENT, 
          $column_title TEXT, 
          $column_disc TEXT,
          )''');
      },
    );
  }

  /// --- All CRUD Operations --- ///

  // Add Notes

  // Reding all Notes

  // Delete Notes
}
