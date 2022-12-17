import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:meta/meta.dart';

part 'gate_event.dart';
part 'gate_state.dart';
class GateBloc extends Bloc<GateEvent, GateState> {
  GateBloc(GateInitial gateInitial) : super(GateInitial()) {
    on<GateEvent>((event, emit) async {

    /*  if (event is EventList) {
        emit(GateLoading());
        final service = new GateFetchService();
        var res =
        await service.getEventData(event.command);
        if (res.statusCode==200) {
          emit(EventDropDownLoaded(eventlist: res.result));
        }else if(res.statusCode==401) {
          emit(UserTokenExpired(
              title: "Token Expired", message:"Token has been expired!"));
        }
        else{
          emit(DataFailed(
              title: "Error", message:"server error"));
        }
      }*/

    });
  }
}
