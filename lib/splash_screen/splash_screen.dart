import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:networking_listview/pages/home_page.dart';
import 'package:networking_listview/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 10),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Lottie.asset('animation/1.json',height: 100,repeat: true,fit: BoxFit.fill)
        ],

        // children: [
        //   Lottie.asset('animation/1.json',height: 100,repeat: true,fit: BoxFit.fill)
        // ],
        // color: Colors.blue,
        // child: Center(
        //   child: Text("Welcome to you",style: TextStyle(
        //     fontSize: 34,
        //       fontWeight: FontWeight.w700,
        //     color: Colors.white
        //   ),),
        // ),
      ),


    );
  }
}
