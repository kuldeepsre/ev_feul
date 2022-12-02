part of 'login_bloc.dart';

@immutable
abstract class LoginState {
  const LoginState();

  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoding extends LoginState {}

class LoginFailed extends LoginState {
  final String message;

  LoginFailed({required this.message});
}

/*
class LoginComplete extends LoginState {
  final LoginResponseModel loginResponseModel;

  LoginComplete({required this.loginResponseModel});
}
*/

class IsInternetChanged extends LoginState {
  final bool isInternetConnected;

  IsInternetChanged({required this.isInternetConnected});
}