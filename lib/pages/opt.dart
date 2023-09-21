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
  final List<TextEditingController> _otpControllers =
  List.generate(4, (index) => TextEditingController());

  bool _isValidOTP = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 200),
        const Text(
          'Enter the 4-digit OTP sent to your phone number',
          style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            4,
                (index) => SizedBox(
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
                    return 'Please enter a digit';
                  }
                  if (value.length != 1) {
                    return 'Invalid digit';
                  }
                  return null;
                },
                onChanged: (value) {
                  if (value.isNotEmpty && index < 3) {
                    FocusScope.of(context).nextFocus();
                  } else if (value.isEmpty && index > 0) {
                    FocusScope.of(context).previousFocus();
                  }
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        InkWell(
          onTap: () {
            bool allFieldsFilled = true;
            for (var controller in _otpControllers) {
              if (controller.text.isEmpty) {
                allFieldsFilled = false;
                break;
              }
            }

            if (allFieldsFilled) {
              // Validate OTP here (e.g., compare with the expected OTP)
              String enteredOTP = _otpControllers.map((controller) => controller.text).join();
              if (enteredOTP == "1234") {
                // Replace with your OTP validation logic
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("OTP verified successfully"),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Invalid OTP"),
                  ),
                );
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Please enter all 4 digits"),
                ),
              );
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
                "Verify OTP",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
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
