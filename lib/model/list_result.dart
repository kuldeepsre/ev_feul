class ParkingResponseList {
  bool? status;
  int? statusCode;
  List<ParkingListResult>? preslut;

  ParkingResponseList({this.status, this.statusCode, this.preslut});

  ParkingResponseList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    if (json['result'] != null) {
      preslut = <ParkingListResult>[];
      json['result'].forEach((v) {
        preslut!.add(ParkingListResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['statusCode'] = statusCode;
    if (preslut != null) {
      data['result'] = preslut!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ParkingListResult {
  String? vehicleNumber;
  String? driverName;
  String? driverMobNumber;
  List<String>? status;
  String? lastParkingAllotted;
  int? vehicleAutoId;

  ParkingListResult(
      {this.vehicleNumber,
        this.driverName,
        this.driverMobNumber,
        this.status,
        this.lastParkingAllotted,
        this.vehicleAutoId});

  ParkingListResult.fromJson(Map<String, dynamic> json) {
    vehicleNumber = json['vehicle_number'];
    driverName = json['driver_name'];
    driverMobNumber = json['driver_mob_number'];
    status =json['status']=="NA"?["NA"]:json['status'].cast<String>();
    lastParkingAllotted = json['last_parking_allotted'];
    vehicleAutoId = json['vehicle_auto_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vehicle_number'] = vehicleNumber;
    data['driver_name'] = driverName;
    data['driver_mob_number'] = driverMobNumber;
    data['status'] = status;
    data['last_parking_allotted'] = lastParkingAllotted;
    data['vehicle_auto_id'] = vehicleAutoId;
    return data;
  }
}