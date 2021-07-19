import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TotalPayButton extends StatelessWidget {
  const TotalPayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              Text('300.00 USD', style: TextStyle(fontSize: 20))
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
    return 1 + 1 == 2
        ? buildCardButton(context)
        : buildAppleAndGooglePay(context);
  }

  Widget buildCardButton(BuildContext context) {
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
            'Pay',
            style: TextStyle(color: Colors.white, fontSize: 22),
          )
        ],
      ),
    );
  }
}
