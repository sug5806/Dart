import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:task_app/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier{
	List<Task> _tasks = <Task>[
		new Task(name: 'Buy milk'),
		new Task(name: 'Buy egg'),
		new Task(name: 'Buy bread'),
	];

	List<Task> get tasks => _tasks;

	int get taskCount => _tasks.length;

	void addTask(String newTaskTitle){
		final task = Task(name: newTaskTitle);
		_tasks.add(task);
		notifyListeners();
	}

	void updateTask(Task task){
		task.toggleDone();
		notifyListeners();
	}

	void deleteTask(Task task){
		_tasks.remove(task);
		notifyListeners();
	}
}