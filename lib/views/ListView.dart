import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget {

  final _items = List<String>.generate(1000, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: 1000,
        itemBuilder: (context, idx) {
          return Container(
            padding: EdgeInsets.all(16.0),
            child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Text(
                _items[idx],
                style: new TextStyle(fontSize: 18.0, color: Colors.red),
              ),
              new Text(
                _items[idx],
                style: new TextStyle(fontSize: 18.0, color: Colors.green),
              ),
              new Text(
                _items[idx],
                style: new TextStyle(fontSize: 18.0, color: Colors.blue),
              ),
            ],
          ),
          );
        },
        separatorBuilder: (context, idx) => Divider());
  }
}