import 'dart:convert';

import 'package:ev_feul/model/register_response.dart';
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
    }  if (id_proof != null) {
      meterImage = await http.MultipartFile.fromPath("id_proof",id_proof);
      request.files.add(meterImage);
    }  if (vehicle_photo != null) {
      meterImage = await http.MultipartFile.fromPath("vehicle_photo",vehicle_photo);
      request.files.add(meterImage);
    }    request.headers.addAll(headers);
    request.fields["ev_number"] =ev_number;
    request.fields["password"] =password;
    request.fields["confirm_password"] =confirm_password;
    request.fields["owner_name"] =owner_name;
    request.fields["phone"] =phone;
    request.fields["address"] =address;
    http.StreamedResponse response2 = await request.send();
    var tesr = await response2.stream.toBytes();
    final Map<String, dynamic> data = json.decode(String.fromCharCodes(tesr).toString());
    if(response2.statusCode==200)
    {

    }
    else{
      return RegisterResponse.fromJson(data);
    }
    return RegisterResponse.fromJson(data);
  }


}
