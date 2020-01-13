import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:async';
import 'package:app_concept_flutter/presentation/core/SizeConfig.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'package:app_concept_flutter/presentation/screens/home.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin{

  GlobalKey _globalKey = new GlobalKey();
  Animation _animation;
  AnimationController _controller;

  double _width = double.infinity;

  var _state = 0;
  bool passwordVisible = true;
  bool isSwitched = true;

  final LocalAuthentication auth = LocalAuthentication();
  bool _isAuthenticating = false;

  void animateButton() {
    setState(() {
      _state = 1;
    });
    double initialWidth = _globalKey.currentContext.size.width;
        _controller =
            AnimationController(duration: Duration(milliseconds: 300), vsync: this);
        _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
          ..addListener(() {
            setState(() {
              _width = initialWidth - ((initialWidth - 48.0) * _animation.value);
            });
          });
        _controller.forward();

    Timer(Duration(milliseconds: 3300), () {
      setState(() {
        _state = 2;
      });
    });
    Timer(Duration(milliseconds: 3000), () {
      setState(() {
        _state = 3;
      });
      Navigator.pushReplacementNamed(context, '/HomeScreen');
    });

  }

  Widget setUpSignInButton() {

    if(_state == 0){
      return Container(
        decoration: BoxDecoration(
          color: Color(0xFF0029a3),
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
        child: Text(
          'Sign In',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else if (_state == 1){
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.grey.shade900),
      );
    } else {
      return Icon(Icons.check, color: Colors.grey.shade900,);
    }

  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
      });
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: true);
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    if (authenticated){
      Navigator.pushReplacementNamed(context, "/HomeScreen");
    }
  }

  void _cancelAuthentication() {
    //auth.stopAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0.0, iconTheme: IconThemeData(color: Colors.grey.shade900),),
            body: Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: SizeConfig.safeBlockHorizontal * 10),
              constraints: BoxConstraints.expand(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Log In",
                      style: TextStyle(
                        color: Colors.grey.shade900,
                        fontSize: SizeConfig.safeBlockHorizontal * 7,
                        fontWeight: FontWeight.bold,
                        //letterSpacing: 1,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 2,
                    ),
                    Image(
                      image: AssetImage('assets/images/invoice_maker.png'),
                    ),
                    TextFormField(
                      style: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: SizeConfig.safeBlockHorizontal * 2,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(
                            color: Colors.grey.shade900,
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade700,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 2,
                    ),
                    TextFormField(
                      obscureText: passwordVisible,
                      style: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: SizeConfig.safeBlockHorizontal * 2,
                      ),
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              color: Colors.grey.shade900,
                              fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade700,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade700,
                            ),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              passwordVisible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey.shade700,
                            ),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                      child: Row(
                        children: <Widget>[
                          Text('Remember Me',
                            style: TextStyle(
                              color: Colors.grey.shade900,
                              fontSize: SizeConfig.safeBlockHorizontal * 5,
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockHorizontal * 5,
                          ),
                          Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    PhysicalModel(
                      color: Colors.transparent,
                      child: RaisedButton(
                        key: _globalKey,
                        onPressed: () {
                          setState(() {
                            if(_state == 0){
                              animateButton();
                            }
                          });
                        },
                        color: Colors.transparent,
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25)),
                        padding: EdgeInsets.all(0),
                        child: setUpSignInButton(),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0,25,0,0),
                        child: RichText(
                          text: TextSpan(
                              text: "Forgot ",
                              style: TextStyle(
                                color: Colors.grey.shade900,
                                fontSize: SizeConfig.safeBlockHorizontal * 5,
                              ),
                              children: [
                                TextSpan(
                                  text: "username",
                                  style: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer() ..onTap = () {
                                    //Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotUser()));
                                  },
                                ),
                                TextSpan(
                                  text: " or ",
                                  style: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                                  ),
                                ),
                                TextSpan(
                                  text: "password?",
                                  style: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer() ..onTap = () {
                                    //Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                                  },
                                )
                              ]
                          ),
                        ),
                      ),
                    ),
                    FlatButton(
                      padding: EdgeInsets.all(30),
                      onPressed: () {},
                      child: Text(
                        'Create an Account',
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: SizeConfig.safeBlockHorizontal * 5,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(IconData(0xe90d, fontFamily: 'MaterialIcons'),
                      color: Colors.grey.shade900,
                      size: SizeConfig.safeBlockVertical * 6,),
                      onPressed: () {
                        _authenticate();
                      },
                    )
                  ],
                ),
              ),
            ),
//            drawer: Drawer(
//              child: ListView(
//                padding: EdgeInsets.zero,
//                children: <Widget>[
//                  DrawerHeader(
//                    child: Text(
//                      'Hello',
//                      style: TextStyle(
//                        color: Colors.white,
//                        fontSize: 20,
//                        fontWeight: FontWeight.bold,
//                      ),
//                    ),
//                    decoration: BoxDecoration(
//                        color: Color(0xFF326FB7)
//                    ),
//                  ),
//                  ListTile(
//                    title: Text('Item 1'),
//                    onTap: () {
//                      Navigator.pop(context);
//                    } ,
//                  ),
//                  ListTile(
//                    title: Text('Item 2'),
//                    onTap: () {
//                      Navigator.pop(context);
//                    } ,
//                  )
//                ],
//              ),
//            )
        ),
      ],
    );
  }
}