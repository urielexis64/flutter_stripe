import 'package:flutter/material.dart';
import 'package:stripe_app/pages/full_payment_page.dart';
import 'package:stripe_app/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StripeApp',
      initialRoute: 'home',
      debugShowCheckedModeBanner: false,
      routes: {
        'home': (_) => HomePage(),
        'full_payment': (_) => FullPaymentPage(),
      },
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xFF284879),
        scaffoldBackgroundColor: const Color(0xFF21232A),
      ),
    );
  }
}
