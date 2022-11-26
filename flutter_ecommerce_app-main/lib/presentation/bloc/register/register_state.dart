part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class LoadingRegister extends RegisterState {}

class FailureRegister extends RegisterState {
  final String errorMesage;

  const FailureRegister({required this.errorMesage});

  @override
  List<Object> get props => [errorMesage];
}

class SuccessRegister extends RegisterState {}
