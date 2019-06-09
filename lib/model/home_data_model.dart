import 'package:json_annotation/json_annotation.dart'; 
  
part 'home_data_model.g.dart';


@JsonSerializable()
  class HomeDataModel extends Object {

  @JsonKey(name: 'Code')
  int code;

  @JsonKey(name: 'Data')
  List<Data> data;

  HomeDataModel(this.code,this.data,);

  factory HomeDataModel.fromJson(Map<String, dynamic> srcJson) => _$HomeDataModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeDataModelToJson(this);

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

  
