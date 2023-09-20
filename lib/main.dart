
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:networking_listview/pages/Login.dart';
import 'package:networking_listview/pages/home_page.dart';
import 'package:networking_listview/pages/login_page.dart';
import 'package:networking_listview/pages/opt.dart';
import 'package:networking_listview/pages/sign_up.dart';
import 'package:networking_listview/pages/sign_up_page.dart';
import 'package:networking_listview/splash_screen/splash_screen.dart';
import 'package:networking_listview/utils/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


//TEXTFILD AND CARD VIEW
Future main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs =await SharedPreferences.getInstance();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Awesome App",
    home: SplashScreen(),
    // Constants.prefs.getBool("loggedIn")==true ? HomePage() : LoginPage(),
    routes: {
      "/login":(context) => LoginPage(),
      "/login_real":(context) => Login(),
      "/home":(context) => HomePage(),
      "/signUp":(context) => SignUp(),
      "/sign_up":(context) => SignupScreen(),
      "/OtpScreen":(context) => OtpScreen()
    },
  ));
}


