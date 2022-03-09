import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sara_music/Screens/Categories_Screen.dart';
import 'package:sara_music/Screens/Category.dart';
import 'package:sara_music/Screens/Details_screen.dart';
import 'package:sara_music/Screens/Profile.dart';
import 'package:sara_music/Screens/bottom_bar.dart';
import 'package:sara_music/authi/ForgetPassword.dart';
import 'package:sara_music/authi/ResetPassword.dart';
import 'package:sara_music/authi/Verify.dart';
import 'package:sara_music/authi/login.dart';
import 'package:sara_music/authi/Signup.dart';
import 'package:sara_music/Screens/Homepage.dart';
import 'package:sara_music/authi/IntroPage.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      theme: ThemeData(
          primaryColor: Colors.pink[600],
          buttonColor: Colors.pink[600],
          inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Color(0xfff2f9fe),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ))),
      routes: {
        "login": (context) => Login(),
        "Signup": (context) => Signup(),
        "ForgetPassword": (context) => ForgetPassword(),
        "HomePage": (context) => Homepage(),
        "Bottom_bar": (context) => bottom_bar(),
        "Categories": (context) => Categories_Screen(),
        "ResetPass": (context) => ResetPassword(),
      },
    );
  }
}
