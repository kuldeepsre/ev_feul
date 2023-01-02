import 'package:bloc/bloc.dart';
import 'package:ev_feul/model/login_response.dart';
import 'package:ev_feul/model/my_plan_response.dart';
import 'package:ev_feul/model/near_response.dart';
import 'package:ev_feul/model/subscreptions_response.dart';
import 'package:ev_feul/services/services.dart';
import 'package:flutter/cupertino.dart';

import 'package:meta/meta.dart';

import '../../model/user_history_response.dart';

part 'gate_event.dart';
part 'gate_state.dart';
class GateBloc extends Bloc<GateEvent, GateState> {
  GateBloc(GateInitial gateInitial) : super(GateInitial()) {
    on<GateEvent>((event, emit) async {
      if (event is AddInfo) {
        emit(GateLoading());
        final service = FetchService();
        var res =
        await service.saveRagister(event.ev_number,event.password,event.confirm_password,event.owner_name,event.phone,event.address,event.id_proof,event.ev_rc_copy,event.vehicle_photo,event.email);
        if (res.status==200) {
          emit(DataSaved(message: "Data Saved Successfully", title: 'Register Screen'));
        }else if(res.status==401) {
          emit(DataFailed(
              title: "Error", message:"$res"));
        }
        else{
          emit(DataFailed(
              title: "Error", message:"server error"));
        }
      }
      if (event is UploadeProfile) {
        emit(GateLoading());
        final service = FetchService();
        var res =
        await service.saveProfile(event.owner_name,event.phone,event.address,event.id_proof,event.email);
        if (res.status==200) {
          emit(DataSaved(message: "Data Saved Successfully", title: 'Register Screen'));
        }else if(res.status==401) {
          emit(DataFailed(
              title: "Error", message:"$res"));
        }
        else{
          emit(DataFailed(
              title: "Error", message:"server error"));
        }
      }
      if (event is LoginSubmit) {
        emit(GateLoading());
        final service = FetchService();
        var res =
        await service.saveLogin(event.email,event.password);
        if (res.status==200) {
          emit(DataSaved(message: "Data Saved Successfully", title: 'Register Screen'));
        }else if(res.status==401) {
          emit(DataFailed(
              title: "Login Screen", message:"Invalid Credentials"));
        }
        else{
          emit(DataFailed(
              title: "Error", message:"server error"));
        }
      }
      if (event is SubscriptionButton) {
        emit(GateLoading());
        final service = FetchService();
        var res =
        await service.saveSubscription(event.id,event.subscription_id);
        if (res.status==200) {
          emit(PlanSaved(message: "Plan Succ", title: 'Subscription Screen'));
        }else if(res.status==401) {
          emit(DataFailed(
              title: "Login Screen", message:"Invalid Credentials"));
        }
        else{
          emit(DataFailed(
              title: "Error", message:"server error"));
        }
      }
      if (event is GetSubscriptionList) {
        emit(GateLoading());
        final gateData = FetchService();
        var res = await gateData.getSubscriptionList(event.id);
        if (res.status==200) {
          emit(SearchDataLoaded(subscriptionList: res.success!));
        }
        else {
          emit(UserTokenExpired(
              title: "Subscription Plan Screen", message:"Plan already  Subscribed"));
        }
      }
      if (event is NearByList) {
        emit(GateLoading());
        final gateData = FetchService();
        var res = await gateData.getNearList();
        if (res.status==200) {
          emit(NearListLoaded(nearlist: res.success!.data!));
        }
        else {
          emit(UserTokenExpired(
              title: "Subscription Plan Screen", message:"Plan already  Subscribed"));
        }
      }
      if (event is GetPlanList) {
        emit(GateLoading());
        final gateData = FetchService();
        var res = await gateData.getPlanList(event.id);
        if (res.status==200) {

          emit(PlanDataLoaded(planList: res.success!));
        }
        else {
          emit(UserTokenExpired(
              title: "Token !!", message:"Token has been Expired"));
        }
      }
      if (event is UserHistoryList) {
        emit(GateLoading());
        final gateData = FetchService();
        var res = await gateData.getUserHistory(event.id);
        if (res.status==200) {

          emit(UserHistoryDataLoaded(histList: res.success!.history!));
        }
        else {
          emit(UserTokenExpired(
              title: "Token !!", message:"Token has been Expired"));
        }
      }
    });
  }
}
