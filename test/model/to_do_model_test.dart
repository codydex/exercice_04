import 'package:unittest/unittest.dart';
import 'package:dartlero/dartlero.dart';
import 'package:ex04/exercice_04.dart';

testTasks(Tasks tasks) {

  group("Testing tasks", () {

    setUp(() {
      var taskCount = 0;
      expect(tasks.length, equals(taskCount));

      var newTask1 = new Task();
      expect(newTask1, isNotNull);
      newTask1.name = 'First Task';
      newTask1.state='Finished';
      newTask1.number=1;
      tasks.add(newTask1);
      expect(tasks.length, equals(++taskCount));

      var newTask2 = new Task();
      expect(newTask2, isNotNull);
      newTask2.name = 'Second Task';
      newTask2.state='Started';
      newTask2.number=2;
      newTask2.description='Description of your task';
      tasks.add(newTask2);
      expect(tasks.length, equals(++taskCount));

      var newTask3 = new Task();
      expect(newTask3, isNotNull);
      newTask3.name = ' Third Task';
      newTask3.number=3;
      newTask3.description='Description of your task';
      tasks.add(newTask3);
      expect(tasks.length, equals(++taskCount));
    });

    tearDown(() {
      tasks.clear();
      expect(tasks.isEmpty, isTrue);
    });

    test('Add Task', () {
      var task = new Task();
      expect(task, isNotNull);
      task.name = 'Task number Four ';
      task.state='started';
      task.description='Descibe your task';
      task.number=4;
      var added = tasks.add(task);
      expect(added, isTrue);
      tasks.display('Add Task');
    });

    test('Add Task Without Data', () {
      var taskCount = tasks.length;
      var task = new Task();
      expect(task, isNotNull);
      var added = tasks.add(task);
      expect(added, isTrue);
      tasks.display('Add Task Without Data');
    });

    test('Add Task Not Unique', () {
      var taskCount = tasks.length;
      var task = new Task();
      expect(task, isNotNull);
      task.name = 'First Task';
      var added = tasks.add(task);
      expect(added, isFalse);
      tasks.display('Add Tache Not Unique');
    });

    test('Find Task by Name', () {
      var searchName = 'Second Task';
      var task = tasks.find(searchName);
      expect(task, isNotNull);
      expect(task.name, equals(searchName));
      task.display('Find Tache by Name');
    });



    test('Order Tasks by Name', () {
      tasks.orderByFunction((m,n) => m.compareTo(n));
      tasks.display('Order Tasks by Name');
    });

    test('New Task', () {
      var taskCount = tasks.length;
      var newTask = new Task();
      expect(newTask, isNotNull);
      newTask.name = 'Task number Four';
      var added = tasks.add(newTask);
      expect(added, isTrue);
      expect(tasks.length, equals(++taskCount));
      tasks.display('New Tache');
    });

    test('Copy Tasks', () {
      Tasks copiedTasks = tasks.copy();
      expect(copiedTasks.isEmpty, isFalse);
      expect(copiedTasks.length, equals(tasks.length));
      expect(copiedTasks, isNot(same(tasks)));
      expect(copiedTasks, isNot(equals(tasks)));
      copiedTasks.forEach((cp) =>
          expect(cp, isNot(same(tasks.find(cp.name)))));
      copiedTasks.display('Copied Taches');
    });

    test('True for Every Task', () {
      expect(tasks.every((p) => p.code != null), isTrue);
      expect(tasks.every((p) => p.name != null), isTrue);
    });

    test('From Tasks to JSON', () {
      var json = tasks.toJson();
      expect(json, isNotNull);
      print(json);
    });

    test('From JSON to Task Model', () {
      List<Map<String, Object>> json = tasks.toJson();
      tasks.clear();
      expect(tasks.isEmpty, isTrue);
      tasks.fromJson(json);
      expect(tasks.isEmpty, isFalse);
      tasks.display('From JSON to Tasks');
    });

  });

}

testModel() {
  TacheModel taskModel = new TacheModel();
  Tasks tasks = taskModel.tasks;
  testTasks(tasks);
}

main() {
  testModel();
}