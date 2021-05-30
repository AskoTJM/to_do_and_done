import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:to_do_and_done/consts/consts.dart';

import 'todo_class.dart';

class ToDoModel extends ChangeNotifier {
  var _todoState = todo_choices.doing;
  var _prevToDoState = todo_choices.todo;
  var _idToEdit = 0;

  List<Todo> todoList = [
    Todo(
        id: 1,
        status: todo_choices.todo,
        todo: "testTodo1",
        details: "testDetailsTodo1"),
    Todo(
        id: 2,
        status: todo_choices.doing,
        todo: "testToDoing2",
        details: "testDetailsDoing2"),
    Todo(
        id: 3,
        status: todo_choices.done,
        todo: "testDone3",
        details: "testDetailsDone3"),
    Todo(
        id: 8,
        status: todo_choices.todo,
        todo: "testTodo4",
        details: "testDetailsTodo4"),
    Todo(
        id: 5,
        status: todo_choices.doing,
        todo: "testToDoing5",
        details: "testDetailsDoing5"),
    Todo(
        id: 6,
        status: todo_choices.done,
        todo: "testToDone6",
        details: "testDetailsDone6")
  ];

  addToList(Todo addTodo) {
    addTodo.id = getMaxId() + 1;
    todoList.add(addTodo);
    notifyListeners();
  }

  updateTodo(Todo updateTodo) {
    int index = todoList.indexWhere((td) => td.id == updateTodo.id);
    todoList[index] = updateTodo;

    notifyListeners();
  }

  deleteTodo(int id) {
    todoList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  getMaxId() {
    if (todoList.isNotEmpty) {
      dynamic max = todoList.first;
      todoList.forEach((e) {
        if (e.id > max.id) max = e;
      });
      return (max.id);
    }
  }

  void setIdToEdit(int id) {
    _idToEdit = id;
  }

  getIdToEdit() {
    return _idToEdit;
  }

  changeState(todo_choices choice) {
    _prevToDoState = _todoState;
    _todoState = choice;
    notifyListeners();
  }

  getState() {
    return _todoState;
  }

  getPrevState() {
    return _prevToDoState;
  }

  Todo getById(int id) {
    var _todoToEdit = todoList.firstWhere((todo) => todo.id == id);

    return Todo(
        id: _todoToEdit.id,
        status: _todoToEdit.status,
        todo: _todoToEdit.todo,
        details: _todoToEdit.todo);
  }

  getListByStatus() {
    return (todoList.where((todo) => todo.status == _todoState).toList());
  }
}
