import 'package:flutter/material.dart';
import 'package:blackcoffer/utilities/buttons.dart';

class UserPhoneNo extends StatefulWidget {
  const UserPhoneNo({super.key});

  @override
  State<UserPhoneNo> createState() => _UserPhoneNoState();
}

class _UserPhoneNoState extends State<UserPhoneNo> {
  TextEditingController countrycode = TextEditingController();

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
                    const Expanded(
                        child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Enter your phone number'))),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              RoundButtons(
                  title: "Send the OTP",
                  onTap: () {
                    Navigator.pushNamed(context, 'otp');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
