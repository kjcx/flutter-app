import 'package:flutter/material.dart';
import 'http.dart';
class DeviceInfoPageWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new DeviceInfoPageWidgetState();
  }
}

class DeviceInfoPageWidgetState extends State<DeviceInfoPageWidget>{
  TextEditingController _controller =TextEditingController();
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
//  return getDataList().asMap().forEach((key,value)=>  getItemContainer(value));
      return getDataList().map((item) => getItemContainer(context,item,list.indexOf(item),state[list.indexOf(item)])).toList();
}



Widget getItemContainer(BuildContext context,String item, int indexOf,String status ) {

  var blue;
  if (indexOf <= 17) {
     blue = Colors.blue;
  }else{
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
Widget buildGrid(BuildContext context) {
  return new GridView.extent(
      maxCrossAxisExtent: 100.0,
      padding: const EdgeInsets.all(3.0),
      mainAxisSpacing: 3.0,
      crossAxisSpacing: 3.0,
      children: getWidgetList(context));
}
//
//@override
//Widget buildGrid(BuildContext context) {
//  // TODO: implement build
//  return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("GridView"),
//      ),
//      body:new GridView.extent(
//          maxCrossAxisExtent: 100.0,
//          padding: const EdgeInsets.all(3.0),
//          mainAxisSpacing: 3.0,
//          crossAxisSpacing: 3.0,
//          children: getWidgetList(context),
//      )
//  );

//}
