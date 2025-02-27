import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sara_music/Screens/Edit_Profile.dart';
import 'package:sara_music/Screens/MyDrawer.dart';
import 'package:sara_music/Screens/Settings_Page.dart';
import 'package:sara_music/Shop/colors.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

class ProfileState extends State<Profile> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
    // late bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    // return BlurryModalProgressHUD(
    //     inAsyncCall: isLoading,
    //     blurEffectIntensity: 4,
    //     progressIndicator: SpinKitFadingCircle(
    //     color: Colors.pink,
    //     size: 90.0,
    //   ),
    //     dismissible: false,
    //     opacity: 0.4,
    //     color: black,
    //     child: 
    return Scaffold(
            drawer: MyDrawer(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 10, right: 10),
                        child: InkWell(
                          child: Image.asset(
                            'images/icons-menu.png',
                            height: 30,
                          ),
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, top: 15, bottom: 5),
                        child: Text(
                          'My Profile',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(color: Colors.black),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 15, left: 130),
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Settings_Page()));
                            },
                    //         onPressed: () async {
                    //   setState(() {
                    //     isLoading = true;
                    //   });

                    //   await Future.delayed(Duration(seconds: 3), () {
                    //     setState(() {
                    //       isLoading = !isLoading;
                    //     });
                    //   });
                    // },
                            icon: Icon(Icons.settings),
                            alignment: Alignment.centerRight,
                            iconSize: 30,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: CircleAvatar(
                      radius: 90,
                      backgroundImage: AssetImage('images/ehab.jpg'),
                    ),
                  ),
                  ListTile(
                    title: Center(child: Text('Ehab Sarrawi')),
                    subtitle: Center(child: Text('Violin Student ')),
                  ),
                  ListTile(
                    title: Text('About me '),
                    subtitle: Text(
                        '  Ehab Sarrawi ,I have a love and passion for learning and playing music. '),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: Text('Education'),
                    subtitle:
                        Text('  Bachelor\'s degree in Computer Engineering '),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 50, bottom: 10),
                    child: ElevatedButton(
                      child: Text("Edit Profile"),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Edit_Profile()));
                      },
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        primary: Colors.pink[600],
                        onPrimary: Colors.white,
                        minimumSize: const Size(150, 40),
                        textStyle: TextStyle(
                          fontSize: 18,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 40),
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
