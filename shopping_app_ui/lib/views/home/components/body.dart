import 'package:shopping_app_ui/constants/constants.dart';
import 'package:shopping_app_ui/data/product_dummy_data.dart';
import 'package:shopping_app_ui/views/details/details_view.dart';
import 'package:shopping_app_ui/views/home/components/categories.dart';
import 'package:shopping_app_ui/views/home/components/item_card.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(
            "Women",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const Categories(),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: kDefaultPadding,
                mainAxisSpacing: kDefaultPadding,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) => ItemCard(
                    product: products[index],
                    press: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (builder) =>
                              DetailsView(product: products[index])));
                    },
                  )),
        ))
      ],
    );
  }
}
