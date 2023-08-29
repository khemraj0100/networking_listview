
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:networking_listview/pages/home_page.dart';
import 'package:networking_listview/pages/login_page.dart';


//TEXTFILD AND CARD VIEW
void main()
{

  runApp(MaterialApp(
    title: "Awesome App",
    home: LoginPage(),
    routes: {
      "/login":(context) => LoginPage(),
      "/home":(context) => HomePage()
    },
  ));
}


