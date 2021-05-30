import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_and_done/consts/consts.dart';
import 'package:to_do_and_done/models/todo_class.dart';
import 'package:to_do_and_done/models/todomodel.dart';

class ToDoFormWidget extends StatefulWidget {
  const ToDoFormWidget({Key? key}) : super(key: key);

  @override
  _ToDoFormWidget createState() => _ToDoFormWidget();
}

class _ToDoFormWidget extends State<ToDoFormWidget> {
  String dropdownValue = 'ToDo';
  TextEditingController _todoTextController = TextEditingController();
  TextEditingController _detailsTextController = TextEditingController();
  int idEditing = -1;

  @override
  Widget build(BuildContext context) {
    var list = context.watch<ToDoModel>();
    if (list.getState() == todo_choices.edit) {
      var _todoToEdit = list.getById(list.getIdToEdit());
      _todoTextController.text = _todoToEdit.todo;
      _detailsTextController.text = _todoToEdit.details;
      idEditing = _todoToEdit.id;
    }

    void _cancelAndReturnToMain() {
      (list.getState() == todo_choices.edit) ? list.deleteTodo(idEditing) : "";
      var prevState = list.getPrevState();
      list.changeState(prevState);
      Navigator.pop(context);
    }

    void _saveAndReturnToMain() {
      todo_choices statusSwitch = todo_choices.todo;
      if (dropdownValue == "Doing") statusSwitch = todo_choices.doing;
      if (dropdownValue == "Done") statusSwitch = todo_choices.done;

      var todo = Todo(
        id: idEditing,
        todo: _todoTextController.text,
        details: _detailsTextController.text,
        status: statusSwitch,
      );
      (idEditing == -1) ? list.addToList(todo) : list.updateTodo(todo);
      var prevState = list.getPrevState();
      list.changeState(prevState);
      Navigator.pop(context);
    }

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            margin: new EdgeInsets.all(10),
            child: TextFormField(
              controller: _todoTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'What ToDo',
              ),
            ),
          ),
          Container(
            margin: new EdgeInsets.all(10),
            child: TextFormField(
              controller: _detailsTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Details',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _saveAndReturnToMain(),
                child: const Text('Save'),
              ),
              ElevatedButton(
                onPressed: () => _cancelAndReturnToMain(),
                child: (list.getState() == todo_choices.add)
                    ? const Text('Cancel')
                    : const Text('Delete'),
              ),
              Container(
                child: DropdownButton<String>(
                  value: dropdownValue,
                  dropdownColor: Colors.orangeAccent,
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['ToDo', 'Doing', 'Done']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
