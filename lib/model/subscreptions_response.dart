class SubscriptionsPlanResponse {
  List<SuccessData>? success;
  int? status;

  SubscriptionsPlanResponse({this.success, this.status});

  SubscriptionsPlanResponse.fromJson(Map<String, dynamic> json) {
    if (json['success'] != null) {
      success = <SuccessData>[];
      json['success'].forEach((v) {
        success!.add(new SuccessData.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.success != null) {
      data['success'] = this.success!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class SuccessData {
  String? planName;
  String? planPrice;
  String? description;
  String? validityDays;
  String? freeSwap;
  String? ratePerSwap;
  String? userStatus;

  SuccessData(
      {this.planName,
        this.planPrice,
        this.description,
        this.validityDays,
        this.freeSwap,
        this.ratePerSwap,
        this.userStatus});

  SuccessData.fromJson(Map<String, dynamic> json) {
    planName = json['plan_name'];
    planPrice = json['plan_price'];
    description = json['description'];
    validityDays = json['validity_days'];
    freeSwap = json['free_swap'];
    ratePerSwap = json['rate_per_swap'];
    userStatus = json['user_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan_name'] = this.planName;
    data['plan_price'] = this.planPrice;
    data['description'] = this.description;
    data['validity_days'] = this.validityDays;
    data['free_swap'] = this.freeSwap;
    data['rate_per_swap'] = this.ratePerSwap;
    data['user_status'] = this.userStatus;
    return data;
  }
}