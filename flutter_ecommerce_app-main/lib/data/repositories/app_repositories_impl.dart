import 'package:store/data/datasources/remote_repositories.dart';
import 'package:store/domain/entites/login.dart';
import 'package:store/domain/entites/product.dart';
import 'package:store/domain/entites/register.dart';
import 'package:store/domain/repositories/app_repositories.dart';

RemoteRepositories remoteRepositories = RemoteRepositoriesImpl();

class AppRepositoriesImpl implements AppRepositories {
  @override
  Future postLogin(Login login, String url) async {
    try {
      await remoteRepositories.postLogin(url, login.fromModel());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future postRegister(Register register, String url) async {
    try {
      await remoteRepositories.postRequest(url, register.fromModel());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Product> getProduct(String url) async {
    try {
      return await remoteRepositories.getProduct(url);
    } catch (e) {
      rethrow;
    }
  }
}
