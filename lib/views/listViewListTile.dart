import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart';


class BodyWidget extends StatelessWidget{
  List<dynamic> Data;
  BodyWidget(this.Data);
  @override
  Widget build(BuildContext context) {
    List<Widget> _list = new List();
    Data.forEach((Item)=>{
      _list.add(buildListData(context,Item))
    });
    return new ListView.builder(
      itemCount: _list.length,
      itemBuilder: (context, index) {
      return new Container(
        child: new Column(
          children: <Widget>[
            buildListData(context,this.Data[index]),
            new Divider(),
          ],
          ),
        );
      },
    );
    return ListView(
      children: _list,
    );
  }

  Widget buildListData(BuildContext context, Map<String,dynamic> Item){
    var Status = "";
    if (Item["Online"] == true){
      Status = "设备在线";
    }else{
      Status = "设备离线";
    }
    return new ListTile(
      isThreeLine: false,
      leading: new Icon(Icons.settings,),
      trailing: new Icon(Icons.arrow_forward_ios),
      title: new Text("设备名字:" + Item["DeviceName"] + "--设备号:"+ Item["DeviceNum"]),
      subtitle:new Text(Status, style: new TextStyle(
                  color: Colors.black54)) ,
      onTap: (){
        Navigator.of(context).pushNamed('/deviceinfo');
//        Navigator.of(context).pushReplacementNamed('/deviceinfo');
      },
    );
  }

}