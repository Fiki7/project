import 'package:store/domain/entites/login.dart';

class LoginModel extends Login {
  LoginModel({required super.email, required super.password});

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}
