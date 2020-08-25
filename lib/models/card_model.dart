import 'package:launmax_app/utils/cards_enum.dart';

class CardModel {
  String cardHolderName;
  String cardNumber;
  CardType cardType;
  String expiryDate;

  CardModel({
    this.cardHolderName,
    this.cardNumber,
    this.cardType,
    this.expiryDate,
  });
}

List<CardModel> creditCards = [
  // CardModel(
  //   cardHolderName: 'Emily Rosser',
  //   cardNumber: '1234567891012123',
  //   cardType: CardType.diner,
  //   expiryDate: '05/23',
  // ),
  // CardModel(
  //   cardHolderName: 'Developer Jamiu',
  //   cardNumber: '1234567891012123',
  //   cardType: CardType.mastercard,
  //   expiryDate: '06/30',
  // ),
];
