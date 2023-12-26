import 'package:emir_s_banking_app_ui/constants/app_textstyle.dart';
import 'package:emir_s_banking_app_ui/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TransactionWidget extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionWidget({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: transaction.color,
                ),
                child: Image.asset(transaction.avatar),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.name,
                    style: AppTextStyle.LISTTILE_TITLE,
                  ),
                  Text(
                    transaction.month,
                    style: AppTextStyle.LISTTILE_SUB_TITLE,
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    transaction.currentBalance,
                    style: AppTextStyle.LISTTILE_TITLE,
                  ),
                  Row(
                    children: [
                      transaction.changePercentageIndicator == "up"
                          ? const Icon(
                              FontAwesomeIcons.turnUp,
                              size: 14,
                              color: Colors.green,
                            )
                          : const Icon(
                              FontAwesomeIcons.turnDown,
                              size: 14,
                              color: Colors.red,
                            ),
                      const SizedBox(width: 5),
                      Text(
                        transaction.changePercentage,
                        style: AppTextStyle.LISTTILE_SUB_TITLE,
                      )
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
