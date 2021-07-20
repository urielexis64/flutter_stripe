import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:stripe_app/models/custom_credit_card.dart';
import 'package:stripe_app/widgets/total_pay_button.dart';

class CardPage extends StatelessWidget {
  CustomCreditCard card;

  CardPage({required this.card});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Pay'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(
            width: size.width,
            height: size.height,
            top: 0,
            child: Hero(
              tag: card.cardNumber,
              child: CreditCardWidget(
                  cardNumber: card.cardNumber,
                  expiryDate: card.expiracyDate,
                  cardHolderName: card.cardHolderName,
                  cvvCode: card.cvv,
                  showBackView: false),
            ),
          ),
          Positioned(bottom: 0, child: TotalPayButton())
        ],
      ),
    );
  }
}
