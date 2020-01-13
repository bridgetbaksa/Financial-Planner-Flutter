import 'package:flutter/material.dart';
import 'package:app_concept_flutter/presentation/widgets/ScaffoldWithNavigation.dart';
import 'package:app_concept_flutter/presentation/core/SizeConfig.dart';
import 'package:app_concept_flutter/presentation/widgets/NavigationBuilder.dart';
import 'package:app_concept_flutter/presentation/screens/home_screen.dart';
import 'package:app_concept_flutter/presentation/screens/placeholder_screens.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    PlaceholderScreen(screenName: 'Accounts', screenColor: Colors.blueGrey,),
    PlaceholderScreen(screenName: 'Transactions', screenColor: Colors.yellow,),
    PlaceholderScreen(screenName: 'Transfers', screenColor: Colors.blue,),
    PlaceholderScreen(screenName: 'Profile', screenColor: Colors.greenAccent,),
  ];

  @override
  Widget build(BuildContext context) {

    var navItems = <NavigationItem>[
      NavigationItem(
          icon: Icon(Icons.home),
          title: 'Home',
          onTap: () {
            setState(() {
              _currentIndex = 0;
            });
          }
      ),
      NavigationItem(
          icon: Icon(Icons.receipt),
          title: 'Accounts',
          onTap: () {
            setState(() {
              _currentIndex = 1;
            });
          }
      ),
      NavigationItem(
        icon: Icon(Icons.people),
        title: 'Transactions',
          onTap: () {
            setState(() {
              _currentIndex = 2;
            });
          }
      ),
      NavigationItem(
        icon: Icon(Icons.help),
        title: 'Transfers',
          onTap: () {
            setState(() {
              _currentIndex = 3;
            });
          }
      ),
      NavigationItem(
        icon: Icon(Icons.person),
        title: 'Profile',
          onTap: () {
            setState(() {
              _currentIndex = 4;
            });
          }
      ),
    ];

    SizeConfig().init(context);

    return ScaffoldWithNavigation(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        title: Text(
          navItems[_currentIndex].title,
          style: TextStyle(
            color: Colors.white,
            fontSize: SizeConfig.safeBlockHorizontal * 6,
          ),
        ),
      ),
      body: _children[_currentIndex],
      navItems: navItems,
    );
  }
}
