import 'package:store/data/repositories/app_repositories_impl.dart';
import 'package:store/domain/entites/product.dart';
import 'package:store/domain/repositories/app_repositories.dart';

final AppRepositories repositories = AppRepositoriesImpl();

class GetProduct {
  Future<Product> call(String url) async {
    try {
      return await repositories.getProduct(url);
    } catch (e) {
      rethrow;
    }
  }
}
