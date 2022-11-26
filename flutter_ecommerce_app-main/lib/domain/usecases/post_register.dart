import 'package:store/data/repositories/app_repositories_impl.dart';
import 'package:store/domain/repositories/app_repositories.dart';

import '../entites/register.dart';

AppRepositories appRepositories = AppRepositoriesImpl();

class PostRegister {
  Future<dynamic> call(String url, Register register) async {
    try {
      return await appRepositories.postRegister(register, url);
    } catch (e) {
      rethrow;
    }
  }
}
