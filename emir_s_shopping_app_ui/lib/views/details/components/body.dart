import 'package:emir_s_shopping_app_ui/constants/constants.dart';
import 'package:emir_s_shopping_app_ui/models/product_model.dart';
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
                child: const Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Color"),
                            Row(
                              children: [
                                ColorDot(
                                  color: Color(0xFF356C95),
                                  isSelected: true,
                                ),
                                ColorDot(color: Color(0xFFF8C078)),
                                ColorDot(color: Color(0xFFA29B9B)),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
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

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const ColorDot({
    super.key,
    required this.color,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top: kDefaultPadding / 4, right: kDefaultPadding / 2),
      padding: const EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
