import 'package:json_annotation/json_annotation.dart'; 
  
part 'HomeDataModel.g.dart';


@JsonSerializable()
  class Entity extends Object {

  @JsonKey(name: 'Code')
  int code;

  @JsonKey(name: 'Data')
  List<Data> data;

  Entity(this.code,this.data,);

  factory Entity.fromJson(Map<String, dynamic> srcJson) => _$EntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$EntityToJson(this);

}

  
@JsonSerializable()
  class Data extends Object {

  @JsonKey(name: 'DeviceName')
  String deviceName;

  @JsonKey(name: 'Online')
  bool online;

  @JsonKey(name: 'DeviceNum')
  String deviceNum;

  @JsonKey(name: 'Time')
  String time;

  Data(this.deviceName,this.online,this.deviceNum,this.time,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

  
