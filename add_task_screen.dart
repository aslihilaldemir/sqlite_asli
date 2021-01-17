import 'package:cet_todo_app/Helpers/SharedPref.dart';
import 'package:cet_todo_app/models/task_item.dart';
import 'package:cet_todo_app/models/task_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_item.dart';
import '../models/task_item.dart';
import '../models/task_item.dart';

class AddTaskScreen extends StatelessWidget {
  SharedPref sharedPref = SharedPref();
  @override
  Widget build(BuildContext context) {
    String taskTitle;
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.lightBlueAccent),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                onChanged: (newText) {
                  taskTitle = newText;
                  print(newText);
                },
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 20),
                autofocus: true,
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                  onPressed: () {
                    if (taskTitle != null) {
                      TaskItem completedTask = TaskItem(title: taskTitle, isDone: false);
                      Provider.of<TaskRepository>(context, listen: false)
                          .addTask(completedTask);
                      String taskString = completedTask.toString();
                      sharedPref.save("task", taskString);

                    }
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.lightBlueAccent)
            ],
          ),
        ),
      ),
    );
  }
}
