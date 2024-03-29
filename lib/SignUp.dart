import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:real_estate_app_mini_project/LoginPage.dart';
import 'package:real_estate_app_mini_project/main.dart';

class FormWidget extends StatefulWidget {

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  bool _isHidden = true;

  final formKey = GlobalKey<FormState>();

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
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    if (passwordConfirmed()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim());
      } on FirebaseAuthException catch (e) {
        print(e);
      }
 

      Navigator.pushNamed(context, LoginWidget.routeName);
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
                key: formKey,
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
                                borderSide:
                                    BorderSide(color: Color(0xffF0F0F0))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    width: 2.0, color: Color(0xffF0F0F0)))),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? "Enter a valid email"
                                : null,
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
                              _isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Color(0xffF0F0F0),
                            ),
                          ),
                          label: Text(
                            "Password",
                            style: TextStyle(color: Color(0xffF0F0F0)),
                          ),
                          prefixIcon:
                              Icon(Icons.lock, color: Color(0xffF0F0F0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xffF0F0F0))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  width: 2.0, color: Color(0xffF0F0F0))),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value != null && value.length < 6
                            ? "Enter a password with 6 characters or more"
                            : null,
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
                                _isHidden
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color(0xffF0F0F0),
                              ),
                            ),
                            label: Text(
                              "Password Confirmation",
                              style: TextStyle(color: Color(0xffF0F0F0)),
                            ),
                            prefixIcon:
                                Icon(Icons.lock, color: Color(0xffF0F0F0)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Color(0xffF0F0F0))),
                            iconColor: Color(0xffF0F0F0),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  width: 2.0,
                                  color: Color(0xffF0F0F0),
                                ))),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value != null && value.length < 6
                            ? "Passowrd doesn't match"
                            : null,
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
                            child: Text("sign up".toUpperCase(),
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          )),
                      Align(
                          alignment: AlignmentDirectional.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account ',
                                style: TextStyle(color: Color(0xffF0F0F0)),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => LoginWidget()));
                                },
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ))
                    ])),
          )),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  // void toggle() {
  //   setState(() {
  //     _isLogin = !_isLogin;
  //   });
  // }
}
