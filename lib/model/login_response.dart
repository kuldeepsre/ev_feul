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
  String? evNumber;
  String? password;
  String? ownerName;
  String? evRcCopy;
  String? idProof;
  String? vehiclePhoto;
  int? status;
  String? address;
  String? phone;
  String? email;
  String? createdAt;
  String? updatedAt;

  UserData(
      {this.id,
        this.evNumber,
        this.password,
        this.ownerName,
        this.evRcCopy,
        this.idProof,
        this.vehiclePhoto,
        this.status,
        this.address,
        this.phone,
        this.email,
        this.createdAt,
        this.updatedAt});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    evNumber = json['ev_number'];
    password = json['password'];
    ownerName = json['owner_name'];
    evRcCopy = json['ev_rc_copy'];
    idProof = json['id_proof'];
    vehiclePhoto = json['vehicle_photo'];
    status = json['status'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ev_number'] = this.evNumber;
    data['password'] = this.password;
    data['owner_name'] = this.ownerName;
    data['ev_rc_copy'] = this.evRcCopy;
    data['id_proof'] = this.idProof;
    data['vehicle_photo'] = this.vehiclePhoto;
    data['status'] = this.status;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}