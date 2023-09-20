import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formfild = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Form(
            key: _formfild,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/profile.png",
                  height: 200,
                  width: 200,
                ),
                SizedBox(height: 60),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email)),
                  validator: (value){
                    RegExp regex =  RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                    if(value!.isEmpty){
                      return "Enter Email Address";
                    }
                    else if(!(regex.hasMatch(value))){
                      return "Your Email address is Invalid";
                    }
                    // if (!(regex.hasMatch(value)))
                    //   return "Your Email address is Invalid";

                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: passController,
                  obscureText: passToggle,
                  decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;

                          });
                        },
                        child: Icon(passToggle
                            ? Icons.visibility_off
                            : Icons.visibility),
                      )
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter Password";
                    }
                    else if(passController.text.length < 6){
                      return "Password Length should be less then 6 digits";

                    }
                  },

                ),
                SizedBox(height: 60),
                InkWell(
                  onTap: () {
                    if(_formfild.currentState!.validate()){
                      print("LogIn Successfully") ;
                      Navigator.pushNamed(context, "/home");
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("LogIn Successfully"),
                      ));
                      emailController.clear();
                     passController.clear();
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        "Log In",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextButton(onPressed: () {
                      Navigator.pushNamed(context, "/sign_up");
                    }, child: Text(
                      "Sign Up",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
