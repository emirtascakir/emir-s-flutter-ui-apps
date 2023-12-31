import 'package:emir_s_shopping_app_ui/constants/constants.dart';
import 'package:emir_s_shopping_app_ui/models/product_model.dart';
import 'package:emir_s_shopping_app_ui/views/details/components/add_to_cart.dart';
import 'package:emir_s_shopping_app_ui/views/details/components/color_and_size.dart';
import 'package:emir_s_shopping_app_ui/views/details/components/counter_with_fav_btn.dart';
import 'package:emir_s_shopping_app_ui/views/details/components/description.dart';
import 'package:emir_s_shopping_app_ui/views/details/components/product_title_with_image.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final Product product;
  const Body({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: size.height * .12,
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                ),
                margin: EdgeInsets.only(top: size.height * .3),
                //height: 500,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24))),
                child: Column(
                  children: <Widget>[
                    ColorAndSize(product: product),
                    const SizedBox(height: kDefaultPadding / 2),
                    Description(product: product),
                    const SizedBox(height: kDefaultPadding / 2),
                    const CounterWithFavBtn(),
                    const SizedBox(height: kDefaultPadding / 2),
                    AddToCart(product: product),
                  ],
                ),
              ),
              ProductTitleWithImage(product: product)
            ]),
          )
        ],
      ),
    );
  }
}
