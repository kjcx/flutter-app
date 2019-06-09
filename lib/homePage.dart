import 'dart:convert';

import 'package:app/model/home_data_model.dart';
import 'package:flutter/material.dart';
import 'views/ListViewRow.dart';
import 'views/listViewListTile.dart';
import 'package:dio/dio.dart';
class HomePageWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new HomePageWidgetState();
  }
}

class HomePageWidgetState extends State<HomePageWidget>{
  List _list = [];


//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('首页'),
//      ),
//      body: new Center(
//        child: Icon(Icons.home,size: 130.0,color: Colors.blue,),
//      ),
//    );
//  }
  @override
  void initState() {
    super.initState();
    getDeviceList();
  }
  getDeviceList() async {
    Response response;
    Dio dio = new Dio();
    response = await dio.post("http://139.129.119.229:8088/list", data: {});
  HomeDataModel model = HomeDataModel.fromJson(response.data);
    print(model.data[0]);
    var userMap = response.data;
    
    setState(() {
      _list = userMap["Data"];
    });
  }

  @override
  Widget build(BuildContext context) {
//    for (int i = 0; i < 100; i++) {
//      Map<String,String> Item = new Map();
//      Item["DeviceName"] = "DeviceName222" +i.toString();
//      Item["DeviceNum"] = "DeviceNum111";
//      _list.add(Item);
//    }
    return MaterialApp(
        title: '首页',
        routes: <String, WidgetBuilder> {
          '/deviceinfo': (_) => new ListViewRow(),
//          '/deviceinfo': (_) => new DeviceInfoPageWidget(),
        },
        home: Scaffold(
            appBar: AppBar(
              title: Text('设备列表'),
            ),
            body: BodyWidget(_list)));
  }
}

