part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EventLogin extends LoginEvent {
  final Login login;
  const EventLogin({required this.login});
  @override
  List<Object> get props => [login];
}
