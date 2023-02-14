import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Container(
                child: Column(
      children: [Text("SIGN UP"), SizedBox(height: 20), FormWidget()],
    ))));
  }
}

class FormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          height: 500,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 7, 25, 72),
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      label: Text(
                        "Username",
                        style: TextStyle(color: Color(0xffF0F0F0)),
                      ),
                      prefixIcon: Icon(
                        Icons.person_outline_rounded,
                        color: Color(0xffF0F0F0),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF0F0F0))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2.0, color: Color(0xffF0F0F0)))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      label: Text(
                        "Email",
                        style: TextStyle(color: Color(0xffF0F0F0)),
                      ),
                      prefixIcon: Icon(Icons.mark_email_unread_outlined,
                          color: Color(0xffF0F0F0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF0F0F0))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2.0, color: Color(0xffF0F0F0)))),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                      label: Text(
                        "Password",
                        style: TextStyle(color: Color(0xffF0F0F0)),
                      ),
                      prefixIcon: Icon(Icons.password_outlined,
                          color: Color(0xffF0F0F0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF0F0F0))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2.0, color: Color(0xffF0F0F0)))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      label: Text(
                        "Password Confirmation",
                        style: TextStyle(color: Color(0xffF0F0F0)),
                      ),
                      prefixIcon: Icon(Icons.mark_email_unread_outlined,
                          color: Color(0xffF0F0F0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF0F0F0))),
                      iconColor: Color(0xffF0F0F0),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2.0, color: Color(0xffF0F0F0)))),
                ),
                SizedBox(height: 20),
                SizedBox(
                    child: ElevatedButton(
                        onPressed: () {}, child: Text("SIGN UP")))
              ],
            )),
          )),
    );
  }
}

class FormThemeData {
  static InputDecorationTheme lightInputTheme = const InputDecorationTheme(
      prefixIconColor: Color(0xffF0F0F0),
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.0, color: Color(0xffF0F0F0))));
}
