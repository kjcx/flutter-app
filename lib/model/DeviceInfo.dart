class DeviceInfo {
  final String DeviceName;
  final String DeviceNum;
  final bool Online;
  final String Time;

  DeviceInfo(this.DeviceName, this.DeviceNum,this.Online,this.Time);

  DeviceInfo.fromJson(Map<String, dynamic> json)
      : DeviceNum = json['DeviceNum'],
        DeviceName = json['DeviceName'],
        Online = json['Online'],
        Time = json['Time'];

  Map<String, dynamic> toJson() =>
      {
        'DeviceNum': DeviceNum,
        'DeviceName': DeviceName,
        'Online': Online,
        'Time': Time,
      };
}
