import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_and_done/models/todomodel.dart';

import 'Views/todo_form_view.dart';
import 'Views/todo_list_view.dart';

void main() {
  //runApp(MaterialApp(home: MyApp()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ToDoModel>(
      create: (context) => ToDoModel(),
      child: MaterialApp(
        title: 'ToDoAndDone',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: MyHomePage(title: 'ToDoAndDone'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _openToDo() {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(title: Text('Add ToDo')),
            body: Center(
              child: ToDoFormWidget(),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Past",
                icon: Icon(Icons.arrow_back),
              ),
              Tab(
                text: "Now",
                icon: Icon(Icons.adb_rounded),
              ),
              Tab(
                text: "Future",
                icon: Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: DataTableWidget(timeTravel: "past"),
            ),
            Center(
              child: DataTableWidget(timeTravel: "now"),
            ),
            Center(
              child: DataTableWidget(timeTravel: "future"),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add ToDo',
          child: Icon(Icons.add),
          onPressed: _openToDo,
        ),
      ),
    );
  }
}
