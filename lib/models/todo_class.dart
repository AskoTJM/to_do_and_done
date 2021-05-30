import 'package:to_do_and_done/consts/consts.dart';

class Todo {
  int id;
  String todo;
  String details;
  todo_choices status;

  Todo(
      {this.id = 0,
      required this.status,
      required this.todo,
      required this.details});

  Todo.fromMap(Map<String, dynamic> json)
      : id = json['id'],
        todo = json['todo'],
        details = json['details'],
        status = json['status'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'todo': todo,
      'details': details,
      'status': status.toString(),
    };
  }

  int getStatusInt(status) {
    switch (status) {
      case todo_choices.todo:
        return 0;
      case todo_choices.doing:
        return 1;
      case todo_choices.done:
        return 2;
      default:
        return -1;
    }
  }

  @override
  String toString() {
    return 'Todo{id: $id, todo: $todo, details: $details, status: $status }';
  }
}
