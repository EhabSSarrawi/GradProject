import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sara_music/Screens/bottom_bar.dart';

class Details_Screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Details_ScreenState();
  }
}

class Details_ScreenState extends State<Details_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Image.asset(
                    'images/icons-back.png',
                    height: 30,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                    type: PageTransitionType.leftToRightWithFade,
                    alignment: Alignment.topCenter,
                    child: bottom_bar(),
                    duration: Duration(seconds: 2),
                  ),);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
