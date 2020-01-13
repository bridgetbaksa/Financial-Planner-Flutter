import 'package:flutter/material.dart';
import 'package:app_concept_flutter/presentation/screens/login_screen.dart';
import 'package:app_concept_flutter/presentation/screens/welcome_screen.dart';
import 'package:app_concept_flutter/presentation/screens/forgot_userid.dart';
import 'package:app_concept_flutter/presentation/screens/app_tutorial.dart';
import 'package:app_concept_flutter/presentation/screens/home_screen.dart';
import 'package:app_concept_flutter/presentation/screens/create_account.dart';
import 'package:app_concept_flutter/presentation/screens/home.dart';
import 'package:flutter/services.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: AppTutorial(),
        routes: {
          '/WelcomeScreen': (context) => WelcomeScreen(),
          '/LoginScreen': (context) => LoginScreen(),
          '/ForgotUser': (context) => ForgotUser(),
          '/HomeScreen': (context) => HomeScreen(),
          '/CreateAccount': (context) => CreateAccount(),
          '/Home': (context) => Home(),

        }
    );
  }
}