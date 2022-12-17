abstract class Services {

  
}
class FetchService extends Services {


/*
  @override
  Future<AddinfoResponse>  addinfoData(String username, String phone, String caddress, String ccity, String cstate, String ccountry, String cpin, String paddress, String pcity, String pstate, String pcountry, String ppin, String phonedetails, String maintenancepoint, String area, String aadharnumber, String dlnumber, String aadhar, String drivinglicencse, String photo) async {
    var postUri = Uri.parse("http://49.50.77.81:8181/Petrollermodeladd/");
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type":"multipart/form-data"
    };
    http.MultipartRequest request = new http.MultipartRequest("POST", postUri);
    var meterImage;
    if (aadhar != null) {
      meterImage = await http.MultipartFile.fromPath("aadhar",aadhar);
      request.files.add(meterImage);
    }  if (drivinglicencse != null) {
      meterImage = await http.MultipartFile.fromPath("drivinglicencse",drivinglicencse);
      request.files.add(meterImage);
    }  if (photo != null) {
      meterImage = await http.MultipartFile.fromPath("photo",photo);
      request.files.add(meterImage);
    }    request.headers.addAll(headers);
    request.fields["username"] =username;
    request.fields["secretid"] =Constants.id.toString();
    request.fields["phone"] =phone;
    request.fields["caddress"] =caddress;
    request.fields["ccity"] =ccity;
    request.fields["cstate"] =cstate;
    request.fields["ccountry"] =ccountry;
    request.fields["cpin"] =cpin;
    request.fields["paddress"] =paddress;
    request.fields["pstate"] =pstate;
    request.fields["pstate"] =pstate;
    request.fields["pcountry"] =pcountry;
    request.fields["ppin"] =ppin;
    request.fields["pcity"] =pcity;
    request.fields["aadharnumber"] =aadharnumber;
    request.fields["dlnumber"] =dlnumber;
    request.fields["maintenancepoint"] =maintenancepoint;
    request.fields["phonedetails"] ="phonedetails";

    request.fields["area"] =area;
    http.StreamedResponse response2 = await request.send();
    var tesr = await response2.stream.toBytes();
    final Map<String, dynamic> data = json.decode(String.fromCharCodes(tesr).toString());

    if(response2.statusCode==200)
    {
      Constants.mobile=data['phone'];
      Constants.maintenancepoint=data['maintenancepoint'];
      Constants.id=data['id'];
      Constants.name=data['username'];
    }
    else{
      return AddinfoResponse.fromJson(data);
    }
    return AddinfoResponse.fromJson(data);
  }

*/

}
