import 'package:flutter/material.dart';

class Shop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ShopState();
  }
}

class ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Text("Shop"),),
    );
  }
}
