import 'package:flutter/material.dart';
import 'dart:io';
import 'package:app_concept_flutter/presentation/widgets/NavigationBuilder.dart';
import 'package:flutter/cupertino.dart';


class ScaffoldWithNavigation extends StatelessWidget {
  final List<NavigationItem> navItems;
  final NavigationItem selectedItem;
  final AppBar appBar;
  final Color backgroundColor;
  final Widget body;
  final FloatingActionButton button;

  ScaffoldWithNavigation({
    this.backgroundColor,
    this.appBar,
    this.navItems,
    this.selectedItem,
    this.body,
    this.button,
  });

  @override
  Widget build(BuildContext context) {
    Widget drawer, bottomBar;
    if (Platform.isAndroid) {
      drawer = new Drawer(
          child: new ListView(
              children: navItems.map((item) {
                return new ListTile(
                    selected: item == selectedItem,
                    leading: item.icon,
                    title: new Text(item.title),
                    onTap: () {
                      Navigator.pop(context);
                      item.onTap();
                    });
              }).toList()));
    }
    if (Platform.isIOS) {
      bottomBar = new CupertinoTabBar(
        items: navItems
            .map((item) => new BottomNavigationBarItem(
            icon: item.icon, title: new Text(item.title)))
            .toList(),
        onTap: (idx) => navItems[idx].onTap(),
        currentIndex: navItems.indexOf(selectedItem),
      );
    }
    return new Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      bottomNavigationBar: bottomBar,
      drawer: drawer,
      body: body,
      floatingActionButton: button,
    );
  }
}