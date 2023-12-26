import 'package:emir_s_banking_app_ui/constants/app_textstyle.dart';
import 'package:emir_s_banking_app_ui/constants/color_constants.dart';
import 'package:emir_s_banking_app_ui/data/card_data.dart';
import 'package:emir_s_banking_app_ui/data/transaction_data.dart';
import 'package:emir_s_banking_app_ui/widgets/card_widget.dart';
import 'package:emir_s_banking_app_ui/widgets/transaction_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 240,
                child: ListView.separated(
                    itemBuilder: ((context, index) {
                      return CardWidget(card: cards[index]);
                    }),
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 10);
                    },
                    itemCount: cards.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal),
              ),
              const SizedBox(height: 30),
              const Text(
                "Recent Transactions",
                style: AppTextStyle.BODY_TEXT,
              ),
              const SizedBox(height: 15),
              ListView.separated(
                itemBuilder: (context, index) {
                  return TransactionWidget(transaction: myTransactions[index]);
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: myTransactions.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
