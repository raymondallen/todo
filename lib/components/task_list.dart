import 'package:flutter/material.dart';
import 'package:todo/constants.dart';
import 'package:todo/models/task.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> tasks = [
    Task(
      name: 'Buy groceries',
    ),
    Task(name: 'Take rubbish out'),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: ListView.builder(
          padding: EdgeInsets.all(8.0),
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return TaskTile(
              title: tasks[index].name,
              checked: tasks[index].isComplete,
              toggleCheckboxState: (bool value) {
                setState(() {
                  tasks[index].isComplete = value;
                });
              },
            );
          },
        ),
      ),
    );
  }
}

class TaskTile extends StatefulWidget {
  const TaskTile({
    Key key,
    @required this.title,
    @required this.checked,
    @required this.toggleCheckboxState,
  }) : super(key: key);

  final String title;
  final bool checked;
  final Function toggleCheckboxState;

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  @override
  void initState() {
    isChecked = this.widget.checked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        widget.title,
        style: kListItemStyle,
      ),
      value: isChecked,
      onChanged: (bool value) {
        isChecked = value;
        widget.toggleCheckboxState(value);
      },
      activeColor: Colors.deepOrange,
    );
  }
}
