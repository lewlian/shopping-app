import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './cartPage.dart';
import './mainPage.dart';
import './profilePage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.shopping_cart), title: Text("Cart")),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              title: Text("Profile")),
        ]),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CartPage();
              break;
            case 1:
              return mainPage();
              break;
            case 2:
              return ProfilePage();
              break;
            default:
              return mainPage();
              break;
          }
        });
  }
}
