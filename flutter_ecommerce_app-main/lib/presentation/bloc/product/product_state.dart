part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductFailure extends ProductState {
  final String errorMessage;

  ProductFailure({required this.errorMessage});

  @override
  // ignore: override_on_non_overriding_member
  List<Object> get props => [errorMessage];
}

class ProductLoaded extends ProductState {
  final Product products;

  ProductLoaded({required this.products});

  @override
  // ignore: override_on_non_overriding_member
  List<Object> get props => [products];
}
