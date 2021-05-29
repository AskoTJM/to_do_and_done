import 'package:flutter/material.dart';

class DataTableWidget extends StatefulWidget {
  const DataTableWidget({Key? key, required this.timeTravel}) : super(key: key);
  final String timeTravel;

  @override
  _DataTableWidget createState() => _DataTableWidget();
}

class _DataTableWidget extends State<DataTableWidget> {
  static const int numItems = 10;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: 50,
              color: Colors.amber[600],
              child: const Center(child: Text("ds")),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry B')),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry C')),
            ),
          ],
        ));
  }
}
