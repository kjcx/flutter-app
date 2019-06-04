import 'package:flutter/material.dart';

class ListViewRow extends StatelessWidget {

  final _items = List<String>.generate(1000, (i) => "Item $i");
  final _fontSize = 18.0;
   Start(BuildContext context){
    print(context);
//    showDialog(
//        context: context,
//        builder: (context) => AlertDialog(
//          title: Text('登录成功'),
//        ));
  }
  void Stop(){
    print("stop");
  }
  void Fire(){
    print("fire");
  }
  @override
  Widget build(BuildContext context) {
    final _childList = <Widget>[
      getExpandedRow("风机反馈",Colors.red[500]),
      getExpandedRow("点火完成",Colors.red[500]),
      getExpandedRow("火焰反馈",Colors.red[500]),
    ];
    final _childList1 = <Widget>[
      getExpandedRow("运行状态",Colors.green[500]),
      getExpandedRow("变频故障",Colors.red[500]),
      getExpandedRow("点火指示",Colors.red[500]),
    ];
    final _childList2 = <Widget>[
      getExpandedMaterialButton("启动",Colors.red,context),
      getExpandedMaterialButton("停止",Colors.red,context),
      getExpandedMaterialButton("报警消音",Colors.red,context),
    ];
    final _childList3 = <Widget>[
      getRowContainer("温度上限", 100, 25),
      getRowContainer("设定温度", 100, 25),
      getRowContainer("风吹延时", 100, 25),
      getRowContainer("点火延时", 100, 25),
    ];
    final _childList4 = <Widget>[
      getRowContainerText("点火时间","1"),
      getRowContainerText("实际温度","100.0"),
      getRowContainerText("风机吹扫时间","10"),
      getRowContainerText("调节阀开度","20"),
    ];
    return  new Scaffold(
        appBar: new AppBar(
          title: new Text('天然气炉温控制系统'),
        ),
      resizeToAvoidBottomPadding: false, //输入框抵住键盘 内容不随键盘滚动
        backgroundColor: Colors.amber,
        body: new ListView(

          children: <Widget>[
            //add code
            titleSection(_childList),
            titleSection(_childList1),
            titleSection2(_childList2),
            titleSection3(_childList4,_childList3),
          ],
        ),
    );
  }
  final size = 18.0;
  //row 公共方法 第一排 第二排 内容
  Widget getExpandedRow(String name,Color _color){
    return  Expanded(
        child: Center(
            child: new Row(
                children: <Widget>[
                    new Text(name,style: new TextStyle(fontSize: size)),
                    new Icon(Icons.brightness_1,color: _color,size: 28),
                ]
            ),
        ),
    );
  }
  //row 点击按钮公共方法 中间点击按钮
  Widget getExpandedMaterialButton(String BtnName,Color _color,context){
   return Expanded(
      child: Center(
        child: new Row(
          children: <Widget>[
            new MaterialButton(
              color: _color,
              textColor: Colors.white,
              child: new Text(BtnName),
              onPressed: () {
                if (BtnName =="启动"){
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                    title: Text('登录成功'),
                    )
                  );
                }
                else if (BtnName == "停止"){
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('停止成功'),
                      )
                  );
                }
                else if (BtnName == "报警消音"){
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('报警消音成功'),
                      )
                  );
                }
              },
            )
          ],
        ),
      ),
      flex: 1,
    );
  }

    Widget titleSection(List<Widget> _childList) {

      return new Container(

        padding: const EdgeInsets.all(32.0),
        child: new Row(
          children: _childList,
        ),
      );
    }
    //点击启动事件
    Widget titleSection2( List<Widget> data) {
      return new Container(
        padding: const EdgeInsets.all(28.0),

        child: new Row(
          children: data
        ),
      );
    }
    //最下边右边可设置数值内容
    Widget getRowContainer(String text,double width,double height){
      return new Row(
        children: <Widget>[
          new Container(
            width: width, height: height,
            alignment: Alignment.bottomLeft,
            child: new Text(text,style: new TextStyle(fontSize: size,
                fontWeight: FontWeight.w700),),
          ),
          new Container(
              width: width-20, height: height,
              alignment: Alignment.bottomLeft,
              child: TextField(
                keyboardType: TextInputType.number,
                onSubmitted: (text) {//内容提交(按回车)的回调
                  print('submit $text');
                },
                enabled: true,//是否禁用
              )
          ),
        ],
      );
    }
    //最下边左边显示内容区域
    Widget getRowContainerText(String text,String value){
      return new Row(
        children: <Widget>[
          new Container(
            width:100,
            height: 25,
            alignment: Alignment.bottomLeft,
            child:new Text(text + ":",style: new TextStyle(fontSize: size,fontWeight: FontWeight.w700),),
          ),
          new Container(
            width:80,
            height: 25,
            alignment: Alignment.bottomLeft,
            child:new Text(value,style: new TextStyle(fontSize: size,fontWeight: FontWeight.w700),),
          ),
        ],
      );
    }
    //列数据
    Widget getColumn(List<Widget> data){
     return  new Column(
        children: data
      );
    }
    Widget titleSection3( List<Widget> data1 ,List<Widget> data) {
      return new Container(
        padding: const EdgeInsets.all(5.0),
//        width: 400.0,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Column(
              children: data1,
            ),
            getColumn(data),
          ],
        ),
      );
    }
  }
