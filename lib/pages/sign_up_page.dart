import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:networking_listview/bg_image.dart';
import 'package:networking_listview/pages/home_page.dart';
import 'package:networking_listview/utils/Constants.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUp Page", textAlign: TextAlign.end),
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
                                ),                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "Enter  Phone Number",
                                        labelText: "Phone Number"),
                                  ),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                    onPressed: () {
                                      Constants.prefs.setBool("SignIn",true);

                                      Navigator.pushNamed(context, "/otp");

                                      }, child: Text("Sign in"))
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
