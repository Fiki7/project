part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoadingLogin extends LoginState {}

class FailureLogin extends LoginState {
  final String errorMesage;

  const FailureLogin({required this.errorMesage});

  @override
  List<Object> get props => [errorMesage];
}

class SuccessLogin extends LoginState {}
