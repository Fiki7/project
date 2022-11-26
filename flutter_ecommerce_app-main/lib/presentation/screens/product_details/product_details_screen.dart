import 'package:flutter/material.dart';
import 'package:store/domain/entites/product.dart';
import 'components/product_details_content.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/details';
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Receive object from pushNamed Route
    final product = ModalRoute.of(context)!.settings.arguments as ProductDetail;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      body: DetailsScreenContent(product: product),
    );
  }
}
