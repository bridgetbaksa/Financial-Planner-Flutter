import 'package:flutter/material.dart';

class PlaceholderScreen extends StatelessWidget {

  final String screenName;
  final Color screenColor;

  PlaceholderScreen({
    this.screenName,
    this.screenColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: screenColor,
      child: Center(
        child: Text(screenName),
      ),
    );
  }


}
