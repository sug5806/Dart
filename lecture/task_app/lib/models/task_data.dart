import 'package:flutter/foundation.dart';
import 'package:task_app/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier{
	List<Task> _tasks = <Task>[
		new Task(name: 'Buy milk'),
		new Task(name: 'Buy egg'),
		new Task(name: 'Buy bread'),
	];

	UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

	int get taskCount => _tasks.length;

	void addTask(String newTaskTitle){

		tasks.add(Task(name: 'asfsad'));

		final task = Task(name: newTaskTitle);
		_tasks.add(task);
		notifyListeners();
	}
}