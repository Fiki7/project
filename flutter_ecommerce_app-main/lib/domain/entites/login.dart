import 'package:equatable/equatable.dart';
import 'package:store/data/models/login_model.dart';

class Login extends Equatable {
  final String email;
  final String password;

  Login({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];

  LoginModel fromModel() => LoginModel(email: email, password: password);
}
