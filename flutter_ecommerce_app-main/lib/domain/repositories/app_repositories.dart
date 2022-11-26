import 'package:store/domain/entites/login.dart';
import 'package:store/domain/entites/product.dart';

import '../entites/register.dart';

abstract class AppRepositories {
  Future<dynamic> postLogin(Login login, String url);
  Future<dynamic> postRegister(Register register, String url);
  Future<Product> getProduct(String url);
}
