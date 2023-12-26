import 'package:emir_s_banking_app_ui/constants/app_textstyle.dart';
import 'package:emir_s_banking_app_ui/constants/color_constants.dart';
import 'package:emir_s_banking_app_ui/data/card_data.dart';
import 'package:emir_s_banking_app_ui/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: MediaQuery.of(context).size.height * .6,
              padding: const EdgeInsets.all(20),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return CardWidget(card: cards[index]);
                },
                separatorBuilder: (context, index) {
                  return const Expanded(child: SizedBox(height: 20));
                },
                itemCount: cards.length,
              )),
          const CircleAvatar(
            radius: 40,
            child: Icon(
              Icons.add,
              size: 50,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "ADD CARD",
            style: AppTextStyle.LISTTILE_TITLE,
          )
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Cards",
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
    );
  }
}
