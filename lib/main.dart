import 'package:blackcoffer/screens/home.dart';
import 'package:blackcoffer/screens/otp.dart';
import 'package:blackcoffer/screens/phone.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'utilities/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'phone',
    routes: {
      'phone': (context) => UserPhoneNo(),
      'otp': (context) => UserOtp(),
      'home':(context) => MyHomePage(),
    },
    theme: ThemeData(brightness: Brightness.light),
  ));
}
