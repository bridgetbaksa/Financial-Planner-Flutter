import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:app_concept_flutter/presentation/screens/login_screen.dart';

class ForgotUserSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/gradient-background.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold (
          backgroundColor: Colors.transparent,
          body: Container (
            color: Colors.transparent,
              constraints: BoxConstraints.expand(),
            child: Column (
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 135.0),
                  child: Image(
                    image: AssetImage('assets/images/mail-icon.png'),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            )
          ),
        )
      ],
    );
  }
}
