import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/domain/entites/product.dart';
import 'package:store/domain/usecases/get_product.dart';

part 'product_event.dart';
part 'product_state.dart';

final usecaseProduct = GetProduct();

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<FetchProduct>((event, emit) async {
      try {
        emit(ProductLoading());
        final products = await usecaseProduct.call('/api/barang');
        emit(ProductLoaded(products: products));
      } catch (e) {
        emit(ProductFailure(errorMessage: e.toString()));
      }
    });
  }
}
