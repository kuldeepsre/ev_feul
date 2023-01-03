class LatLongResposne {
  Success? success;
  int? status;

  LatLongResposne({this.success, this.status});

  LatLongResposne.fromJson(Map<String, dynamic> json) {
    success =
    json['success'] != null ? new Success.fromJson(json['success']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.success != null) {
      data['success'] = this.success!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Success {
  List<LiveData>? data;

  Success({this.data});

  Success.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <LiveData>[];
      json['data'].forEach((v) {
        data!.add(new LiveData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LiveData {
  int? swapstationId;
  String? latitude;
  String? longitude;

  LiveData({this.swapstationId, this.latitude, this.longitude});

  LiveData.fromJson(Map<String, dynamic> json) {
    swapstationId = json['swapstation_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['swapstation_id'] = this.swapstationId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}