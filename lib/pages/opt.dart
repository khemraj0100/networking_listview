import 'package:flutter/material.dart';
import 'package:networking_listview/pages/Login.dart';

class OtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: OtpForm(),
      ),
    );
  }
}

class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final List<TextEditingController> _otpControllers = List.generate(4, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 200),
        const Text(
          'Enter the 4-digit OTP sent to your phone number',
          style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) => SizedBox(
              width: 50,
              child: TextFormField(
                controller: _otpControllers[index],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                maxLength: 1,
                validator: (value) {
                  if (value!.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please enter a digit"),
                    ));
                    return 'Please enter a digit';
                  }
                  if (value.length != 1) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Invalid digit"),
                    ));
                    // return 'Please enter a digit';

                    return 'Invalid digit';
                  }
                  return null;
                },
                onChanged: (value) {
                  if (value.isNotEmpty && index < 4) {
                    FocusScope.of(context).nextFocus();
                  }
                  else{
                      FocusScope.of(context).previousFocus();
                  }
                }

              ),
            ),
          ),
        ),
        const SizedBox(height: 30),

        InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const Login()));
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("OTP verify Successfully"),
              ));
            },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Center(
              child: Text(
                "Verify OTP",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )

      ],
    );
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
