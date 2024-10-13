import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodolistScreen extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  Function(bool?)? onChanged;

  TodolistScreen(
      {super.key,
      required this.taskName,
      required this.isCompleted,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: const EdgeInsets.all(24.0),
      padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
      child: Slidable(
        endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            ),],),
        child: Container(
          padding: const EdgeInsets.all(18.0),
          decoration: BoxDecoration(
              color: Colors.purpleAccent,
              borderRadius: BorderRadius.circular(14)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              taskName,
              style: TextStyle(
                  fontSize: 18,
                  decoration: isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            Checkbox(
              value: isCompleted,
              onChanged: onChanged,
              activeColor: Colors.black,
            ),
          ]),
        ),
      ),
    );
  }
}
