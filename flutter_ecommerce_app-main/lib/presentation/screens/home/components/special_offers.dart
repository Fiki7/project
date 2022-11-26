import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/constants/text_style.dart';
import 'package:store/presentation/bloc/product/product_bloc.dart';
import 'package:store/presentation/bloc/search/search_bloc.dart';
import 'package:store/presentation/bloc/search/search_state.dart';
import 'package:store/presentation/screens/product_details/product_details_screen.dart';

import 'special_offer_card.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: BlocProvider.of<SearchBloc>(context),
        builder: (BuildContext context, SearchState state) {
          return SizedBox(
            height: 425,
            child: Column(
              // shrinkWrap: true,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.getProportionateScreenWidth(10),
                    vertical: SizeConfig.getProportionateScreenWidth(10),
                  ),
                  child: TextButton(
                    child: const Text(
                      "Special For you!",
                    ),
                    onPressed: () {},
                  ),
                ),
                if (state is SearchSuccessFetchProductByCategoryState)
                  (state.products.isEmpty)
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                          child: const Center(
                            child: Text("There are no elements"),
                          ),
                        )
                      : Column(
                          children: [
                            SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: BlocBuilder<ProductBloc, ProductState>(
                                  builder: (context, state) {
                                    if (state is ProductLoaded) {
                                      return Row(
                                        children: List.generate(
                                          state.products.product.length,
                                          (index) => Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20),
                                            child: SpecialOfferCard(
                                                category: state
                                                    .products
                                                    .product[index]
                                                    .productCategory
                                                    .name,
                                                image: state.products
                                                    .product[index].image,
                                                price: state.products
                                                    .product[index].harga
                                                    .toDouble(),
                                                title: state.products
                                                    .product[index].name,
                                                onTap: () =>
                                                    Navigator.pushNamed(
                                                        context,
                                                        ProductDetailsScreen
                                                            .routeName,
                                                        arguments: state
                                                            .products
                                                            .product[index])),
                                          ),
                                        ),
                                      );
                                    }

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

                                    return const SizedBox();
                                  },
                                )),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              color: Colors.transparent,
                              child: GestureDetector(
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text("See more", style: textStyle),
                                    SizedBox(
                                      width: SizeConfig
                                          .getProportionateScreenHeight(5),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_outlined,
                                      color: Color(0xff5956e9),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                if (state is SearchErrorFetchDataState)
                  Expanded(
                    child: Center(
                      child: Text(state.errorMessage),
                    ),
                  ),
              ],
            ),
          );
        });
  }
}
