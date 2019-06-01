import 'package:flutter/material.dart';

class ListViewRow extends StatelessWidget {

  final _items = List<String>.generate(1000, (i) => "Item $i");
  final _fontSize = 18.0;
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter base UI Widget',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('天然气炉温控制系统'),
        ),
        body: new ListView(
          children: <Widget>[
            //add code
            titleSection(_fontSize),
            titleSection1(_fontSize),
            titleSection2(_fontSize),
            titleSection3(_fontSize),
          ],
        ),
      ),
  );
  }

  Widget titleSection(double size) => new Container(
    padding: const EdgeInsets.all(32.0),

    child: new Row(
      children: <Widget>[
        Expanded(
          child: Center(
            child: new Row(
              children: <Widget>[
                new Text('风机反馈',style: new TextStyle(
                  fontSize: size,
                ),),
                new Icon(
                  Icons.brightness_1,
                  color: Colors.red[500],
                  size: 28,
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
                new Text('点火完成',style: new TextStyle(
                  fontSize: size,
                ),),
                new Icon(
                  Icons.brightness_1,
                  color: Colors.red[500],
                  size: 28,
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
                new Text('火焰反馈',style: new TextStyle(
                  fontSize: size,
                ),),
                new Icon(
                  Icons.brightness_1,
                  color: Colors.red[500],
                  size: 28,
                ),
              ],
            ),
          ),
          flex: 1,
        ),
      ],
    ),
  );
  Widget titleSection1( double size) {
    return new Container(
      padding: const EdgeInsets.all(32.0),

      child: new Row(
        children: <Widget>[
          Expanded(
            child: Center(
              child: new Row(
                children: <Widget>[
                  new Text('运行', style: new TextStyle(
                    fontSize: size,
                  ),),
                  new Icon(
                    Icons.brightness_1,
                    color: Colors.green,
                    size: 28,
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
                  new Text('变频故障', style: new TextStyle(
                    fontSize: size,
                  ),),
                  new Icon(
                    Icons.brightness_1,
                    color: Colors.red[500],
                    size: 28,
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
                  new Text('点火指示', style: new TextStyle(
                    fontSize: size,
                  ),),
                  new Icon(
                    Icons.brightness_1,
                    color: Colors.red[500],
                    size: 28,
                  ),
                ],
              ),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
  Widget titleSection2( double size) {
    return new Container(
      padding: const EdgeInsets.all(28.0),

      child: new Row(
        children: <Widget>[
          Expanded(
            child: Center(
              child: new Row(
                children: <Widget>[

                  new MaterialButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    child: new Text('启动'),
                    onPressed: () {
                      // ...
                    },
                  )
                ],
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Center(
              child: new Row(
                children: <Widget>[
                  new MaterialButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    child: new Text('停止'),
                    onPressed: () {
                      // ...
                    },
                  )
                ],
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Center(
              child: new Row(
                children: <Widget>[
                  new MaterialButton(
                    color: Colors.red,
                    textColor: Colors.white,
                    child: new Text('报警消音'),
                    onPressed: () {
                      // ...
                    },
                  )
                ],
              ),
            ),
            flex: 1,
          ),
//          Expanded(
//            child: Center(
//              child: new Row(
//                children: <Widget>[
//                  new RaisedButton(
//                    child: new Text('点我'),
//                    onPressed: () {},
//                  )
//                ],
//              ),
//            ),
//            flex: 1,
//          ),
          ],
      ),
    );
  }
  Widget titleSection3( double size) {
    return new Container(
      padding: const EdgeInsets.all(28.0),

      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Column(
          children: <Widget>[
              new Row(
                children: <Widget>[
                  new Text("点火时间1",style: new TextStyle(fontSize: size),textAlign: TextAlign.left,),new Text("1"),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Text("点火时间2",style: new TextStyle(fontSize: size),),new Text("1"),
                ],
              ),
            new Row(
              children: <Widget>[
                new Text("点火时间2",style: new TextStyle(fontSize: size),),new Text("1"),
              ],
            ),
            new Row(
              children: <Widget>[
                new Text("点火时间2",style: new TextStyle(fontSize: size),),new Text("1"),
              ],
            )

            ],
          ),
          new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Text("点火时间3",style: new TextStyle(fontSize: size),),new Text("1"),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Text("点火时间4",style: new TextStyle(fontSize: size),),new Text("1"),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Text("点火时间2",style: new TextStyle(fontSize: size),),new Text("1"),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Text("点火时间2",style: new TextStyle(fontSize: size),),new Text("1"),
                ],
              )

            ],
          ),
        ],
      ),
    );
  }

}