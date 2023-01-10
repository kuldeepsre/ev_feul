part of 'gate_bloc.dart';

@immutable
abstract class GateState {}

class GateInitial extends GateState {}

class UserTokenExpired extends GateState {
  final String title, message;

  UserTokenExpired({required this.title, required this.message});
}
class GateLoading extends GateState {}
class SuggestionLoading extends GateState {}
class DataSaved extends GateState {
  final String title, message;

  DataSaved({required this.title, required this.message});
}class PlanSaved extends GateState {
  final String title, message;

  PlanSaved({required this.title, required this.message});
}
class DataDelete extends GateState {
  final String title, message;

  DataDelete({required this.title, required this.message});
}
class SearchDataLoaded extends GateState {
  final List<SuccessData> subscriptionList;

  SearchDataLoaded({required this.subscriptionList});
}class NearListLoaded extends GateState {


  NearListLoaded();
}class LoadedCompeted extends GateState {


  LoadedCompeted();
}
class PlanDataLoaded extends GateState {
  PlanResponse planList;

  PlanDataLoaded({required this.planList});
}class LiveDataLoaded extends GateState {
  FirbaseResponse firbaseResponse;

  LiveDataLoaded({required this.firbaseResponse});
}
class UserHistoryDataLoaded extends GateState {
  List<History> histList;

  UserHistoryDataLoaded({required this.histList});
}
class DataFailed extends GateState {
  final String title, message;

  DataFailed({required this.title, required this.message});
}

