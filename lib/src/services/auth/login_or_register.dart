
import 'package:chatapp/src/pages/login_page.dart';
import 'package:chatapp/src/pages/regster_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  @override
  _LoginOrRegisterState createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLogin = true;
  // toggle between login and register screens
  void togglePages() {
    setState(() {
      showLogin = !showLogin;
    });
  }
  @override
  Widget build(BuildContext context) {
   if (showLogin) {
      return Login(
        onTap: togglePages,
      );
    } else {
      return Register(
        onTap: togglePages,
      );
    }
  }
}