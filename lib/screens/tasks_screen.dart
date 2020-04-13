import 'package:flutter/material.dart';
import 'package:todo/components/add_task_form.dart';
import 'package:todo/constants.dart';
import 'package:todo/components/task_list.dart';
import '../models/task_repository.dart';
import 'package:provider/provider.dart';

enum Option {
  yes,
  no,
}

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  Future<Option> confirmDelete() async {
    return (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('Delete all tasks?'),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  SimpleDialogOption(
                    child: OutlineButton(
                      onPressed: () {
                        Navigator.pop(context, Option.yes);
                      },
                      child: Text('Yes'),
                      textColor: Colors.deepOrange,
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                  SimpleDialogOption(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context, Option.no);
                      },
                      child: Text('No'),
                      color: Colors.deepOrange,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    final taskRepository = Provider.of<TaskRepository>(context);

    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 48.0,
              left: 32.0,
              right: 32.0,
              bottom: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      child: Icon(
                        Icons.list,
                        size: 54.0,
                      ),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.deepOrange,
                      radius: 60.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Todo',
                      style: kAppTitle,
                    ),
                    Text(
                      '${taskRepository.taskCount} tasks',
                      style: kTaskCountStyle,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () async {
                        final option = await confirmDelete();
                        if (option == Option.yes) {
                          taskRepository.clear();
                        }
                      },
                      child: Icon(
                        Icons.delete_sweep,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          TaskList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskForm(
                  onPressed: (String name) {
                    setState(() {
                      taskRepository.add(name);
                    });
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
