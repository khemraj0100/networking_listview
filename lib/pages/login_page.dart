import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:networking_listview/bg_image.dart';
import 'package:networking_listview/pages/home_page.dart';
import 'package:networking_listview/utils/Constants.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page", textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          BgImage(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Card(
                  child: Column(
                    children: [
                      Form(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Enter  username",
                                    labelText: "username"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "Enter  Password",
                                    labelText: "password"),
                              ),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                                onPressed: () {
                                  Constants.prefs.setBool("loggedIn", true);
                                  // Navigator.push(context, MaterialPageRoute(builder:(context) => HomePage()));
                                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                                  // Navigator.pushReplacementNamed(context, "/home");
                                  Navigator.pushNamed(context, "/home");
                                },
                                child: Text("Login in")),
                            SizedBox(height: 20),
                            ElevatedButton(
                                onPressed: () {
                                  Constants.prefs.setBool("signUp", true);
                                  Navigator.pushNamed(context, "/signUp");
                                },
                                child: Text("Sign in"))
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
