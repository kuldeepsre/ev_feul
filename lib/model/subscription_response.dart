class SubscriptionResponse {
  String? success;
  int? status;

  SubscriptionResponse({this.success, this.status});

  SubscriptionResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    return data;
  }
}