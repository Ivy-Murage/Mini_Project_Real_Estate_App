import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:real_estate_app_mini_project/SignUp.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 7, 25, 72),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText("Hello,\nLet's Get started",
                          textStyle: const TextStyle(
                              color: Color.fromARGB(255, 7, 25, 72),
                              letterSpacing: 3,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left)
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                FormWidget()
              ],
            ),
          )),
        )));
  }
}
