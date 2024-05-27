import 'package:dotask_app/models/task.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class TaskDatabase {
  static late Isar isar;

  // INITIALIZATION DATABASE
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [TaskSchema],
      directory: dir.path,
    );
  }

  // List of Task
  final List<Task> currentTasks = [];

  // CREATE - new task to database
  Future<void> addTask(String task) async {
    // make new Object Task
    final newTask = Task()..task = task;

    // Add new Taks to database
    await isar.writeTxn(() async {
      await isar.tasks.put(newTask);
    });

    // re-write from database
    await fetchTask();
  }

  // READ - all task from database
  Future<void> fetchTask() async {
    // get all task from database
    List<Task> allTask = await isar.tasks.where().findAll();

    // refresh current Taks list
    currentTasks.clear();
    currentTasks.addAll(allTask);
  }

  // UPDATE - task in database
  Future<void> updateTask(int id, String task, bool status) async {
    // get selected Task from database
    final selectedTask = await isar.tasks.get(id);

    // if success get the selected Task then update the task, else print error
    if (selectedTask != null) {
      selectedTask.task = task;
      selectedTask.idDone = status;

      // update the task to database
      await isar.writeTxn(() => isar.tasks.put(selectedTask));

      // re-write from database
      await fetchTask();
    } else {
      print("Error: failed to update the task");
    }
  }

  // DELETE - selected task in database
  Future<void> deleteTask(int id) async {
    // delete selected task
    await isar.writeTxn(() => isar.tasks.delete(id));

    // re-write from database
    await fetchTask();
  }

  // DELETE ALL - task in database
  Future<void> deleteAllTask() async {
    // get all task from database
    final allTask = await isar.tasks.where().findAll();

    // do loop to delete each task
    for (var task in allTask) {
      await isar.writeTxn(() => isar.tasks.delete(task.id));
    }

    // re-write from database
    await fetchTask();
  }
}
