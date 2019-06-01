import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart';

import 'http.dart';
class BusinessPageWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
//    return new BusinessPageWidgetState();
    return new MyList();
  }
}

class MyList extends State<BusinessPageWidget>{
  List<Widget> _list = new List();
  List<String> DeviceList = [];
  List<String> DeviceList1 = [];
  List<String> OnlineName = [];
  Widget buildListData(BuildContext context, String strItem, Icon iconItem,String Online) {
    return new ListTile(
      isThreeLine: false,
      leading: iconItem,
      title: new Text(strItem),
      trailing: new Icon(Icons.keyboard_arrow_right),
      subtitle: new Text(Online),
      onTap: () {
        Navigator.of(context).pushNamed('/deviceinfo');
//        showDialog(
//          context: context,
//          builder: (BuildContext context) {
//            return new AlertDialog(
//              title: new Text(
//                'ListViewDemo',
//                style: new TextStyle(
//                  color: Colors.black54,
//                  fontSize: 18.0,
//                ),
//              ),
//              content: new Text('您选择的item内容为:$strItem'),
//            );
//          },
//        );
      },
    );
  }
  @override
  void initState() {
    super.initState();
    getDeviceList(1,2);
//    print(_data.length);
  }
  getDeviceList(int key,int value) async {
    Response response;
    Dio dio = new Dio();
    response = await dio.post("http://139.129.119.229:8088/list", data: {"id": key, "value": value});
//  Map List = Map<int,DeviceInfo>();

    var userMap = response.data;
    print(userMap["Code"]);
    for (int i = 0; i < userMap["Data"].length; i++) {
      Map info =  userMap["Data"][i];
//        _list.add(buildListData(context, info["DeviceName"], iconItems[i]));
      DeviceList1.add(info["DeviceName"] + "(" + info["DeviceNum"] + ")");
      if (info["Online"] == true) {
        OnlineName.add("设备在线");

      }else{
        OnlineName.add("设备离线");

      }
    }
//    return userMap;
  setState(() {
    DeviceList = DeviceList1;
    OnlineName = OnlineName;
    print(DeviceList);
//    DeviceList = userMap;
  });
//  List  = response.data;
//  var user = new RespData.fromJson(userMap);
//  print(user);
//  print('Howdy, ${user.Code}!');
//  print('We sent the verification link to ${user.email}.');

  }
  @override
  Widget build(BuildContext context)  {
    List<String> strItems = <String>[

      '图标1 -> keyboard', '图标2 -> print',
//      '图标 -> router', '图标 -> pages',
//      '图标 -> zoom_out_map', '图标 -> zoom_out',
//      '图标 -> youtube_searched_for', '图标 -> wifi_tethering',
//      '图标 -> wifi_lock', '图标 -> widgets',
//      '图标 -> weekend', '图标 -> web',
//      '图标 -> accessible', '图标 -> ac_unit',
    ];


      // ignore: unnecessary_statements
//    getDeviceList(1,2);
    
    List<Icon> iconItems = <Icon>[
      new Icon(Icons.keyboard),
      new Icon(Icons.print),
//      new Icon(Icons.router), new Icon(Icons.pages),
//      new Icon(Icons.zoom_out_map), new Icon(Icons.zoom_out),
//      new Icon(Icons.youtube_searched_for), new Icon(Icons.wifi_tethering),
//      new Icon(Icons.wifi_lock), new Icon(Icons.widgets),
//      new Icon(Icons.weekend), new Icon(Icons.web),
//      new Icon(Icons.accessible), new Icon(Icons.ac_unit),
    ];



//    var divideList =
//    ListTile.divideTiles(context: context, tiles: _list).toList();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('设备列表'),
      ),

      body: new Scrollbar(
        child: new ListView.builder(
          itemCount: DeviceList.length,
          itemBuilder: (context, item) {
            return new Container(
              child: new Column(
                children: <Widget>[
                  buildListData(context, DeviceList[item], iconItems[item],OnlineName[item]),
                  new Divider()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
class BusinessPageWidgetState extends State<BusinessPageWidget>{

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('商业'),
      ),
      body: new Center(
//        child: Icon(Icons.business,size: 130.0,color: Colors.blue,),
        child: new ListView(
    //控制方向 默认是垂直的
//           scrollDirection: Axis.horizontal,
        children: <Widget>[
        _getContainer('设备一', Icons.arrow_forward_ios),
          _getContainer('设备二', Icons.arrow_forward_ios),
          _getContainer('设备三', Icons.arrow_forward_ios),
        ],),
      ),
    );
  }

}

/**
 * 垂直listView
 */


  /**
   * 抽取item项
   */
  Widget _getContainer(String test, IconData icon) {

    return new Container(
      width: 160.0,
//      ListTile
      child: new ListTile(
//       显示在title之前
        leading: new Icon(Icons.airplay),
//        显示在title之后
        trailing: new Icon(icon),
        title: new Text(test),
        subtitle:new Text("我是subtitle") ,
//        onTap: ()=> test(),

      ),

    );
  }
