import 'package:flutter/material.dart';

class InputTask extends StatefulWidget {
  InputTask({
    super.key,
    required this.taskController,
    required this.addTask,
    required this.dataIsNotEmpty,
  });

  final TextEditingController taskController;
  final VoidCallback addTask;
  final bool dataIsNotEmpty;

  @override
  State<InputTask> createState() => _InputTaskState();
}

class _InputTaskState extends State<InputTask> {
  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, -2), blurRadius: 5)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text Form Field for INPUT NEW TASK
            TextFormField(
              controller: widget.taskController,
              decoration: InputDecoration(
                hintText: 'New Task',
                suffixIcon: (widget.taskController.text.isNotEmpty)
                    ? IconButton(
                        onPressed: () {
                          widget.taskController.clear();
                        },
                        icon: Icon(Icons.cancel_outlined))
                    : null,
                suffixIconColor: Theme.of(context).colorScheme.primary,
                focusColor: Theme.of(context).colorScheme.secondary,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.dataIsNotEmpty ? Theme.of(context).colorScheme.inversePrimary : Theme.of(context).colorScheme.tertiary,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            SizedBox(
              height: 15,
            ),

            // Button for SUBMIT NEW TASK
            Container(
              width: double.infinity,
              child: TextButton(
                onPressed: widget.addTask,
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  backgroundColor: MaterialStatePropertyAll(
                      widget.dataIsNotEmpty ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.tertiaryContainer ),
                  foregroundColor: MaterialStatePropertyAll(
                      Theme.of(context).colorScheme.surfaceContainer),
                  overlayColor: MaterialStatePropertyAll(Colors.white24),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text("Add Task"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
