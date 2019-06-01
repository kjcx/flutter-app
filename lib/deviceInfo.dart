import 'package:flutter/material.dart';
import 'http.dart';
import 'package:dio/dio.dart';
import 'dart:async';
class DeviceInfoPageWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new DeviceInfoPageWidgetState();
  }
}

class DeviceInfoPageWidgetState extends State<DeviceInfoPageWidget>{
  TextEditingController _controller =TextEditingController();
  List<String> Info = [];
  List<String> KaiGuan = [];
  List<int> FuncValue = [];


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('设备详情'),
      ),
      body: new Center(
//        child: Icon(Icons.home,size: 130.0,color: Colors.blue,),
        child: buildGrid(context),
      ),
    );
  }
  Timer timer;
  @override
  void initState() {
    super.initState();
    getDeviceInfo();
    timer = new Timer.periodic(new Duration(seconds: 5), (timer) {
      getDeviceInfo();
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
    });
//  List  = response.data;
//  var user = new RespData.fromJson(userMap);
//  print(user);
//  print('Howdy, ${user.Code}!');
//  print('We sent the verification link to ${user.email}.');

  }
  List<String> getDataList() {
    List<String> list = [];
    List<String> listname = ["屏启动",
      "屏停止",
      "屏报警消音",
      "运行标识",
      "点火完成",
      "温度上限警告",
      "点火报警1",
      "点火报警2",
      "火灭报警",
      "风机反馈",
      "风机反馈",
      "火焰反馈",
      "变频故障",
      "点火反馈",
      "报警器",
      "开阀",
      "变频启停",
      "点火线圈",
      "吹扫延时设定",
      "点火延时设定",
      "设定温度",
      "温度上限",
      "实际温度",
      "调节阀开度输出",
      "风机吹扫延时",
      "点火延时",
    ];
    Map<int,String> map = listname.asMap();
//  print(map);
//  map.forEach((key,value)=>print("$key : $value"));
    for (int i = 0; i < 26; i++) {
      list.add(listname[i]);
    }

    return listname;
  }
  List<Widget> getWidgetList(BuildContext context) {
//   Info.forEach((item,dyn)=>getItemContainer(context, dyn, int.parse(item), dyn));
    var list = getDataList();
    var state = [
      "开启",
      "开启",
      "开启",
      "开启",
      "开启",
      "开启",
      "开启",
      "开启",
      "开启",
      "开启",
      "开启",
      "开启",
      "开启",
      "关闭",
      "关闭",
      "关闭",
      "关闭",
      "关闭",
      "1",
      "10",
      "100",
      "100",
      "11",
      "12",
      "13",
      "14",
    ];
    print("=====");
//     List<Container> aa;
//    list.asMap().forEach((int,item){
//      aa.add(getItemContainer(context, item, int, item));
//    });
//    return aa;
   var ll =  Info.map((item)=>getItemContainer(context, item, Info.indexOf(item), KaiGuan,FuncValue));

    print(ll);
    return ll.toList();
//  return getDataList().asMap().forEach((key,value)=>  getItemContainer(value));
//    List returnlist = list.map((item) => getItemContainer(context,item,list.indexOf(item),state[list.indexOf(item)])).toList();
//    print("returnlist");
//    print(returnlist);
//    return returnlist;
  }
  Widget buildGrid(BuildContext context) {
    return new GridView.extent(
        maxCrossAxisExtent: 100.0,
        padding: const EdgeInsets.all(3.0),
        mainAxisSpacing: 3.0,
        crossAxisSpacing: 3.0,
        children: getWidgetList(context));
  }

}







Widget getItemContainer(BuildContext context,String item, int indexOf,List<String>kaiguan,List<int>funvalue) {

  var blue;
  var status;
  if (indexOf <= 17) {
    if (kaiguan[indexOf] == "1") {
      status = "开";
    }else{
      status = "关";
    }

     blue = Colors.blue;
  }else{
    status = funvalue[indexOf-18].toString();
     blue = Colors.green;
  }
  return Container(
    alignment: Alignment.center,
//    child: Text(
//      item,
//      style: TextStyle(color: Colors.white, fontSize: 16),
//        maxLines:3,
//      textAlign:TextAlign.center,
//    ),
    child: new ListTile(
      isThreeLine: false,
//      leading: new Icon(Icons.arrow_forward),
      title: new Text(item,style: TextStyle(color: Colors.white, fontSize: 14),textAlign:TextAlign.center,),
//      trailing: new Icon(Icons.keyboard_arrow_right),
      subtitle: new Text( status,textAlign:TextAlign.center),

      onTap: () {
        // do something
        if (indexOf <= 17) {
          showAlertDialog(context,indexOf);
        }else{
          showAboutDialog(context,indexOf);
        }
      },
      onLongPress: (){
        print("onlongpress");
        // do something else
      },
    ),
    color: blue,


  );
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
}

