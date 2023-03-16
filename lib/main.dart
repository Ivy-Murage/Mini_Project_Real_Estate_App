import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app_mini_project/House_pages.dart';
import 'package:real_estate_app_mini_project/LoginPage.dart';
import 'package:real_estate_app_mini_project/Profile.dart';
import 'package:real_estate_app_mini_project/SignUp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:real_estate_app_mini_project/Signup_widget.dart';
import 'package:real_estate_app_mini_project/landingPage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: GoogleFonts.outfit().fontFamily,
          primaryColor: Color(0xff233C80)),
      home: MyHomePage(),
      routes: {
        SignUp.routeName: (context) {
          return SignUp();
        },
        LoginWidget.routeName: (context) => LoginWidget(),
        RealEstateProfilePage.routeName: (context) => RealEstateProfilePage()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 7, 25, 72),
        elevation: 0,
      ),
      body: StreamBuilder<User?>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HousePages();
          } else {
            return SingleChildScrollView(child: LandingPage());
          }
        },
      ),
    );
  }
}
