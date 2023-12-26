import 'package:flutter/material.dart';

class CardModel {
  String cardHolderName;
  String cardNumber;
  String expDate;
  String cvv;
  Color cardColor;

  CardModel({
    required this.cardHolderName,
    required this.cardNumber,
    required this.expDate,
    required this.cvv,
    required this.cardColor,
  });
}
