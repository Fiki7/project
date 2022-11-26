import 'package:store/domain/entites/register.dart';

class RegisterModel extends Register {
  RegisterModel(
      {required super.confirmPassword,
      required super.email,
      required super.handphone,
      required super.name,
      required super.password});

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'handphone': handphone,
        'password': password,
        'password_confirmation': confirmPassword
      };
}
