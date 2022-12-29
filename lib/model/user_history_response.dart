class UserHistoryResponse {
  Success? success;
  int? status;

  UserHistoryResponse({this.success, this.status});

  UserHistoryResponse.fromJson(Map<String, dynamic> json) {
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
  List<History>? history;

  Success({this.history});

  Success.fromJson(Map<String, dynamic> json) {
    if (json['history'] != null) {
      history = <History>[];
      json['history'].forEach((v) {
        history!.add(new History.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.history != null) {
      data['history'] = this.history!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class History {
  String? recDate;
  String? swapDate;
  String? batterySerialNo;
  String? address;

  History({this.recDate, this.swapDate, this.batterySerialNo, this.address});

  History.fromJson(Map<String, dynamic> json) {
    recDate = json['rec_date'];
    swapDate = json['swap_date'];
    batterySerialNo = json['battery_serial_no'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rec_date'] = this.recDate;
    data['swap_date'] = this.swapDate;
    data['battery_serial_no'] = this.batterySerialNo;
    data['address'] = this.address;
    return data;
  }
}