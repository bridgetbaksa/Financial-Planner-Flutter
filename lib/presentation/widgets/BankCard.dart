import 'package:flutter/material.dart';

class BankCard extends StatefulWidget {
  @override
  _BankCardState createState() => _BankCardState();
}

class _BankCardState extends State<BankCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: 225,
      width: 400,
      child: Image(
      image: AssetImage('assets/images/Bank-Card.jpg'),
    ),
    );
  }
  }

