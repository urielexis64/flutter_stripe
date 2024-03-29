import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:stripe_app/bloc/pay/pay_bloc.dart';
import 'package:stripe_app/data/cards.dart';
import 'package:stripe_app/helpers/helpers.dart';
import 'package:stripe_app/pages/card_page.dart';
import 'package:stripe_app/service/stripe_service.dart';
import 'package:stripe_app/widgets/total_pay_button.dart';

class HomePage extends StatelessWidget {
  final stripeService = StripeService();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final payBloc = context.watch<PayBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                showLoading(context);

                final amount = payBloc.state.amountString;
                final currency = payBloc.state.currency;

                final resp = await stripeService.payWithNewCard(
                    amount: amount, currency: currency);
                Navigator.pop(context);
                if (resp.ok) {
                  showAlert(context, 'Credit Card OK', 'All is good!');
                } else {
                  showAlert(context, 'Something went wrong!', resp.message);
                }
              },
              icon: const Icon(Icons.add))
        ],
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
                return GestureDetector(
                  onTap: () {
                    payBloc.add(OnCreditCardSelected(currentCard));
                    Navigator.push(context,
                        fadeInNavigation(context, CardPage(card: currentCard)));
                  },
                  child: Hero(
                    tag: currentCard.cardNumber,
                    child: CreditCardWidget(
                        cardNumber: currentCard.cardNumber,
                        expiryDate: currentCard.expiracyDate,
                        cardHolderName: currentCard.cardHolderName,
                        cvvCode: currentCard.cvv,
                        showBackView: false),
                  ),
                );
              },
            ),
          ),
          Positioned(bottom: 0, child: TotalPayButton())
        ],
      ),
    );
  }
}
