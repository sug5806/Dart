import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:task_app/models/task_data.dart';
import 'package:task_app/screens/tasks_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => new TaskData(),
      child: new MaterialApp(
        home: new TasksScreen(),
      ),
    );
  }
}

class Data extends ChangeNotifier {
  String data = 'Some data';

  void changeString(String newString){
    data = newString;
    notifyListeners();
  }
}