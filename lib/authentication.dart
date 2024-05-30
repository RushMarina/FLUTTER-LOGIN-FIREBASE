import 'package:flutter/material.dart';
import 'package:login_app/login.dart';
import 'package:login_app/registration.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool switchScreen = true;
  void togScreen() {
    setState(() {
      switchScreen = !switchScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(switchScreen){
      return Login(togScreen: togScreen);
    }
    return Registration(togScreen: togScreen);
  }
}