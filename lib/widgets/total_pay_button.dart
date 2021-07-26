import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stripe_app/bloc/pay/pay_bloc.dart';
import 'package:stripe_app/helpers/helpers.dart';
import 'package:stripe_app/service/stripe_service.dart';
import 'package:stripe_payment/stripe_payment.dart';

class TotalPayButton extends StatelessWidget {
  const TotalPayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final payBloc = context.watch<PayBloc>().state;
    return Container(
      width: size.width,
      height: size.height * .1,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Total',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('${payBloc.amount} ${payBloc.currency}',
                  style: TextStyle(fontSize: 20))
            ],
          ),
          _PayButton()
        ],
      ),
    );
  }
}

class _PayButton extends StatelessWidget {
  const _PayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final payBloc = context.watch<PayBloc>();

    return payBloc.state.activeCard
        ? buildCardButton(context)
        : buildAppleAndGooglePay(context);
  }

  Widget buildCardButton(BuildContext context) {
    return MaterialButton(
      onPressed: () => _payWithExistingCard(context),
      height: 45,
      minWidth: 150,
      shape: const StadiumBorder(),
      elevation: 0,
      color: Colors.black,
      child: Row(
        children: [
          FaIcon(
            FontAwesomeIcons.solidCreditCard,
            color: Colors.white,
          ),
          Text(
            '  Pay',
            style: TextStyle(color: Colors.white, fontSize: 22),
          )
        ],
      ),
    );
  }

  _payWithExistingCard(BuildContext context) async {
    showLoading(context);
    final stripeService = StripeService();
    final payBloc = context.read<PayBloc>().state;
    final selectedCreditCard = payBloc.creditCard;

    final expMonth = int.parse(selectedCreditCard!.expiracyDate.split('/')[0]);
    final expYear = int.parse(selectedCreditCard.expiracyDate.split('/')[1]);

    final resp = await stripeService.payWithExistingCard(
        amount: payBloc.amountString,
        currency: payBloc.currency,
        card: CreditCard(
            number: selectedCreditCard.cardNumber,
            cvc: selectedCreditCard.cvv,
            expMonth: expMonth,
            expYear: expYear));

    Navigator.pop(context);
    if (resp.ok) {
      showAlert(context, 'Credit Card OK', 'All is good!');
    } else {
      showAlert(context, 'Something went wrong!', resp.message);
    }
  }

  Widget buildAppleAndGooglePay(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      height: 45,
      minWidth: 150,
      shape: const StadiumBorder(),
      elevation: 0,
      color: Colors.black,
      child: Row(
        children: [
          FaIcon(
            Platform.isAndroid
                ? FontAwesomeIcons.google
                : FontAwesomeIcons.apple,
            color: Colors.white,
          ),
          Text(
            '   Pay',
            style: TextStyle(color: Colors.white, fontSize: 22),
          )
        ],
      ),
    );
  }
}
