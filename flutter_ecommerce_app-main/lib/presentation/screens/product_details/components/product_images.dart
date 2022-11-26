import 'package:flutter/material.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/domain/entites/product.dart';

class ProductImages extends StatefulWidget {
  final ProductDetail product;

  const ProductImages({Key? key, required this.product}) : super(key: key);

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  // ignore: unused_field
  int _selectedImage = 0;
  // ignore: unused_field
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.6);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: (SizeConfig.orientation == Orientation.portrait)
          ? EdgeInsets.only(top: SizeConfig.getProportionateScreenHeight(5))
          : EdgeInsets.only(top: SizeConfig.getProportionateScreenHeight(40)),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.red)
      // ),
      child: Column(
        children: [
          SizedBox(
              height: SizeConfig.getProportionateScreenHeight(200),
              child: Image.network(widget.product.image)),
          SizedBox(
            height: SizeConfig.getProportionateScreenHeight(25),
          ),
        ],
      ),
    );
  }

  /* Create an container that contains product's image
  when user click on Image the state will change to show the chosen image
   */

}
