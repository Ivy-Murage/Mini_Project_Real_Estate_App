import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 7, 25, 72),
        elevation: 0,
      ),
      body: Center(
        child: Text("Login Please"),
      ),
    );
  }
}
