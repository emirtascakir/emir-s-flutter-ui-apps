import 'package:emir_s_banking_app_ui/constants/color_constants.dart';
import 'package:emir_s_banking_app_ui/models/card_model.dart';

List<CardModel> cards = [
  CardModel(
    cardHolderName: "John Doe",
    cardNumber: "**** **** **** 1234",
    expDate: "12/27",
    cvv: "**3",
    cardColor: kPrimaryColor,
  ),
  CardModel(
    cardHolderName: "John Doe",
    cardNumber: "**** **** **** 4321",
    expDate: "06/26",
    cvv: "**9",
    cardColor: kSecondaryColor,
  ),
];
