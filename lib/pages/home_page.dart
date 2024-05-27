import 'package:dotask_app/components/delete_dialog.dart';
import 'package:dotask_app/components/task_tile.dart';
import 'package:dotask_app/models/task_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../components/input_task.dart';
import '../models/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data = [
    // [false, "Learn Todo", (){}],
    // [false, "Learn Todo", (){}],
  ];

  TextEditingController taskController = TextEditingController();
  bool? status = false;

  late int numAllTask;
  late int numDoneTask;

  // create task
  void createTask() {
    context.read<TaskDatabase>().addTask(taskController.text);
    setState(() {
      taskController.clear();
    });
  }

  // read task
  void readTask() {
    context.read<TaskDatabase>().fetchTask();
  }

  // update task
  void updateTask(int id, String newTask, bool newStatus) {
    context.read<TaskDatabase>().updateTask(id, newTask, newStatus);
    readTask();
  }

  // delete selected task
  void deleteSelectedTask(int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DeleteDialog(
          title: "Wait a second broo..",
          subtitle: "u wanna delete this Tasks?",
          cancel: () => Navigator.of(context).pop(),
          accept: () {
            Navigator.of(context).pop();
            context.read<TaskDatabase>().deleteTask(id);
            readTask();
          },
        );
      },
    );
  }

  // delete all task
  void deleteAllTask() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DeleteDialog(
          title: "Calm down broow...",
          subtitle: "u wanna delete all our Tasks?",
          cancel: () => Navigator.of(context).pop(),
          accept: () {
            Navigator.of(context).pop();
            context.read<TaskDatabase>().deleteAllTask();
            readTask();
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    taskController.addListener(() {
      setState(() {});
    });

    readTask();
  }

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  int doneTask(List<Task> currentTask) {
    int total = 0;
    for (var task in currentTask) {
      if (task.idDone) {
        total++;
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final taskDatabase = context.watch<TaskDatabase>();

    List<Task> currentTask = taskDatabase.currentTasks;
    numAllTask = currentTask.length;
    numDoneTask = doneTask(currentTask);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          (currentTask.isNotEmpty)
              ?
              // List view for task tile
              Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      // Header Row
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Today's Task",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                ),
                                Text(
                                  "($numDoneTask/$numAllTask Completed tasks)",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiaryContainer),
                                )
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () => deleteAllTask(),
                            child: Text(
                              'Clear all',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor:
                                    Theme.of(context).colorScheme.primary,
                                shadows: [
                                  Shadow(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    offset: Offset(0, -2),
                                  )
                                ],
                                color: Colors.transparent,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Expanded(
                        child: ListView.builder(
                          itemCount: currentTask.length,
                          itemBuilder: (BuildContext context, index) {
                            return TaskTile(
                              status: currentTask[index].idDone,
                              title: currentTask[index].task,
                              deleteTask: () =>
                                  deleteSelectedTask(currentTask[index].id),
                              onChanged: (value) {
                                setState(() {
                                  updateTask(currentTask[index].id,
                                      currentTask[index].task, value!);
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/empty_image.png'),
                            fit: BoxFit.cover,
                            opacity: 0.9),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Your Taks List is Empty!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "You don't have any active tasks right\nnow. try to add some!",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),

          // Container for Add new Task
          InputTask(
            taskController: taskController,
            addTask: () => createTask(),
            dataIsNotEmpty: currentTask.isNotEmpty,
          ),
        ],
      ),
    );
  }
}
