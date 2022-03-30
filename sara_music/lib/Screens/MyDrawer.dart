import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Text(
                  "ES",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              accountName:
                  Text("Ehab", style: TextStyle(color: Colors.black)),
              accountEmail: Text("Ehab@gmail.com",
                  style: TextStyle(color: Colors.black))),
          ListTile(
            contentPadding: EdgeInsets.only(left: 25),
            horizontalTitleGap: 1,
            title: Text(
              "Home page",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            leading: Icon(
              IconData(0xf107, fontFamily: 'MaterialIcons'),
              color: Colors.black,
              size: 28,
            ),
            onTap: () {},
            selected: false,
            selectedColor: Color(0xFFcb1772),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 25),
            horizontalTitleGap: 1,
            title: Text(
              "Help",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            leading: Icon(
              Icons.help_outline,
              color: Colors.black,
              size: 28,
            ),
            onTap: () {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 25),
            horizontalTitleGap: 1,
            title: Text(
              "About",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            leading: Icon(
              Icons.error_outline,
              color: Colors.black,
              size: 28,
            ),
            onTap: () {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 25),
            horizontalTitleGap: 1,
            title: Text(
              "Settings",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            leading: Icon(
              Icons.settings,
              color: Colors.black,
              size: 28,
            ),
            onTap: () {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 30),
            horizontalTitleGap: 1,
            title: Text(
              "Log out",
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
            leading: Icon(
              Icons.logout_outlined,
              color: Colors.red,
              size: 28,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
