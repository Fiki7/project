import 'package:equatable/equatable.dart';
import 'package:store/data/models/register_model.dart';

class Register extends Equatable {
  final String name;
  final String email;
  final String handphone;
  final String password;
  final String confirmPassword;

  Register(
      {required this.confirmPassword,
      required this.email,
      required this.handphone,
      required this.name,
      required this.password});

  RegisterModel fromModel() => RegisterModel(
      confirmPassword: confirmPassword,
      email: email,
      handphone: handphone,
      name: name,
      password: password);

  @override
  List<Object> get props => [name, email, handphone, password, confirmPassword];
}
