import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:project3/local_storage/task_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class SqlHelper {
  SqlHelper._();
  static SqlHelper sqlHelper = SqlHelper._();
  Database database;
  final String tableName = 'tasks';
  final String idColumnName = 'taskId';
  final String titleColumnName = 'taskTitle';
  final String isCompleteColumnName = 'isComplete';
  initDatabase() async {
    database = await connectDatabase();
  }

  Future<Database> connectDatabase() async {
    // get database full path
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String directoryPath = appDocDir.path;
    String databsePath = directoryPath + '/tasks.db';

    // create or connect to database based on its full path
    Database database =
        await openDatabase(databsePath, version: 1, onCreate: (db, v) {
      db.execute(
          'CREATE TABLE $tableName ($idColumnName INTEGER PRIMARY KEY AUTOINCREMENT, $titleColumnName TEXT, $isCompleteColumnName INTEGER)');
    });
    return database;
  }

  /// CRUD
  insertNewTask(TaskModel taskModel) async {
    int rowNumber =
        await database.insert(tableName, taskModel.toMapForDatabase());
    log(rowNumber.toString());
  }

  getAllTasks() async {
    List<Map<String, Object>> results = await database.query(tableName);
    log(results.toString());
  }

  getOneTask(int id) {}
  updateSpecficTask() {}
  deleteOneTask(int id) {}
  deleteAllTasks() {}
}
