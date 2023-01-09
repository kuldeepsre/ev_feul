class FirbaseResponse {
  String? address;
  String? id;
  double? latitude;
  double ? longitude;
  String? updatedAt;

  FirbaseResponse(
      {this.address, this.id, this.latitude, this.longitude, this.updatedAt});

  FirbaseResponse.fromJson(Map<String, dynamic> json) {
    address = json['address'].toString();
    id = json['id'].toString();
    latitude = json['latitude']==0?0.0:json['latitude'];
    longitude = json['longitude']==0?0.0:json['longitude'];
    updatedAt = json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['id'] = this.id;
    data['latitude'] = this.latitude==0?0.0:this.latitude;
    data['longitude'] = this.longitude==0?0.0:this.longitude;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}