import 'package:flutter/material.dart';
import 'package:flutter_lottie_plus/flutter_lottie_plus.dart';
import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:app_concept_flutter/presentation/core/SizeConfig.dart';

String selectedUrl = 'https://www.google.com';

class WelcomeScreen extends StatefulWidget {

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with TickerProviderStateMixin{

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  //Lottie Animation

  LottieController loController;
  StreamController<double> newProgressStream;

  AnimationController controller;
  Animation<double> animation;

//  final snackBar = SnackBar(
//    content: Text(
//      'Want to browse or apply for coverage?'
//    ),
//    action: SnackBarAction(label: 'Apply', onPressed: (){}),
//  );


  void onViewCreatedFile(LottieController controller) {
    this.loController = controller;
    newProgressStream.stream.listen((double progress) {
      this.loController.setAnimationProgress(progress);
    });
  }

  //WebView
  // Instance of WebView plugin
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  // On destroy stream
  StreamSubscription _onDestroy;

  // On urlChanged stream
  StreamSubscription<String> _onUrlChanged;


  final _urlCtrl = TextEditingController(text: selectedUrl);

  final _codeCtrl = TextEditingController(text: 'window.navigator.userAgent');

  final _history = [];

  @override
  void initState() {
    super.initState();

    flutterWebViewPlugin.close();

    _urlCtrl.addListener(() {
      selectedUrl = _urlCtrl.text;
    });


    // Add a listener to on url changed
    _onUrlChanged = flutterWebViewPlugin.onUrlChanged.listen((String url) {
      if(url.contains('q=james')) {
        print('James was searched');
        Navigator.of(context).pop();
      }
    });

    controller = AnimationController(
        duration: const Duration(seconds: 5), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.forward();

    //WidgetsBinding.instance.addPostFrameCallback((_) => _scaffoldKey.currentState.showSnackBar(snackBar));

  }

  @override
  void dispose() {
    // Every listener should be canceled, the same should be done with this stream.
    _onDestroy.cancel();
    _onUrlChanged.cancel();

    flutterWebViewPlugin.dispose();

    super.dispose();
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
              //padding: EdgeInsets.fromLTRB(50, 50, 50, 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Welcome to',
                        style: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: SizeConfig.safeBlockHorizontal * 6,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'My Simple',
                      style: TextStyle(
                        color: Colors.grey.shade900,
                        fontSize: SizeConfig.safeBlockHorizontal * 7,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Finance Planner',
                      style: TextStyle(
                        color: Colors.grey.shade900,
                        fontSize: SizeConfig.safeBlockHorizontal * 7,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/LoginScreen');
                    },
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25)),
                    padding: EdgeInsets.all(0),
                    child: Container(
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
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/CreateAccount');
                    },
                    child: Text(
                      'Create an Account',
                      style: TextStyle(
                        color: Colors.grey.shade900,
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Container(
                    height: SizeConfig.safeBlockVertical * 50,
                    width: SizeConfig.safeBlockHorizontal * 70,
                    child: LottieView.fromFile(
                      filePath: "assets/animations/onboarding-meeting.json",
                      autoPlay: true,
                      loop: false,
                      onViewCreated: onViewCreatedFile,
                    ),
                  ),
//                  Center(
//                    child: FadeTransition(
//                      opacity: animation,
//                      child: Text(
//                        "Relax, you're covered",
//                        style: TextStyle(
//                          color: Colors.white,
//                          fontSize: 16,
//                        ),
//                      ),
//                    ),
//                  )
                ],
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

