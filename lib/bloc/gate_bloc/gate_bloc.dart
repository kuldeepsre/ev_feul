import 'package:bloc/bloc.dart';
import 'package:ev_feul/services/services.dart';
import 'package:flutter/cupertino.dart';

import 'package:meta/meta.dart';

part 'gate_event.dart';
part 'gate_state.dart';
class GateBloc extends Bloc<GateEvent, GateState> {
  GateBloc(GateInitial gateInitial) : super(GateInitial()) {
    on<GateEvent>((event, emit) async {

      if (event is AddInfo) {
        emit(GateLoading());
        final service = new FetchService();
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

    });
  }
}
