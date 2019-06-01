import 'package:flutter/material.dart';
class LearnText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),

      child: new Row(
          children: <Widget>[
            Expanded(
              child: Center(
                child: new Row(
                  children: <Widget>[
                    new Text('风机反馈'),
                    new Icon(
                      Icons.brightness_1,
                      color: Colors.red[500],
                    ),
                  ],
                ),
              ),
              flex: 1,
            ),
            Expanded(
              child: Center(
                child: new Row(
                  children: <Widget>[
                    new Text('点火完成'),
                    new Icon(
                      Icons.brightness_1,
                      color: Colors.red[500],
                    ),
                  ],
                ),
              ),
              flex: 1,
            ),
            Expanded(
              child: Center(
                child: new Row(
                  children: <Widget>[
                    new Text('火焰反馈'),
                    new Icon(
                      Icons.brightness_1,
                      color: Colors.red[500],
                    ),
                  ],
                ),
              ),
              flex: 1,
            ),
          ],
      ),
    );

    return new MaterialApp(
      title: 'Flutter base UI Widget',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('天然气炉温控制系统'),
        ),
        body: new ListView(
          children: <Widget>[
            //add code
            titleSection,
            titleSection
          ],
        ),
      ),
    );
  }
}