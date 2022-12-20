class MyPlanResponse {
  PlanResponse? success;
  int? status;

  MyPlanResponse({this.success, this.status});

  MyPlanResponse.fromJson(Map<String, dynamic> json) {
    success =
    json['success'] != null ? new PlanResponse.fromJson(json['success']) : null;
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

class PlanResponse {
  String? planName;
  int? totalSwap;
  String? validDateTill;

  PlanResponse({this.planName, this.totalSwap, this.validDateTill});

  PlanResponse.fromJson(Map<String, dynamic> json) {
    planName = json['plan_name'];
    totalSwap = json['total_swap'];
    validDateTill = json['valid_date_till'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan_name'] = this.planName;
    data['total_swap'] = this.totalSwap;
    data['valid_date_till'] = this.validDateTill;
    return data;
  }
}