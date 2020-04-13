import 'package:flutter/material.dart';
import 'package:todo/constants.dart';
import 'package:todo/models/task_repository.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskRepository>(builder: (context, taskRepository, child) {
      return Expanded(
        child: Container(
          color: Colors.white,
          child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            itemCount: taskRepository.taskCount,
            itemBuilder: (context, index) {
              final task = taskRepository.tasks[index];
              return Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                child: TaskTile(
                  name: task.name,
                  checked: task.isComplete,
                  onChanged: (bool value) {
                    taskRepository.toggleComplete(index);
                  },
                ),
                secondaryActions: <Widget>[
                  IconSlideAction(
                    foregroundColor: Colors.deepOrange,
                    caption: 'Delete',
                    icon: Icons.delete,
                    onTap: () => taskRepository.delete(index),
                  ),
                ],
              );
            },
          ),
        ),
      );
    });
  }
}

class TaskTile extends StatelessWidget {
  final String name;
  final bool checked;
  final Function onChanged;

  TaskTile({this.name, this.checked, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        this.name,
        style: this.checked == true ? kTaskCompleteStyle : kTaskIncompleteStyle,
      ),
      value: this.checked,
      onChanged: (bool value) {
        this.onChanged(value);
      },
      activeColor: Colors.deepOrange,
    );
  }
}
