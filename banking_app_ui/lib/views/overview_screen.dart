import 'package:banking_app_ui/constants/color_constants.dart';
import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Emir Bank",
          style: TextStyle(fontFamily: "Poppins", color: kPrimaryColor),
        ),
        leading: const Padding(
          padding: EdgeInsets.all(8),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://i.pravatar.cc/250"),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_active_outlined,
                color: Colors.black,
                size: 27,
              ))
        ],
      ),
      body: const Center(child: Text("Overview")),
    );
  }
}
