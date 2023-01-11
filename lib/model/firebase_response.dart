class FirbaseResponse {
  String? address;
  String? id;
  String? ownerName;
  double? latitude;
  double ? longitude;
  String? updatedAt;

  FirbaseResponse(
      {this.address, this.id, this.latitude, this.longitude, this.updatedAt ,this.ownerName});

  FirbaseResponse.fromJson(Map<String, dynamic> json) {
    address = json['address'].toString();
    id = json['id'].toString();
    ownerName = json['owner_name']??"";
    latitude = json['latitude']==0?0.0:json['latitude'];
    longitude = json['longitude']==0?0.0:json['longitude'];
    updatedAt = json['updated_at'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['id'] = this.id;
    data['ownerName'] = this.ownerName;
    data['latitude'] = this.latitude==0?0.0:this.latitude;
    data['longitude'] = this.longitude==0?0.0:this.longitude;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}