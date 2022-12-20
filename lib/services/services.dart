import 'dart:convert';

import 'package:ev_feul/model/login_response.dart';
import 'package:ev_feul/model/my_plan_response.dart';
import 'package:ev_feul/model/register_response.dart';
import 'package:ev_feul/model/subscreptions_response.dart';
import 'package:ev_feul/utils/Constants.dart';
import 'package:ev_feul/utils/utils.dart';
import 'package:http/http.dart' as http;

abstract class Services {

  
}
class FetchService extends Services {


  @override
  Future<RegisterResponse>  saveRagister(String ev_number,String password,
      String confirm_password,String owner_name,
      String phone,String address,String id_proof,String ev_rc_copy,String vehicle_photo,String email
  ) async {
    var postUri = Uri.parse("http://evfuel.afmerp.com/api/register");
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type":"multipart/form-data"
    };
    http.MultipartRequest request = http.MultipartRequest("POST", postUri);
    var meterImage;
    if (ev_rc_copy != null) {
      meterImage = await http.MultipartFile.fromPath("ev_rc_copy",ev_rc_copy);
      request.files.add(meterImage);
      print("${ev_rc_copy.split('/').last}");
    }  if (id_proof != null) {
      meterImage = await http.MultipartFile.fromPath("id_proof",id_proof);
      request.files.add(meterImage);
      print("${id_proof.split('/').last}");
    }  if (vehicle_photo != null) {
      meterImage = await http.MultipartFile.fromPath("vehicle_photo",vehicle_photo);
      request.files.add(meterImage);
      print("${vehicle_photo}");
    }    request.headers.addAll(headers);
    request.fields["ev_number"] =ev_number;
    request.fields["password"] =password;
    request.fields["confirm_password"] =confirm_password;
    request.fields["owner_name"] =owner_name;
    request.fields["phone"] =phone;
    request.fields["address"] =address;
    request.fields["email"] =email;
    http.StreamedResponse response2 = await request.send();
    var tesr = await response2.stream.toBytes();
    final Map<String, dynamic> data = json.decode(String.fromCharCodes(tesr).toString());
    print(data.entries);
    if(response2.statusCode==200)
    {

    }
    else{
      print(jsonEncode(tesr));
      return RegisterResponse.fromJson(data);
    }
    return RegisterResponse.fromJson(data);
  }



  @override
  Future<LoginData> saveLogin (
  String email, String password) async {
    var res = await Utils.postApiCall(Constants.LOGIN_API_URL, {
      'ev_number': email,
      "password": password,

    });


    var jsonresult = json.decode(res.body);
    LoginData  loginResponse=LoginData.fromJson(jsonresult);
    if(loginResponse.status==200)

    {
      Constants.userId=loginResponse.success!.userId.toString();

    }
    return loginResponse;

  }


  @override
  Future<SubscriptionsPlanResponse> getSubscriptionList(
      String commond) async {
    var res = await Utils.postApiCall(
        Constants.POST_SUBSCRIPTIONS_DATA,
        {"user_id":"$commond"});
    var json = jsonDecode(res.body);

    try {
      SubscriptionsPlanResponse  fcnaDetailResponse =
      SubscriptionsPlanResponse .fromJson(json);
      return fcnaDetailResponse;
    } catch (e) {
      print(e);
      return SubscriptionsPlanResponse .fromJson({
        'result': null,
        'statusCode': 0,
        'success': false,
        'systemMsg': "Api not found!",
        'userMsg': "Please check Api",
      });
    }
  }
  @override
  Future<MyPlanResponse> getPlanList(
      String commond) async {
    var res = await Utils.postApiCall(
        Constants.POST_PLAN_LIST,
        {"user_id":"$commond"});
    var json = jsonDecode(res.body);

    try {
      MyPlanResponse  fcnaDetailResponse =
      MyPlanResponse .fromJson(json);
      return fcnaDetailResponse;
    } catch (e) {
      print(e);
      return MyPlanResponse .fromJson({
        'result': null,
        'statusCode': 0,
        'success': false,
        'systemMsg': "Api not found!",
        'userMsg': "Please check Api",
      });
    }
  }
}
