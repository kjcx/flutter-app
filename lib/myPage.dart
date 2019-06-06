import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyPageWidgetState();
  }
}

class MyPageWidgetState extends State<MyPageWidget> {
  TextEditingController _userEtController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('我的'),
      ),
      body: new Center(child: new TextField(
        onTap: () {
          showMyMaterialDialog(context);
        },
      )),
    );
  }

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
  void loadData() async{
    String cssStr = await DefaultAssetBundle.of(context).loadString('json/HomeData.json');
    CommonModel model = CommonModel.fromJson(json.decode(cssStr));
    setState(() {
      List<dynamic>data = [];
      data.addAll(model.datas);
      dataList.addAll(data);//给数据源赋值
    });
  }
}
