import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/data/models/product.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/presentation/bloc/product/product_bloc.dart';

import 'product_card.dart';

class PopularProducts extends StatefulWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.getProportionateScreenWidth(20)),
          child: TextButton(
            child: const Text("Popular Products"),
            onPressed: () {},
          ),
        ),
        SizedBox(height: SizeConfig.getProportionateScreenWidth(20)),
        Padding(
          padding: const EdgeInsets.fromLTRB(35, 10, 10, 20),
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is ProductFailure) {
                return const Center(
                  child: Text("Failed get data"),
                );
              }
              if (state is ProductLoaded) {
                return Row(
                  children: [
                    ...List.generate(demoProducts.length, (index) {
                      if (demoProducts[index].isPopular) {
                        return ProductCard(
                            product: state.products.product[index]);
                      }

                      return const SizedBox.shrink();
                    }),
                    SizedBox(width: SizeConfig.getProportionateScreenWidth(40)),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        )
      ],
    );
  }
}
