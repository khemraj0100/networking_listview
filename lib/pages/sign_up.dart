import 'package:flutter/material.dart';
import 'package:networking_listview/pages/ImagePickerDemo.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: SignUpForm(),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: 30,),
          Image.asset(
            "images/person1.webp",
            height: 200,
            width: 200,
            fit: BoxFit.fill,

          ),

          const SizedBox(height: 30),
          TextFormField(
            controller: usernameController,
            decoration: const InputDecoration(
                labelText: "User Name",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person)),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            decoration: const InputDecoration(
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
            keyboardType: TextInputType.phone,
            controller: phoneController,
              decoration: const InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone)),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your phone number';
              }
              // Add phone number format validation here if needed.
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: passController,
            obscureText: passToggle,
            decoration: InputDecoration(
                labelText: "Password",
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock),
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
          SizedBox(height: 30,),
          InkWell(
            onTap: () {
              if(_formKey.currentState!.validate()){
                print("LogIn Successfully") ;
                Navigator.pushNamed(context, "/OtpScreen");
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Sign-up Successfully"),
                ));
                // Form is valid, perform signup logic here.
                // You can access the fields using the respective controllers.
                final username = usernameController.text;
                final email = emailController.text;
                final phoneNumber = phoneController.text;
                final password = passController.text;
                // emailController.clear();
                // passController.clear();
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
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        SizedBox(height: 20,)
        ,
          InkWell(
            onTap: () {

                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => ImagePickerDemo()));

            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                child: Text(
                  "Image Picker",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passController.dispose();
    super.dispose();
  }
}
