import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  const TaskTile(
      {super.key, required this.status, required this.title, required this.deleteTask});
  final bool? status;
  final String title;
  final VoidCallback deleteTask;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool? checkboxStatus;

  @override
  void initState() {
    super.initState();
    checkboxStatus = widget.status;
  }

  void changeValue(bool? value) {
    setState(() {
      checkboxStatus = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              offset: Offset(2, 2),
              spreadRadius: 1,
              blurRadius: 5),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Leading (Checkbox)
              Checkbox(
                activeColor: Theme.of(context).colorScheme.primary,
                value: checkboxStatus,
                onChanged: changeValue,
              ),

              // Title
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ],
          ),

          // Trailing (delete button)
          Container(
            padding: EdgeInsets.only(right: 5),
            child: IconButton(
              onPressed: widget.deleteTask,
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Theme.of(context).colorScheme.errorContainer),
                  foregroundColor: MaterialStatePropertyAll(
                      Theme.of(context).colorScheme.error)),
              icon: Icon(Icons.delete_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
