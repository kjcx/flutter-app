import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ListViewRow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ListViewRowItem();
  }
}

class ListViewRowItem extends State<ListViewRow> {
	final _fontSize = 18.0;
	List<Widget> _list = [];
	List<Widget> _listbtn = [];
	List<Widget> _listreadvalue = [];
	
  //        builder: (context) => AlertDialog(
  	Timer timer;

  SendCmd(BuildContext context,int address,int value) async {
    print(context);
	Response response;
    Dio dio = new Dio();
    response = await dio.post("http://192.168.31.64:8088/write", data: {"Id":address,"Value":value});
    var userMap = response.data;
//    showDialog(
//        context: context,
//          title: Text('登录成功'),
//        ));
  }


  @override
  void initState() {
    super.initState();
	getPlcList();
	 timer = new Timer.periodic(new Duration(seconds: 5), (timer) {
		getPlcList();
    });

    

  }

  getPlcList() async {
	final List<Map<String, dynamic>> plclist = [];
	final List<Map<String, dynamic>> plclistbtn = [];
	final List<Map<String, dynamic>> plclistreadvalue = [];
	final List<Map<String, dynamic>> plclistwritevalue = [];
    Response response;
    Dio dio = new Dio();
    response = await dio.post("http://192.168.31.64:8088/myplc", data: {"PlcAddress":"02"});
    var userMap = response.data;

    print(userMap["Points"]);
    var Points = userMap["Points"];
    for (var i = 0; i < Points.length; i++) {
	  print(Points[i]["FunType"]);
		if (Points[i]["FunType"] == "read" &&
			Points[i]["FunRead"] == 1) {
			plclist.add(Points[i]);
		} else if (Points[i]["FunType"] == "button") {
			plclistbtn.add(Points[i]);
		}else if (Points[i]["FunType"] == "read" && Points[i]["FunRead"] == 3 ){
          plclistreadvalue.add(Points[i]);
      	}else if (Points[i]["FunType"] == "write" && Points[i]["FunRead"] == 3 ){
          plclistwritevalue.add(Points[i]);
      	}
    }
    List<Widget> _list1 = [];
	List<Widget> _listbtn1 = [];
    for (var i = 0; i < plclist.length; i++) {
      if (i % 3 == 0) {
        final List<Widget> ExpandedRow = [];
        ExpandedRow.add(getExpandedRow(plclist[i]));
        ExpandedRow.add(getExpandedRow(plclist[i + 1]));
        ExpandedRow.add(getExpandedRow(plclist[i + 2]));
        _list1.add(titleSection(ExpandedRow));
      }
    }
	for (var i=0;i<plclistbtn.length;i++){
		if (i % 3 == 0) {
        final List<Widget> ExpandedRow = [];
        ExpandedRow.add(getExpandedMaterialButton(plclistbtn[i],context));
        ExpandedRow.add(getExpandedMaterialButton(plclistbtn[i + 1],context));
        ExpandedRow.add(getExpandedMaterialButton(plclistbtn[i + 2],context));
        _list1.add(titleSection(ExpandedRow));
      }
		
	}
	print("plclistreadvalue");
	print(plclistreadvalue.length);
        final List<Widget> ExpandedRow1 = [];
	
	for (var i=0;i<plclistreadvalue.length;i++){
		if (i % 4 == 0) {
        ExpandedRow1.add(getRowContainerText(plclistreadvalue[i]));
        ExpandedRow1.add(getRowContainerText(plclistreadvalue[i + 1]));
        ExpandedRow1.add(getRowContainerText(plclistreadvalue[i + 2]));
		    ExpandedRow1.add(getRowContainerText(plclistreadvalue[i + 3]));
        // _list1.add(getColumn(ExpandedRow));
      }
		
	}
        final List<Widget> ExpandedRow2 = [];

	for (var i=0;i<plclistwritevalue.length;i++){
		if (i % 4 == 0) {
        ExpandedRow2.add(getRowContainer(plclistwritevalue[i],context));
        ExpandedRow2.add(getRowContainer(plclistwritevalue[i + 1],context));
        ExpandedRow2.add(getRowContainer(plclistwritevalue[i + 2],context));
		    ExpandedRow2.add(getRowContainer(plclistwritevalue[i + 3],context));
        // _list1.add(getColumn(ExpandedRow));
      }
		
	}
	_list1.add(titleSection3(ExpandedRow1,ExpandedRow2));
	
    setState(() {
      // mounted 为 true 表示当前页面挂在到构件树中，为 false 时未挂载当前页面
      if (!mounted) {
        return;
      }
      _list = _list1;
    });
  }
  @override
  void dispose(){
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('天然气炉温控制系统'),
      ),
      resizeToAvoidBottomPadding: false, //输入框抵住键盘 内容不随键盘滚动
      backgroundColor: Colors.amber,
      body: new ListView(
        children: _list,
      ),
    );
  }

  final size = 18.0;
  //row 公共方法 第一排 第二排 内容
  Widget getExpandedRow(Map<String, dynamic> item) {
    var _color;
    if (item["Value"] == 0) {
      _color = Colors.red[500];
    } else {
      _color = Colors.green[500];
    }
    return Expanded(
      child: Center(
        child: new Row(children: <Widget>[
          new Text(item["Name"], style: new TextStyle(fontSize: size)),
          new Icon(Icons.brightness_1, color: _color, size: 28),
        ]),
      ),
    );
  }

  //row 点击按钮公共方法 中间点击按钮
  Widget getExpandedMaterialButton(Map<String,dynamic> item, context) {
	  var _color = Colors.red;
	  var BtnName = item["Name"];
    return Expanded(
      child: Center(
        child: new Row(
			mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new MaterialButton(
              color: _color,
              textColor: Colors.white,
              child: new Text(BtnName),
              onPressed: () {
                if (BtnName == "屏启动") {
					SendCmd(context,item["ModbusAddress"],1);
                //   showDialog(
                //       context: context,
                //       builder: (context) => AlertDialog(
                //             title: Text('登录成功'),
                //           ));
                } else if (BtnName == "屏停止") {
					SendCmd(context,item["ModbusAddress"],0);
                //   showDialog(
                //       context: context,
                //       builder: (context) => AlertDialog(
                //             title: Text('停止成功'),
                //           ));
                } else if (BtnName == "屏报警消音") {
					SendCmd(context,item["ModbusAddress"],0);
                //   showDialog(
                //       context: context,
                //       builder: (context) => AlertDialog(
                //             title: Text('报警消音成功'),
                //           ));
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
  Widget titleSection2(List<Widget> data) {
    return new Container(
      padding: const EdgeInsets.all(28.0),
      child: new Row(children: data),
    );
  }
	var width = 100.0;
	var height = 25.0;
  //最下边右边可设置数值内容
  Widget getRowContainer(
      Map<String,dynamic> item,  BuildContext context) {
  TextEditingController _userEtController1 = TextEditingController();
    return new Row(
      children: <Widget>[
        new Container(
          width: width,
          height: height,
          alignment: Alignment.bottomLeft,
          child: new Text(
            item["Name"],
            style: new TextStyle(fontSize: size, fontWeight: FontWeight.w700),
          ),
        ),
        new Container(
            width: width - 20,
            height: height,
            alignment: Alignment.bottomLeft,
            child: TextField(
				controller: _userEtController1,
				style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),//输入文本的样式
				decoration: InputDecoration.collapsed(
					hintText: item["Value"].toString()),
              onTap: () {
				  print(item["ModbusAddress"]);
                showMyMaterialDialog(context,_userEtController1,item["ModbusAddress"]);
              },
            )),
      ],
    );
  }

  //最下边左边显示内容区域
  Widget getRowContainerText(Map<String,dynamic> item) {
    return new Row(
      children: <Widget>[
        new Container(
          width: 100,
          height: 25,
          alignment: Alignment.bottomLeft,
          child: new Text(
            item["Name"] + ":",
            style: new TextStyle(fontSize: size, fontWeight: FontWeight.w700),
          ),
        ),
        new Container(
          width: 80,
          height: 25,
          alignment: Alignment.bottomLeft,
          child: new Text(
            item["Value"].toString(),
            style: new TextStyle(fontSize: size, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }

  //列数据
  Widget getColumn(List<Widget> data) {
    return new Column(children: data);
  }

  Widget titleSection3(List<Widget> data1, List<Widget> data) {
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

  TextEditingController _userEtController = TextEditingController();
  void showMyMaterialDialog(BuildContext context,TextEditingController controller,int address) {
    showDialog(
        context: context,
        builder: (context) {
          return new AlertDialog(
            title: new Text("请输入"),
            content: new TextField(
              autofocus: true,
              controller: _userEtController,
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  print(_userEtController.text);
				  controller.text = _userEtController.text;
				  SendCmd(context, address, int.parse(_userEtController.text));
                  Navigator.of(context).pop();
                },
                child: new Text("确认"),
              ),
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: new Text("取消"),
              ),
            ],
          );
        });
  }
}
