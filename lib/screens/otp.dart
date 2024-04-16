import 'package:blackcoffer/utilities/buttons.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class UserOtp extends StatefulWidget {
  const UserOtp({super.key});

  @override
  State<UserOtp> createState() => _UserOtpState();
}

class _UserOtpState extends State<UserOtp> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
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
    );
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
              const Pinput(
                length: 6,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
              ),
              const SizedBox(height: 20),
              RoundButtons(title: "Verify the OTP", onTap: () {}),
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
