import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.lightBlueAccent,
        child: new Icon(Icons.add),
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
                  '12 Tasks',
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

class TasksList extends StatelessWidget {
  const TasksList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new TaskTile(),
        new TaskTile(),
        new TaskTile(),
      ],
    );
  }
}

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text('This is a task.'),
      trailing: new Checkbox(value: false),
    );
  }
}
