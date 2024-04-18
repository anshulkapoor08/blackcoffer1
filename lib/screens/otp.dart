import 'package:blackcoffer/screens/phone.dart';
import 'package:blackcoffer/utilities/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class UserOtp extends StatefulWidget {
   UserOtp({super.key});
  
  

  @override
  State<UserOtp> createState() => _UserOtpState();
}

class _UserOtpState extends State<UserOtp> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool _showOtpError = false;
  String _otpErrorMessage = '';
  
  @override
  Widget build(BuildContext context) {
    /*  final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );*/
    var code = "";
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
      ),
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
              Pinput(
                onChanged: (value) {
                  code = value;
                },
                length: 6,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                errorText: _showOtpError ? _otpErrorMessage : null,
              ),
              const SizedBox(height: 20),
              RoundButtons(
                  title: "Verify the OTP",
                  onTap: () async {
                    try {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: UserPhoneNo.verify,
                              smsCode: code);

                      await auth.signInWithCredential(credential);
                      Navigator.pushNamedAndRemoveUntil(
                          context, 'home', (route) => false);
                    } catch (e) {
                      if (e is FirebaseAuthException &&
                          e.code == 'invalid-verification-code') {
                        setState(() {
                          _showOtpError = true;
                          _otpErrorMessage =
                              'Invalid OTP. Please enter the correct code.';
                        });
                        // Optional: Reset error state after a short delay
                        Future.delayed(const Duration(seconds: 2), () {
                          setState(() {
                            _showOtpError = false;
                          });
                        });
                      }
                    }
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, 'phone', (route) => false);
                      },
                      child: const Text("Edit the phone number ?",
                          style: TextStyle(color: Colors.black, fontSize: 16)))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
