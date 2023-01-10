class CommonResponse {
  String? address;
  String? id;
  double? latitude;
  double? longitude;
  double? distance;
  String? updatedAt;

  CommonResponse(
      {this.address, this.id, this.latitude, this.longitude, this.updatedAt,this.distance});

  CommonResponse.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    id = json['id'].toString();
    latitude = json['latitude'];
    longitude = json['longitude'];
    updatedAt = json['updated_at'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['id'] = this.id;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['updated_at'] = this.updatedAt;
    data['distance'] = this.distance;
    return data;
  }
}