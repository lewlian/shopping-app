import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double totalPrice = 0.0;

  add(value) {
    setState(() {
      totalPrice += value;
    });
  }

  sub(value) {
    setState(() {
      totalPrice -= value;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<CheckoutItem> cartItems = [
      CheckoutItem(
        add: add,
        sub: sub,
        itemName: "apple",
        itemPrice: 1.99,
        imagePath: "assets/apple.jpeg",
      ),
      CheckoutItem(
        add: add,
        sub: sub,
        itemName: "orange",
        itemPrice: 2.99,
        imagePath: "assets/orange.jpeg",
      ),
      CheckoutItem(
          add: add,
          sub: sub,
          itemName: "bread1",
          itemPrice: 1.99,
          imagePath: "assets/bread1.jpeg"),
      CheckoutItem(
          add: add,
          sub: sub,
          itemName: "bread2",
          itemPrice: 1.50,
          imagePath: "assets/bread2.jpeg"),
      CheckoutItem(
          add: add,
          sub: sub,
          itemName: "bread3",
          itemPrice: 1.40,
          imagePath: "assets/bread3.jpeg")
    ];
    return MaterialApp(
      home: Scaffold(
        body: CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
                leading: GestureDetector(
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
                      child: Icon(CupertinoIcons.settings,
                          color: CupertinoColors.black),
                    ),
                  ],
                )),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  height: 700,
                  child: ListView(children: cartItems),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SizedBox(
                        width: 250,
                        height: 100,
                        child: RaisedButton(
                            color: Colors.blueAccent,
                            child: Text("Buy Now",
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            onPressed: () {
                              print("buy pressed");
                            }),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text("Total:",
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold)),
                          Text('\$${totalPrice.toStringAsFixed(2)}',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

class CheckoutItem extends StatefulWidget {
  final String itemName, imagePath;
  final double itemPrice;

  final Function(double) add;
  final Function(double) sub;

  CheckoutItem({
    this.add,
    this.sub,
    this.itemName,
    this.itemPrice,
    this.imagePath,
  });

  @override
  _CheckoutItemsState createState() => _CheckoutItemsState();
}

class _CheckoutItemsState extends State<CheckoutItem> {
  int _itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Image.asset(widget.imagePath,
                      height: 100, fit: BoxFit.cover)),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.itemName, style: TextStyle(fontSize: 24)),
                  Text((_itemCount * widget.itemPrice).toString())
                ],
              )),
              Container(
                //color: Colors.grey,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  children: <Widget>[
                    _itemCount != 0
                        ? IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () => setState(() {
                              _itemCount--;
                              widget.sub(widget.itemPrice);
                            }),
                          )
                        : Container(
                            padding: EdgeInsets.all(10),
                          ),
                    Text(
                      _itemCount.toString(),
                      textAlign: TextAlign.right,
                    ),
                    IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => setState(() {
                              _itemCount++;
                              widget.add(widget.itemPrice);
                            })),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
