import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './categoryPage.dart';

class mainPage extends StatefulWidget {
  mainPage({Key key}) : super(key: key);
  @override
  _mainPageState createState() => _mainPageState();
}

ThemeData appTheme =
    ThemeData(primaryColor: Color(0xFFF3791A), fontFamily: 'Oxygen');

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
              leading: GestureDetector(
                child: Icon(CupertinoIcons.left_chevron),
              ),
              middle: Text('Home Page'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      debugPrint("settings button tapped");
                    },
                    child: Icon(CupertinoIcons.settings,
                        color: CupertinoColors.black),
                  ),
                ],
              )),
          child: Container(
              child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  child: TextField(
                    controller: TextEditingController(),
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                    cursorColor: appTheme.primaryColor,
                    decoration: InputDecoration(
                      hintText: 'Search Your Product',
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 14.0),
                      suffixIcon: Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Text(
                "Category",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  height: 150,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: categoryCards)),
              mainPageNearby,
              mainPageYouMayLike,
            ],
          )),
        ),
      ),
    );
  }
}

var mainPageNearby = Column(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Nearby', style: TextStyle(color: Colors.black, fontSize: 18.0)),
          Spacer(),
          Text('See all',
              style: TextStyle(fontSize: 16.0, color: appTheme.primaryColor)),
        ],
      ),
    ),
    Container(
      height: 230,
      child: ListView(scrollDirection: Axis.horizontal, children: fruitCards),
    )
  ],
);

var mainPageYouMayLike = Column(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('You may like',
              style: TextStyle(color: Colors.black, fontSize: 18.0)),
          Spacer(),
          Text('See all',
              style: TextStyle(fontSize: 16.0, color: appTheme.primaryColor)),
        ],
      ),
    ),
    Container(
      height: 230,
      child:
          ListView(scrollDirection: Axis.horizontal, children: suggestedCards),
    )
  ],
);

List<FruitCards> fruitCards = [
  FruitCards("assets/apple.jpeg", "Apples", "Sale", 4.50),
  FruitCards("assets/orange.jpeg", "Orange", "Sale", 3.20),
  FruitCards("assets/bread.jpeg", "Bread", "Sale", 2.30),
];

List<CategoryCards> categoryCards = [
  CategoryCards("assets/apple.jpeg", "Supermarket"),
  CategoryCards("assets/bread.jpeg", "BreadChain"),
  CategoryCards("assets/orange.jpeg", "Food")
];

List<FruitCards> suggestedCards = [
  FruitCards("assets/bread1.jpeg", "Bread 1", "Organic", 1.50),
  FruitCards("assets/bread2.jpeg", "Bread 2", "Organice", 1.20),
  FruitCards("assets/bread3.jpeg", "Bread 3", "Organice", 0.80)
];

class FruitCards extends StatelessWidget {
  final String imagePath, foodName, discount;
  final double price;

  FruitCards(this.imagePath, this.foodName, this.discount, this.price);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 210,
                  width: 160,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  height: 60,
                  width: 160,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black,
                            Colors.black.withOpacity(0.1)
                          ]),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                  right: 10,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            foodName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18),
                          ),
                          Text(
                            discount,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                                fontSize: 14),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 2.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Text(
                          "\$$price",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCards extends StatelessWidget {
  final String imagePath, categoryName;

  CategoryCards(this.imagePath, this.categoryName);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: () {
          print(this.categoryName + "Container clicked");
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => CategoryPage(data: this.categoryName)));
        },
        child: Container(
          width: 200,
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: Stack(children: <Widget>[
              Image.asset(
                this.imagePath,
                width: 200,
                height: 200,
                fit: BoxFit.fitWidth,
              ),
              Container(
                  height: 200,
                  width: 200,
                  color: Colors.black.withOpacity(0.5),
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(this.categoryName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))
                    ],
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
