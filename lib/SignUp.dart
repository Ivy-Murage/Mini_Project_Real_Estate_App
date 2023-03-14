import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:real_estate_app_mini_project/LoginPage.dart';

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

class FormWidget extends StatefulWidget {
  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  bool _isHidden = true;
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future SignUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    }
  }

  bool passwordConfirmed() {
    if (passwordController.text.trim() ==
        confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: TextStyle(color: Color(0xffF0F0F0)),
                  controller: emailController,
                  decoration: InputDecoration(
                      label: Text(
                        "Email",
                        style: TextStyle(color: Color(0xffF0F0F0)),
                      ),
                      prefixIcon: Icon(Icons.mark_email_unread_outlined,
                          color: Color(0xffF0F0F0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xffF0F0F0))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              width: 2.0, color: Color(0xffF0F0F0)))),
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: _isHidden,
                  style: TextStyle(color: Color(0xffF0F0F0)),
                  controller: passwordController,
                  decoration: InputDecoration(
                    suffix: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(
                        _isHidden ? Icons.visibility : Icons.visibility_off,
                        color: Color(0xffF0F0F0),
                      ),
                    ),
                    label: Text(
                      "Password",
                      style: TextStyle(color: Color(0xffF0F0F0)),
                    ),
                    prefixIcon: Icon(Icons.lock, color: Color(0xffF0F0F0)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xffF0F0F0))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 2.0, color: Color(0xffF0F0F0))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: _isHidden,
                  style: TextStyle(color: Color(0xffF0F0F0)),
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                      suffix: InkWell(
                        onTap: _togglePasswordView,
                        child: Icon(
                          _isHidden ? Icons.visibility : Icons.visibility_off,
                          color: Color(0xffF0F0F0),
                        ),
                      ),
                      label: Text(
                        "Password Confirmation",
                        style: TextStyle(color: Color(0xffF0F0F0)),
                      ),
                      prefixIcon: Icon(Icons.lock, color: Color(0xffF0F0F0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xffF0F0F0))),
                      iconColor: Color(0xffF0F0F0),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 2.0,
                            color: Color(0xffF0F0F0),
                          ))),
                ),
                SizedBox(height: 20),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF0F0F0)),
                      onPressed: () {
                        SignUp();
                      },
                      child: Text("signup".toUpperCase(),
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    )),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return LoginPage();
                          },
                        ));
                      },
                      child: Text.rich(TextSpan(children: [
                        TextSpan(text: "Already Have an Account?"),
                        TextSpan(text: "Login")
                      ]))),
                )
              ],
            )),
          )),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
