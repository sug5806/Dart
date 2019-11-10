import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen();

  String newTaskTitle;

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: new Color(0xFF757575),
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
              topLeft: new Radius.circular(20.0),
              topRight: new Radius.circular(20.0)),
        ),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            new TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            new FlatButton(
              onPressed: () {
                Provider.of<TaskData>(context).addTask(newTaskTitle);
                Navigator.pop(context);
              },
              child: new Text(
                'Add',
                style: new TextStyle(color: Colors.white),
              ),
              color: Colors.lightBlueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
