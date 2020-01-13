import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:app_concept_flutter/presentation/screens/login_screen.dart';


class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Forgot Password'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          )

      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 0),
          constraints: BoxConstraints.expand(),
          child: Column(
            children: <Widget>[
              Text(
                "Enter your username to reset your password.",
                style: TextStyle(
                    fontFamily: 'Avenir', color: Colors.black, fontSize: 18.0),
              ),
              SizedBox(
                height: 31.0,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(13.0, 0, 13.0, 0),
                child: TextFormField(
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(
                        fontFamily: 'Avenir',
                        color: Colors.black,
                        fontSize: 22),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
              ),
              ),
                Text(
                  "Forgot username?",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'Avenir', color: Colors.black, fontSize: 12.0
                  ),
                ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 0),
                child: Container(
                  height: 58.0,
                  width: 380.0,
                  child: FlatButton(
                    onPressed: () {
                    },
                    color: Colors.grey.shade600,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
