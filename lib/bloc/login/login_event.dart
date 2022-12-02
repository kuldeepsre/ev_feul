part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {

}
class LoginEventInitial extends LoginEvent {}

// class LoginButtonClick extends LoginEvent {
//   final String userId, password,AppVersion;
//
//   const LoginButtonClick({required this.userId, required this.password,required this.AppVersion});
// }
class InternetConnectionStatus extends LoginEvent {
  final bool internetStatus;

  InternetConnectionStatus({required this.internetStatus});
}