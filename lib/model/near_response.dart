class NearLocationsResponse {
  Success? success;
  int? status;

  NearLocationsResponse({this.success, this.status});

  NearLocationsResponse.fromJson(Map<String, dynamic> json) {
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
  List<Data>? data;

  Success({this.data});

  Success.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class Data {
  int? id;
  String? latitude;
  String? longitude;
  String? ownerName;
  String? distance;
  String? address;

  Data({this.id, this.latitude, this.longitude, this.ownerName, this.distance ,this.address});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    ownerName = json['owner_name'];
    distance = json['distance'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['owner_name'] = ownerName;
    data['distance'] = distance;
    data['address'] = address;
    return data;
  }
}