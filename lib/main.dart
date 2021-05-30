import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_and_done/consts/consts.dart';
import 'package:to_do_and_done/models/todomodel.dart';

import 'Views/todo_form_view.dart';
import 'Views/todo_list_view.dart';
import 'database/sqlite.dart';

void main() {
  sqliteDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ToDoModel>(
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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var list = context.watch<ToDoModel>();
    getDatabase();

    void _openToDo() {
      list.changeState(todo_choices.add);
      list.setIdToEdit(0);
      list.changeState(todo_choices.add);
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

    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Builder(
        builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context)!;
          tabController.addListener(() {
            if (tabController.index != tabController.previousIndex) {
              if (tabController.index == 0) list.changeState(todo_choices.done);
              if (tabController.index == 1)
                list.changeState(todo_choices.doing);
              if (tabController.index == 2) list.changeState(todo_choices.todo);
            }
          });
          return Scaffold(
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
            body: TabBarView(
              children: <Widget>[
                Center(
                  child: DataTableWidget(),
                ),
                Center(
                  child: DataTableWidget(),
                ),
                Center(
                  child: DataTableWidget(),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              tooltip: 'Add ToDo',
              child: Icon(Icons.add),
              onPressed: _openToDo,
            ),
          );
        },
      ),
    );
  }
}
