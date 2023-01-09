class FirbaseResponse {
  String? address;
  int? id;
  int? latitude;
  int? longitude;
  String? updatedAt;

  FirbaseResponse(
      {this.address, this.id, this.latitude, this.longitude, this.updatedAt});

  FirbaseResponse.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    id = json['id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['id'] = this.id;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}