import 'package:emir_s_banking_app_ui/constants/color_constants.dart';
import 'package:emir_s_banking_app_ui/views/card_screen.dart';
import 'package:emir_s_banking_app_ui/views/home_screen.dart';
import 'package:emir_s_banking_app_ui/views/overview_screen.dart';
import 'package:emir_s_banking_app_ui/views/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BaseView extends StatefulWidget {
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CardScreen(),
    SettingsScreen(),
    OverviewScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.house), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.creditCard), label: "Cards"),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.gear), label: "Settings"),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.chartBar), label: "Overview"),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
