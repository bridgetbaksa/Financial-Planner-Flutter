import 'package:flutter/material.dart';
import 'package:flutter_lottie_plus/flutter_lottie_plus.dart';
import 'dart:async';
import 'package:app_concept_flutter/presentation/core/SizeConfig.dart';

class AppTutorial extends StatefulWidget {
  @override
  _AppTutorialState createState() => _AppTutorialState();
}

class _AppTutorialState extends State<AppTutorial> {

  var scrollDirection = Axis.horizontal;
  LottieController loController;
  StreamController<double> newProgressStream;

  _AppTutorialState() {
    newProgressStream = new StreamController<double>();
  }

  static final GlobalKey<ScaffoldState> _scaffoldKey =
  GlobalKey<ScaffoldState>();

  final controller = PageController(
    initialPage: 0,
  );

  void onViewCreatedFile(LottieController controller) {
    this.loController = controller;
    newProgressStream.stream.listen((double progress) {
      this.loController.setAnimationProgress(progress);
    });
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
          key: _scaffoldKey,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/WelcomeScreen');
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Color(0xFF0029a3),
                    fontSize: 15,
                  ),
                ),
              )
            ],
          ),
          body: PageView(
            controller: controller,
            scrollDirection: scrollDirection,
            pageSnapping: true,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      maxRadius: 120,
                      backgroundColor: Color(0xFFECEEF9),
                      child: Padding(
                        padding: const EdgeInsets.all(40),
                        child: LottieView.fromFile(
                            filePath: "assets/animations/calculating-loop.json",
                            autoPlay: true,
                            loop: true,
                            onViewCreated: onViewCreatedFile,
                        ),
                      ),
                    ),
                    Text(
                      "Explore your Finances",
                      style: TextStyle(
                        color: Colors.grey.shade900,
                        fontSize: SizeConfig.safeBlockHorizontal * 7,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Access important financial information, such as:\n"
                          "• Your balance\n"
                          "• Your current or upcoming bills\n"
                          "• Your spending history\n"
                          "• Investments and stocks\n",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: SizeConfig.safeBlockHorizontal * 4,
                        height: 1.5,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          controller.nextPage(duration: Duration(seconds: 1), curve: Curves.ease);
                        });
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
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.fiber_manual_record,
                          color: Color(0xFF7BBAF5),
                          size: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(Icons.fiber_manual_record,
                            color: Color(0x807BBAF5),
                            size: 20,
                          ),
                        ),
                        Icon(Icons.fiber_manual_record,
                          color: Color(0x807BBAF5),
                          size: 20,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(50),
                constraints: BoxConstraints.expand(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      maxRadius: 120,
                      backgroundColor: Color(0xFFECEEF9),
                      child: Padding(
                        padding: const EdgeInsets.all(40),
                        child: LottieView.fromFile(
                          filePath: "assets/animations/floating-object.json",
                          autoPlay: true,
                          loop: true,
                          onViewCreated: onViewCreatedFile,
                        ),
                      ),
                    ),
                    Text(
                      "Discover your Potential",
                      style: TextStyle(
                        color: Colors.grey.shade900,
                        fontSize: SizeConfig.safeBlockHorizontal * 6.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Take control of your finances for a healthy and stable financial future. Use this app to plan ahead and make your dream retirement a reality.",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: SizeConfig.safeBlockHorizontal * 4,
                        height: 1.5,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          controller.nextPage(duration: Duration(seconds: 1), curve: Curves.ease);
                        });
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
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.fiber_manual_record,
                          color: Color(0x807BBAF5),
                          size: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(Icons.fiber_manual_record,
                            color: Color(0xFF7BBAF5),
                            size: 20,
                          ),
                        ),
                        Icon(Icons.fiber_manual_record,
                          color: Color(0x807BBAF5),
                          size: 20,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(50),
                constraints: BoxConstraints.expand(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      maxRadius: 120,
                      backgroundColor: Color(0xFFECEEF9),
                      child: Padding(
                        padding: const EdgeInsets.all(40),
                        child: LottieView.fromFile(
                          filePath: "assets/animations/identifying.json",
                          autoPlay: true,
                          loop: true,
                          onViewCreated: onViewCreatedFile,
                        ),
                      ),
                    ),
                    Text(
                      "Seek Financial Guidance",
                      style: TextStyle(
                        color: Colors.grey.shade900,
                        fontSize: SizeConfig.safeBlockHorizontal * 7,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Not sure where to start? Chat with our Financial Planners 24/7 to help create goals and manageable budgets.",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: SizeConfig.safeBlockHorizontal * 4,
                        height: 1.5
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/WelcomeScreen');
                      },
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25)),
                      padding: EdgeInsets.all(0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF0029a3),
                            borderRadius: BorderRadius.circular(25),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 70),
                        child: Text(
                          'Get Started!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.fiber_manual_record,
                          color: Color(0x807BBAF5),
                          size: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(Icons.fiber_manual_record,
                            color: Color(0x807BBAF5),
                            size: 20,
                          ),
                        ),
                        Icon(Icons.fiber_manual_record,
                          color: Color(0xFF7BBAF5),
                          size: 20,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


