import 'package:flutter/material.dart';
import 'dart:io';

class NavigationItem {
  final Icon icon;
  final String title;
  final VoidCallback onTap;

  NavigationItem({this.icon, this.title, this.onTap});
}

class NavigationMenu {
  final List<NavigationItem> items;

  NavigationMenu({this.items});

  Drawer get drawer {
    if (!Platform.isAndroid) {
      return null;
    }
    return new Drawer(
      child: new ListView(
          children: items
              .map((item) => new ListTile(
            leading: item.icon,
            title: new Text(item.title),
            onTap: item.onTap,
          ))
              .toList()),
    );
  }

  BottomNavigationBar get bottomBar {
    if (!Platform.isIOS) {
      return null;
    }
    return new BottomNavigationBar(
      items: items
          .map((item) => new BottomNavigationBarItem(
        icon: item.icon,
        title: new Text(item.title),
      ))
          .toList(),
      onTap: (idx) => items[idx].onTap(),
    );
  }
}