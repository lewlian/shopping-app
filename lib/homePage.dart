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
  int _selectedPage = 1;
  final _pageOptions = [CartPage(), mainPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    if (true) {
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
    } else {
      return MaterialApp(
          title: "Mike",
          theme: ThemeData(primarySwatch: Colors.blue),
          home: Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.menu),
              title: Text("TITLE"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.notification_important),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () {},
                ),
              ],
            ),
            body: _pageOptions[_selectedPage],
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: _selectedPage,
                onTap: (int index) {
                  setState(() {
                    _selectedPage = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    title: Text("Cart"),
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), title: Text("Home")),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), title: Text("Profile"))
                ]),
          ));
    }
  }
}
