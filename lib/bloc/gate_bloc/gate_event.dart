part of 'gate_bloc.dart';

@immutable
abstract class GateEvent {}

class GateEventInitial extends GateEvent {
  @override
  List<Object> get props => [];
}

class Gate1Submit extends GateEvent {
  final String username, address, date;

  Gate1Submit(
      {required this.username, required this.address, required this.date});
}

class Gate2Submit extends GateEvent {
  final String username, address, date;

  Gate2Submit(
      {required this.username, required this.address, required this.date});
}

class Gate3Submit extends GateEvent {
  final String username, address, date;

  Gate3Submit(
      {required this.username, required this.address, required this.date});
}

class EventList extends GateEvent {
  final String command;

  EventList({required this.command});
}class EventMasterList extends GateEvent {
  final String command;
  final String event_id;

  EventMasterList({required this.command,required this.event_id});
}
class AddParkingList extends GateEvent {
  final List<dynamic> postData;
  AddParkingList({required this.postData});
}
class SearchList extends GateEvent {
  final String command;

  SearchList({required this.command});
}
class EventCommonData extends GateEvent {
  final String command;

  EventCommonData({required this.command});
}

class SearchListDetails extends GateEvent {
  final String command;

  SearchListDetails({required this.command});
}
class ListReports extends GateEvent {
  final String command;

  ListReports({required this.command});
}
class ParkingGetListData extends GateEvent {
  final String parking_allotment;

  ParkingGetListData({required this.parking_allotment});
}class SearchSuggestions extends GateEvent {
  final String selected,gateType;

  SearchSuggestions({required this.selected,required this.gateType});
}
class SearchSuggestionsFamily extends GateEvent {
  final String selected,gateType;

  SearchSuggestionsFamily({required this.selected,required this.gateType});
}
class CommonListData extends GateEvent {
  final String selected;

  CommonListData({required this.selected});
}
class ParkingDataData extends GateEvent {
  final String master_name;

  ParkingDataData({required this.master_name});
}
class GetSubscriptionList extends GateEvent {
  final String id;

  GetSubscriptionList({required this.id});
}class SubscriptionButton extends GateEvent {
  final String id,subscription_id;

  SubscriptionButton({required this.id,required this.subscription_id});
}
class GetPlanList extends GateEvent {
  final String id;

  GetPlanList({required this.id});
}

class GuestButtonClick extends GateEvent {
  final List<dynamic> data;

  GuestButtonClick({required this.data});
}
class AddEvetButtonClick extends GateEvent {
  final List<dynamic> data;

  AddEvetButtonClick({required this.data});
}
class SaveFamily extends GateEvent {
  final List<dynamic> data;

  SaveFamily({required this.data});
}
class PickupGate1RequestApprove extends GateEvent {
  final List<dynamic> postData;

  PickupGate1RequestApprove({required this.postData});
}

//CallForVehical1Request
class CallForVehical1Request extends GateEvent {
  final List<dynamic> postData;

  CallForVehical1Request({required this.postData});
}
class CallForVehical2Request  extends GateEvent {
  final List<dynamic> postData;

  CallForVehical2Request ({required this.postData});
}
class CallForVehical3Request extends GateEvent {
  final List<dynamic> postData;
  CallForVehical3Request({required this.postData});
}

//CallForVehicalGuest1Request
class CallForVehicalGuest1Request extends GateEvent {
  final List<dynamic> postData;

  CallForVehicalGuest1Request({required this.postData});
}
class CallForVehicalGuest2Request extends GateEvent {
  final List<dynamic> postData;

  CallForVehicalGuest2Request({required this.postData});
}
class CallForVehicalGuest3Request extends GateEvent {
  final List<dynamic> postData;
  CallForVehicalGuest3Request({required this.postData});
}

//CallForVehicalPickup1Request
class CallForVehicalPickup1Request extends GateEvent {
  final List<dynamic> postData;

  CallForVehicalPickup1Request({required this.postData});
}
class CallForVehicalPickup2Request extends GateEvent {
  final List<dynamic> postData;

  CallForVehicalPickup2Request({required this.postData});
}
class CallForVehicalPickup3Request extends GateEvent {
  final List<dynamic> postData;
  CallForVehicalPickup3Request({required this.postData});
}
class AddInfo extends GateEvent {
  final String ev_number,password,confirm_password,owner_name,phone,address,id_proof,ev_rc_copy,vehicle_photo,email;
  AddInfo( {required this.ev_number, required this.password,required this.confirm_password,required this.ev_rc_copy,required this.owner_name,
    required this.phone,required this.address,required this.id_proof,required this.vehicle_photo,required this.email});

}

class LoginSubmit  extends GateEvent{
  final String email, password;

  LoginSubmit({required this.email, required this.password});
}