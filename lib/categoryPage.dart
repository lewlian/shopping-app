import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './mainPage.dart';

class CategoryPage extends StatelessWidget {
  final String data;
  List<FruitCards> fruitCards = [
    FruitCards("assets/apple.jpeg", "Apples", "Sale", 4.50),
    FruitCards("assets/orange.jpeg", "Orange", "Sale", 3.20),
    FruitCards("assets/bread.jpeg", "Bread", "Sale", 2.30),
    FruitCards("assets/bread1.jpeg", "Bread 1", "Organic", 1.50),
    FruitCards("assets/bread2.jpeg", "Bread 2", "Organice", 1.20),
    FruitCards("assets/bread3.jpeg", "Bread 3", "Organice", 0.80)
  ];
  CategoryPage({this.data});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(CupertinoIcons.left_chevron),
          ),
          middle: Text("Your Cart"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  debugPrint("settings button tapped");
                },
                child:
                    Icon(CupertinoIcons.settings, color: CupertinoColors.black),
              ),
            ],
          )),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "BreadChain -",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text("Nearby",
                        style: TextStyle(
                          fontSize: 18,
                        )),
                  )
                ],
              )),
              Container(
                child: GridView.count(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(10),
                    mainAxisSpacing: 2,
                    childAspectRatio: 0.9,
                    crossAxisCount: 2,
                    children: fruitCards),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
