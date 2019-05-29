import 'package:dio/dio.dart';
import 'dart:convert';
import 'model/DeviceInfo.dart';
import 'user.dart';
import 'model/DeviceInfo.dart';
void getHttp() async {
  try {
    Response response = await Dio().get("http://139.129.119.229:8088/test");
    print(response.data);
  } catch (e) {
    print(e);
  }
}

void postHttp(int key,int value) async {
  Response response;
  Dio dio = new Dio();
  response = await dio.post("http://139.129.119.229:8088/test", data: {"id": key, "value": value});


//  Map userMap = jsonDecode(response.data.toString());
  Map userMap = response.data;
  print(userMap);
  var user = new User.fromJson(userMap);

  print('Howdy, ${user.name}!');
  print('We sent the verification link to ${user.email}.');

}
Future<Map>  getDeviceList(int key,int value) async {
  Response response;
  Dio dio = new Dio();
  response = await dio.post("http://139.129.119.229:8088/list", data: {"id": key, "value": value});
//  Map List = Map<int,DeviceInfo>();

  var userMap = response.data;
  print(userMap["Code"]);
  return userMap;
//  List  = response.data;
//  var user = new RespData.fromJson(userMap);
//  print(user);
//  print('Howdy, ${user.Code}!');
//  print('We sent the verification link to ${user.email}.');

}