import 'package:flutter/material.dart';
import '../http.dart';
import 'package:dio/dio.dart';
import 'dart:async';

String horseUrl = 'https://i.stack.imgur.com/Dw6f7.png';
String cowUrl = 'https://i.stack.imgur.com/XPOr3.png';
String camelUrl = 'https://i.stack.imgur.com/YN0m7.png';
String sheepUrl = 'https://i.stack.imgur.com/wKzo8.png';
String goatUrl = 'https://i.stack.imgur.com/Qt4JP.png';
class DeviceInfoPageWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new DeviceInfoPageWidgetState();
  }
}

class DeviceInfoPageWidgetState extends State<DeviceInfoPageWidget>{
  List<String> Info = [];
  List<String> KaiGuan = [];
  List<int> FuncValue = [];
  List<String> Item = [];
  List<dynamic> Data;
//  DeviceInfoPageWidgetState(this.Data);
  Timer timer;
  @override
  void initState() {
    super.initState();
    getDeviceInfo();
    timer = new Timer.periodic(new Duration(seconds: 5), (timer) {
//      getDeviceInfo();
    });

//    print(_data.length);
  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
  getDeviceInfo() async {
    List<String> KaiGuan2 = [];

    List<String> List2 = [];
    List<int> FuncValue2 = [];
    Response response;
    Dio dio = new Dio();
    response = await dio.post("http://139.129.119.229:8088/result", data: {});
    var userMap = response.data;

    for (int i = 0; i < userMap["MapData"].length; i++) {
      List2.add(userMap["MapData"][i]);
    }
    print(userMap["KaiGuan"]);
    for (int i = 0; i < userMap["KaiGuan"].length; i++) {
      KaiGuan2.add(userMap["KaiGuan"][i]);
    }

    for (int i = 0; i < userMap["FuncValue"].length; i++) {
      FuncValue2.add(userMap["FuncValue"][i]);
    }

    setState(() {
      Info = List2;
      KaiGuan = KaiGuan2;
      FuncValue = FuncValue2;
      Item = List2;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('设备详情new'),
      ),
      body: new Center(
          
          child: new Row(        //行控件
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,      //对齐方式：平均间隔
              children: [
                Text("风机反馈"),
                Text("点火完成"),
                Text("火焰反馈"),
              ]
          )
    ),
    );
  }




  Widget getItemContainer(String item) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        item,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      color: Colors.blue,
    );
  }

}







void showAboutDialog(BuildContext context,int indexOf) {
//  设置textfield使用的控制器对象
  TextEditingController _controller =TextEditingController();
  showDialog(
      context: context,
      builder: (_) =>  AlertDialog(
        title: new Text("设置"),
        content: TextField(
          controller: _controller,//设置控制器，这个控制器能获取输入框内容

          decoration: InputDecoration(//设置输入框装饰器
              icon: Icon(Icons.home),
              contentPadding: EdgeInsets.all(10.0),//内容内边距
              labelText: "请输入数值",
              helperText: "",
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            onPressed: () {
              print("确定");
              if (_controller.text.isEmpty) {
                Navigator.of(context).pop();
              }else{
                print({"请求接口:":_controller.text});
                postHttp(indexOf,int.parse(_controller.text));
              }
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
      ));
}
void showAlertDialog(BuildContext context,int indexOf) {
  showDialog<Null>(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text('选择'),
        children: <Widget>[
          SimpleDialogOption(
            child: Text('开启'),
            onPressed: () {
              postHttp(indexOf,1);
              Navigator.of(context).pop();
            },
          ),
          SimpleDialogOption(
            child: Text('关闭'),
            onPressed: () {
              postHttp(indexOf,0);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
  TextEditingController _userEtController = TextEditingController();
  void showMyMaterialDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return new AlertDialog(
            title: new Text("请输入"),
            content: new TextField(
              autofocus: true,
              controller: _userEtController,
              keyboardType:TextInputType.number,
              
              ),
              actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  print(_userEtController.text);
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



