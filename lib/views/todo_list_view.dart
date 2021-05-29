import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_and_done/models/todomodel.dart';

class DataTableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = context.watch<ToDoModel>();
    var tempList = list.getListByStatus();

    return SizedBox(
      width: double.infinity,
      child: Consumer<ToDoModel>(builder: (context, todoList, child) {
        return ListView.builder(
          itemCount: tempList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${tempList[index].todo}'),
            );
          },
        );
      }),
    );
  }
}
