import 'package:flutter/material.dart';
import 'package:todoey/components/task_tile.dart';
import 'package:todoey/model/task.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.length,
          itemBuilder: (context, index) {
            Task item = taskData.tasks[index];
            return TaskTile(
              title: item.name,
              isChecked: item.isDone,
              checkboxCallback: (bool? checkboxState) {
                taskData.updateTask(item);
              },
              longPressCallback: () {
                taskData.deleteTask(item);
              },
            );
          },
        );
      },
    );
  }
}
