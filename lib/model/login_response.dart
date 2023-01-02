class LoginData {
  Success? success;
  int? status;

  LoginData({this.success, this.status});

  LoginData.fromJson(Map<String, dynamic> json) {
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
  UserData? userData;

  Success({this.userData});

  Success.fromJson(Map<String, dynamic> json) {
    userData = json['userData'] != null
        ? new UserData.fromJson(json['userData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userData != null) {
      data['userData'] = this.userData!.toJson();
    }
    return data;
  }
}

class UserData {
  int? id;
  String? ownerName;
  String? vehiclePhoto;
  String? profilePhoto;
  String? address;
  String? phone;
  String? email;

  UserData(
      {this.id,
        this.ownerName,
        this.vehiclePhoto,
        this.profilePhoto,
        this.address,
        this.phone,
        this.email});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ownerName = json['owner_name'];
    vehiclePhoto = json['vehicle_photo'];
    profilePhoto = json['profile_photo'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['owner_name'] = this.ownerName;
    data['vehicle_photo'] = this.vehiclePhoto;
    data['profile_photo'] = this.profilePhoto;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['email'] = this.email;
    return data;
  }
}