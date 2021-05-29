import 'package:flutter/material.dart';

class ToDoFormWidget extends StatefulWidget {
  const ToDoFormWidget({Key? key}) : super(key: key);

  @override
  _ToDoFormWidget createState() => _ToDoFormWidget();
}

class _ToDoFormWidget extends State<ToDoFormWidget> {
  String dropdownValue = 'ToDo';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            margin: new EdgeInsets.all(10),
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'What ToDo',
              ),
            ),
          ),
          Container(
            margin: new EdgeInsets.all(10),
            child: const TextField(
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
                onPressed: (() => Navigator.pop(context)),
                child: const Text('Save'),
              ),
              ElevatedButton(
                onPressed: (() => Navigator.pop(context)),
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
