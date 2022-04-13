import 'package:flutter/material.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;
class TSearch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Tsearch_State();
  }
}

class Tsearch_State extends State<TSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ElevatedButton(onPressed: Reschedule, child: Text("test"))),
    );
  }
  void Reschedule() {
    slideDialog.showSlideDialog(
      context: context,
      child: Text("Hello World"),
      // barrierColor: Colors.white.withOpacity(0.7),
      // pillColor: Colors.red,
      // backgroundColor: Colors.yellow,
    );
  }
}
