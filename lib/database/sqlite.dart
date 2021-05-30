import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_and_done/models/todo_class.dart';

sqliteDatabase() async {
  WidgetsFlutterBinding.ensureInitialized();
  return openDatabase(
    join(await getDatabasesPath(), 'todo_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE todos(id INTEGER PRIMARY KEY, todo TEXT, details TEXT, status INTEGER)',
      );
    },
    version: 1,
  );
}

getDatabase() async {
  return await openDatabase(
    join(await getDatabasesPath(), 'todo_database.db'),
  );
}

removeDatabase() async {
  final db = openDatabase(
    join(await getDatabasesPath(), 'todo_database.db'),
  );
}

Future<void> insertTodo(Todo todo) async {
  final db = await getDatabase();
  //var newId = db.query('Select MAX(id) FROM todos') as Todo;
  //if (todo.id == -1) todo.id = newId.id + 1;
  await db.insert(
    'todos',
    todo.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Todo>> todos() async {
  final db = await getDatabase();

  final List<Map<String, dynamic>> maps = await db.query('todos');

  return List.generate(maps.length, (i) {
    return Todo(
      id: maps[i]['id'],
      todo: maps[i]['todo'],
      details: maps[i]['details'],
      status: maps[i]['status'],
    );
  });
}

Future<void> updateTodo(Todo todo) async {
  final db = await getDatabase();
  await db.update(
    'todos',
    todo.toMap(),
    where: 'id = ?',
    whereArgs: [todo.id],
  );
}

Future<void> deleteTodo(int id) async {
  final db = await getDatabase();

  await db.delete(
    'todos',
    where: 'id = ?',
    whereArgs: [id],
  );
}
