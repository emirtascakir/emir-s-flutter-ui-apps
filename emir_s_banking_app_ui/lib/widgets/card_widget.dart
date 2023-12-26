import 'package:emir_s_banking_app_ui/constants/app_textstyle.dart';
import 'package:emir_s_banking_app_ui/models/card_model.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final CardModel card;
  const CardWidget({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 200,
      width: 350,
      decoration: BoxDecoration(
        color: card.cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "CARD NAME",
                    style: AppTextStyle.MY_CARD_TITLE,
                  ),
                  Text(
                    card.cardHolderName,
                    style: AppTextStyle.MY_CARD_SUBTITLE,
                  ),
                ],
              ),
              Text(
                card.cardNumber,
                style: AppTextStyle.MY_CARD_SUBTITLE,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "EXP DATE",
                        style: AppTextStyle.MY_CARD_TITLE,
                      ),
                      Text(
                        card.expDate,
                        style: AppTextStyle.MY_CARD_SUBTITLE,
                      )
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "CVV NUMBER",
                        style: AppTextStyle.MY_CARD_TITLE,
                      ),
                      Text(
                        card.cvv,
                        style: AppTextStyle.MY_CARD_SUBTITLE,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: Image.asset("assets/icons/mcard.png"),
              )
            ],
          )
        ],
      ),
    );
  }
}
