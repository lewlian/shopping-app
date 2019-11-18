import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          leading: GestureDetector(child: Icon(CupertinoIcons.left_chevron)),
          middle: Text('Profile Page'),
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
      child: Text("Profile Page"),
    );
  }
}
