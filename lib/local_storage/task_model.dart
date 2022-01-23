import 'package:project3/local_storage/sql_helper.dart';

class TaskModel {
  String title;
  bool isComplete;
  TaskModel(this.title, this.isComplete);
  toMapForDatabase() {
    return {'taskTitle': this.title, 'isComplete': this.isComplete ? 1 : 0};
  }
}
