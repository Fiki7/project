import 'package:store/data/repositories/app_repositories_impl.dart';
import 'package:store/domain/repositories/app_repositories.dart';

import '../entites/login.dart';

AppRepositories appRepositories = AppRepositoriesImpl();

class PostLogin {
  Future<dynamic> call(String url, Login login) async {
    try {
      return await appRepositories.postLogin(login, url);
    } catch (e) {
      rethrow;
    }
  }
}
