import 'package:flutter/material.dart';

class TransactionModel {
  String name;
  String avatar;
  String currentBalance;
  String month;
  String changePercentageIndicator;
  String changePercentage;
  Color color;
  TransactionModel({
    required this.name,
    required this.avatar,
    required this.currentBalance,
    required this.month,
    required this.changePercentageIndicator,
    required this.changePercentage,
    required this.color,
  });
}
