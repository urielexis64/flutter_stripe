import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FullPaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Successful payment!'),
      ),
      body: Center(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.star, color: Colors.white54, size: 100),
            SizedBox(height: 20),
            Text(
              'Successful payment!',
              style: TextStyle(color: Colors.white, fontSize: 22),
            )
          ],
        ),
      )),
    );
  }
}
