import 'package:dotask_app/components/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../components/input_task.dart';

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

  @override
  void initState() {
    super.initState();
    taskController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          (data.isNotEmpty)
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
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary),
                                ),
                                Text(
                                  "(2/3 Completed tasks)",
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
                            onPressed: () {},
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
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, index) {
                            return TaskTile(
                                status: data[index][0],
                                title: data[index][1],
                                deleteTask: data[index][2]);
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
                    SizedBox(height: 20,),
                    Text(
                      'Your Taks List is Empty!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                    SizedBox(height: 10,),

                    Text(
                      "You don't have any active tasks right\nnow. try to add some!",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                      ),
                    ),
                    SizedBox(height: 50,),

                  ],
                ),

          // Container for Add new Task
          InputTask(taskController: taskController, addTask: () {}, dataIsNotEmpty: data.isNotEmpty,),
        ],
      ),
    );
  }
}

