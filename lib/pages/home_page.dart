import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:stripe_app/data/cards.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: Stack(
        children: [
          Positioned(
            width: size.width,
            height: size.height,
            top: size.height * .25,
            child: PageView.builder(
              itemCount: cards.length,
              controller: PageController(viewportFraction: .85),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, i) {
                final currentCard = cards[i];
                return CreditCardWidget(
                    cardNumber: currentCard.cardNumber,
                    expiryDate: currentCard.expiracyDate,
                    cardHolderName: currentCard.cardHolderName,
                    cvvCode: currentCard.cvv,
                    showBackView: false);
              },
            ),
          )
        ],
      ),
    );
  }
}
