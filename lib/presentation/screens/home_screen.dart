import 'package:flutter/material.dart';
import 'package:app_concept_flutter/presentation/widgets/BankCard.dart';
import 'package:app_concept_flutter/presentation/widgets/FadeIn.dart';
import 'package:app_concept_flutter/presentation/core/SizeConfig.dart';
import 'package:app_concept_flutter/presentation/widgets/ScaffoldWithNavigation.dart';
import 'package:app_concept_flutter/presentation/widgets/NavigationBuilder.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedItem = 0;
  final List<Widget> children = [];

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);

    var navItems = <NavigationItem>[
      NavigationItem(
        icon: Icon(Icons.home),
        title: 'Home',
        onTap: () {
          setState(() {
            selectedItem = 0;
          });
        }
      ),
      NavigationItem(
        icon: Icon(Icons.account_balance),
        title: 'Accounts',
        onTap: () {
          setState(() {
            selectedItem = 1;
          });
        }
      ),
      NavigationItem(
        icon: Icon(Icons.list),
        title: 'Transactions',
        onTap: (){
          setState(() {
            selectedItem = 2;
          });
        },
      ),
      NavigationItem(
        icon: Icon(Icons.compare_arrows),
        title: 'Transfers',
        onTap: (){
          setState(() {
            selectedItem = 3;
          });
        },
      ),
      NavigationItem(
        icon: Icon(Icons.person),
        title: 'Profile',
        onTap: (){
          setState(() {
            selectedItem = 4;
          });
        },
      ),
    ];

    return ScaffoldWithNavigation(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF0029a3),
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
            fontSize: SizeConfig.safeBlockHorizontal * 6,
          ),
        ),
      ),
      body:
     SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,0,40),
                    child: Image(
                      image: AssetImage('assets/images/home-image.png'),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.white,
                    onPressed: (){},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 90),
                      child: Text('View Transactions',
                        style: TextStyle(
                          color: Colors.blueGrey.shade900,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(300, 0, 0, 30),
                    child: RawMaterialButton(
                      onPressed: () {},
                      child: Text(
                        '3',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      shape: CircleBorder(),
                      elevation: 2,
                      fillColor: Color(0xFF0029a3),
                      padding: EdgeInsets.all(5),
                    ),
                  )
                ],
              ),
              FadeIn(2, BankCard()),
              FadeIn(3, BankCard()),
              FadeIn(4, BankCard()),
            ],
          ),
        ),
      ),
        navItems: navItems,
        selectedItem: navItems[selectedItem],
    );
  }
}

