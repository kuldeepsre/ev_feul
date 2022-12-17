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
}
class DataDelete extends GateState {
  final String title, message;

  DataDelete({required this.title, required this.message});
}

class DataFailed extends GateState {
  final String title, message;

  DataFailed({required this.title, required this.message});
}

