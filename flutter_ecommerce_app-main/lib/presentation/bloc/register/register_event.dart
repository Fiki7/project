part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class EventRegister extends RegisterEvent {
  final Register register;

  const EventRegister({required this.register});

  @override
  List<Object> get props => [register];
}
