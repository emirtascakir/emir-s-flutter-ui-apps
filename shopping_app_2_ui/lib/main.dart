import 'package:flutter/material.dart';
import 'package:shopping_app_2_ui/constants.dart';
import 'package:shopping_app_2_ui/screens/home/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: bgColor,
        fontFamily: "Gordita",
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black54),
          bodyMedium: TextStyle(color: Colors.black54),
          bodySmall: TextStyle(color: Colors.black54),
        ),
      ),
      home: const HomeScreen(),
    ),
  );
}
