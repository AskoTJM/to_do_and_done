import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/todomodel.dart';

class ToDoFormWidget extends StatefulWidget {
  const ToDoFormWidget({Key? key}) : super(key: key);

  @override
  _ToDoFormWidget createState() => _ToDoFormWidget();
}

class _ToDoFormWidget extends State<ToDoFormWidget> {
  String dropdownValue = 'ToDo';
  TextEditingController _todoTextController = TextEditingController();
  TextEditingController _detailsTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var list = context.watch<ToDoModel>();
    var todoToEdit = list.getById(list.getIdToEdit());
    _todoTextController.text = todoToEdit.todo;
    _detailsTextController.text = todoToEdit.details;

    void _returnToMain() {
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
                onPressed: () => _returnToMain(),
                child: const Text('Save'),
              ),
              ElevatedButton(
                onPressed: () => _returnToMain(),
                child: const Text('Cancel'),
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
