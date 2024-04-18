import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:blackcoffer/utilities/buttons.dart';
import 'package:flutter/services.dart';

class UserPhoneNo extends StatefulWidget {
  const UserPhoneNo({super.key});
  static String verify = "";


  @override
  State<UserPhoneNo> createState() => _UserPhoneNoState();
}

class _UserPhoneNoState extends State<UserPhoneNo> {
  TextEditingController countrycode = TextEditingController();
  var phonenums = "";
  final TextEditingController _phoneNumberController = TextEditingController();
  String? _phoneNumberError;
  
  @override
  void initState() {
    countrycode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/blackcoffer.png'),
              const SizedBox(height: 40),
              const Text('Phone Verification',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              const Text(
                  'We need to register your mobile number before getting started!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  )),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey.shade800),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 35,
                      child: TextField(
                        controller: countrycode,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text("|",
                        style: TextStyle(
                            color: Colors.blueGrey.shade800, fontSize: 32)),
                    const SizedBox(width: 10),
                    Expanded(
                        child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _phoneNumberController,
                            inputFormatters: [LengthLimitingTextInputFormatter(10)],
                            onChanged: (value) {
                              phonenums = value;
                            },
                            decoration: InputDecoration(
                               errorText: _phoneNumberError,
                                hintText: 'Enter your phone number'))),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              RoundButtons(
                  title: "Send the OTP",
                  onTap: () async {
                     if (_isValidPhoneNumber(_phoneNumberController.text)) {
                  setState(() {
                    _phoneNumberError = null;
                  });
                  // Handle valid phone number
                  print('Valid phone number: ${_phoneNumberController.text}');
                } else {
                  setState(() {
                    _phoneNumberError = 'Invalid phone number';
                  });
                }
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: countrycode.text + phonenums,
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        UserPhoneNo.verify = verificationId;
                        Navigator.pushNamed(context, 'otp');
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

bool _isValidPhoneNumber(String phoneNumber) {
    // Simple validation for 10-digit phone number
     final RegExp regex = RegExp(r'^[0-9]{10}$');
     return regex.hasMatch(phoneNumber);
   // return phoneNumber.length == 10 && int.tryParse(phoneNumber) != null;
  }

