import 'package:flutter/material.dart';

class BodyWidget extends StatelessWidget{
  List Data = [];
  BodyWidget(this.Data);
  @override
  Widget build(BuildContext context) {
    List<Widget> _list = new List();
    Data.forEach((item)=>{
      _list.add(buildListData(context,item))
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

  Widget buildListData(BuildContext context, Map<String, dynamic> item){

    var Status = "";
    var _color = Colors.black54;
    if (item["Online"] == true){
      Status = "设备在线";
    }else{
      Status = "设备离线";
      _color = Colors.red;
    }
    return new ListTile(
      isThreeLine: false,
      leading: new Icon(Icons.settings,textDirection: TextDirection.ltr),
      trailing: new Icon(Icons.arrow_forward_ios),
      title: new Text("设备名字:" + item["DeviceName"] + "--设备号:"+ item["DeviceNum"]),
      subtitle:new Text(Status, style: new TextStyle(
                  color: _color)) ,
      onTap: (){
        Navigator.of(context).pushNamed('/deviceinfo');
//        Navigator.of(context).pushReplacementNamed('/deviceinfo');
      },
    );
  }

}