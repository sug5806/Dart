import 'package:flutter/material.dart';
import 'package:task_app/models/task_data.dart';
import 'package:task_app/screens/add_task_screen.dart';
import 'package:task_app/widgets/tasks_list.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: new Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(),
          );
        },
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new CircleAvatar(
                  child: new Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.blueAccent,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                new SizedBox(
                  height: 10.0,
                ),
                new Text(
                  'Todoey',
                  style: new TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 50.0,
                  ),
                ),
                new Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          new Expanded(
            child: new Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: new Radius.circular(20.0),
                  topRight: new Radius.circular(20.0),
                ),
              ),
              child: new TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
