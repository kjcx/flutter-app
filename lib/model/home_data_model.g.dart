// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDataModel _$HomeDataModelFromJson(Map<String, dynamic> json) {
  return HomeDataModel(
      json['Code'] as int,
      (json['Data'] as List)
          ?.map((e) =>
              e == null ? null : Data.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$HomeDataModelToJson(HomeDataModel instance) =>
    <String, dynamic>{'Code': instance.code, 'Data': instance.data};

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(json['DeviceName'] as String, json['Online'] as bool,
      json['DeviceNum'] as String, json['Time'] as String);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'DeviceName': instance.deviceName,
      'Online': instance.online,
      'DeviceNum': instance.deviceNum,
      'Time': instance.time
    };
