import 'package:shopping_app_ui/constants/constants.dart';
import 'package:shopping_app_ui/views/home/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
