import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_and_done/consts/consts.dart';
import 'package:to_do_and_done/models/todomodel.dart';

import 'todo_form_view.dart';

class DataTableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = context.watch<ToDoModel>();
    var tempList = list.getListByStatus();

    void _openToEdit(int id) {
      list.changeState(todo_choices.edit);
      list.setIdToEdit(id);
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(title: Text('Edit ToDo')),
              body: Center(
                child: ToDoFormWidget(),
              ),
            );
          },
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      child: Consumer<ToDoModel>(builder: (context, todoList, child) {
        return ListView.builder(
          itemCount: tempList.length,
          itemBuilder: (context, index) {
            return ListTile(
                onTap: () => _openToEdit(tempList[index].id),
                title: Text('${tempList[index].todo}'),
                subtitle: Text('${tempList[index].id}'),
                trailing: Text('${tempList[index].details}'));
          },
        );
      }),
    );
  }
}
